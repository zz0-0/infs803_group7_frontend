import 'dart:async';
import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:infs803_group7_frontend/global.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TokenManager {
  static String? _token;
  static String? _refreshToken;
  late DateTime _expiryTime;
  late Timer _expiryTimer;

  Future<String?> get token async {
    String? token;
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    if (!kIsWeb) {
      token = await storage.read(key: "access");
    } else {
      token = prefs.getString('access');
    }
    return token;
  }

  Future<void> setToken(
    String access,
    String refresh,
    // int expiresIn,
  ) async {
    _token = access;
    _refreshToken = refresh;
    _expiryTime = DateTime.now().add(const Duration(seconds: 10 * 60));
    _startExpiryTimer();
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    if (!kIsWeb) {
      await storage.write(
        key: "access",
        value: access.replaceAll('"', ''),
      );
      await storage.write(
        key: "refresh",
        value: refresh.replaceAll('"', ''),
      );
    } else {
      await prefs.setString('access', access.replaceAll('"', ''));
      await prefs.setString('refresh', refresh.replaceAll('"', ''));
    }
  }

  Future<bool> deleteToken() async {
    bool isDelete = false;
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    if (!kIsWeb) {
      await storage.delete(
        key: "access",
      );
      isDelete = true;
    } else {
      isDelete = await prefs.remove('access');
    }

    return isDelete;
  }

  Future<bool> deleteAllToken() async {
    bool isDelete = false;
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    if (!kIsWeb) {
      await storage.delete(
        key: "access",
      );
      await storage.delete(
        key: "refresh",
      );
      isDelete = true;
    } else {
      isDelete = await prefs.remove('access') && await prefs.remove('refresh');
    }

    return isDelete;
  }

  void _startExpiryTimer() {
    final Duration remainingTime = _expiryTime.difference(DateTime.now());
    _expiryTimer = Timer(remainingTime, _handleTokenExpiry);
  }

  void _handleTokenExpiry() {
    deleteToken();
    refreshToken();
  }

  Future<http.Response?> refreshToken() async {
    if (_refreshToken != null) {
      final response = await http.post(
        Uri.parse("$url/refresh"),
        body: json.encode({
          'refresh_token': _refreshToken!,
        }),
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );

      if (response.statusCode == 200) {
        final data = json.decode(response.body) as Map<String, dynamic>;
        final access = data['access'].toString();
        final refresh = data['refresh'].toString();
        setToken(access, refresh);
        return response;
      } else {
        // Handle token refresh failure
        _handleTokenRefreshFailure();
      }
    }
    return null;
  }

  void _handleTokenRefreshFailure() {
    // Navigate to login screen or handle token refresh
  }

  void dispose() {
    _expiryTimer.cancel();
  }
}
