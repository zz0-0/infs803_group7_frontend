import 'dart:async';
import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:infs803_group7_frontend/global.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TokenManager {
  String? _token;
  String? _refreshToken;
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
    String token,
    // String refreshToken,
    // int expiresIn,
  ) async {
    // _token = token;
    // _refreshToken = refreshToken;
    // _expiryTime = DateTime.now().add(Duration(seconds: expiresIn));
    // _startExpiryTimer();
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    if (!kIsWeb) {
      await storage.write(
        key: "access",
        value: token.replaceAll('"', ''),
      );
    } else {
      await prefs.setString('access', token.replaceAll('"', ''));
    }
  }

  void _startExpiryTimer() {
    final Duration remainingTime = _expiryTime.difference(DateTime.now());
    _expiryTimer = Timer(remainingTime, _handleTokenExpiry);
  }

  void _handleTokenExpiry() {
    _token = null;
    _refreshToken = null;
    // Navigate to login screen or handle token refresh
  }

  Future<void> refreshToken() async {
    if (_refreshToken != null) {
      final response = await http.post(
        Uri.parse("$url/refresh"),
        body: json.encode({
          'refresh': _refreshToken!,
        }),
        headers: {
          "Authorization": 'Bearer $token',
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );

      if (response.statusCode == 200) {
        final data = json.decode(response.body) as Map<String, dynamic>;
        final String newToken = data['token'].toString();
        final int expiresIn = int.parse(data['expires_in'].toString());
        // setToken(newToken, _refreshToken!, expiresIn);
      } else {
        // Handle token refresh failure
        _handleTokenRefreshFailure();
      }
    } else {
      // Navigate to login screen or handle token refresh
    }
  }

  void _handleTokenRefreshFailure() {
    // Navigate to login screen or handle token refresh
  }

  void dispose() {
    _expiryTimer.cancel();
  }
}
