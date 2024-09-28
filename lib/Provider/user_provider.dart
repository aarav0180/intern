// providers/user_provider.dart
import 'package:flutter/material.dart';
import '../API/api_service.dart';
import '../models/user_model.dart';

class UserProvider with ChangeNotifier {
  UserModel? _user;
  bool _isLoading = false;

  UserModel? get user => _user;
  bool get isLoading => _isLoading;

  Future<void> fetchUserData() async {
    _isLoading = true;
    notifyListeners();

    ApiService apiService = ApiService();
    _user = await apiService.getUserData();

    _isLoading = false;
    notifyListeners();
  }

  void updateProfileImage(String imagePath) {
    // Handle profile image update logic (mock or local storage)
    notifyListeners();
  }
}
