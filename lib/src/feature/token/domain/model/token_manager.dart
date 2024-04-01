import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:infs803_group7_frontend/main.dart';

class TokenManager {
  String? _token;
  String? _refreshToken;
  late DateTime _expiryTime;
  late Timer _expiryTimer;

  String? get token => _token;

  Future<void> setToken(
    String token,
    String refreshToken,
    int expiresIn,
  ) async {
    _token = token;
    _refreshToken = refreshToken;
    _expiryTime = DateTime.now().add(Duration(seconds: expiresIn));
    _startExpiryTimer();
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
        Uri.parse(url),
        body: json.encode({
          'refresh_token': _refreshToken!,
        }),
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );

      if (response.statusCode == 200) {
        final data = json.decode(response.body) as Map<String, dynamic>;
        final String newToken = data['token'].toString();
        final int expiresIn = int.parse(data['expires_in'].toString());
        setToken(newToken, _refreshToken!, expiresIn);
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
