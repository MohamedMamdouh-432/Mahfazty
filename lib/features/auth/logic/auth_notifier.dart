import 'package:flutter/material.dart';
import 'package:mahfazty/core/helpers/constants.dart';
import 'package:mahfazty/core/services/cache_service.dart';

class AuthNotifier extends ChangeNotifier {
  bool _isLoggedIn = false;
  bool _isLoading = true;

  bool get isLoggedIn => _isLoggedIn;
  bool get isLoading => _isLoading;

  AuthNotifier() {
    checkAuthStatus();
  }

  Future<void> checkAuthStatus() async {
    try {
      final token = await CacheService.getSecuredString(Constants.userId);
      _isLoggedIn = token != null && token.isNotEmpty;
    } catch (_) {
      _isLoggedIn = false;
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
  
  void onLoginSuccess() {
    _isLoggedIn = true;
    notifyListeners();
  }

  void onLogout() {
    _isLoggedIn = false;
    notifyListeners();
  }
}
