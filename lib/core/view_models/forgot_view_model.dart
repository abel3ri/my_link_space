import 'package:flutter/material.dart';
import 'package:my_link_space/core/models/services/reset_model.dart';

class ForgotPasswordViewModel extends ChangeNotifier {
  final ResetModel _resetModel = ResetModel();

  bool _isLoading = false;
  bool get isLoading => _isLoading;
  String email = '';
  String? _errorMessage;
  String? get errorMessage => _errorMessage;

  Future<void> requestPasswordReset(String email) async {
    _isLoading = true;
    notifyListeners();

    try {
      await _resetModel.forgotPassword(email);
    } catch (error) {
      _errorMessage = error.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> verifyCode(String email, String code) async {
    _isLoading = true;
    notifyListeners();

    try {
      await _resetModel.verifyCode(email, code);
    } catch (error) {
      _errorMessage = error.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> resetPassword(String email, String code, String password) async {
    _isLoading = true;
    notifyListeners();

    try {
      await _resetModel.resetPassword(email, code, password);
    } catch (error) {
      _errorMessage = error.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  void setemail(value) {
    email = value;
    notifyListeners();
  }
}
