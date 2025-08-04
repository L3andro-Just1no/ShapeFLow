import 'package:flutter/material.dart';

class AppProvider extends ChangeNotifier {
  bool _isOnboarded = false;
  String _userName = '';
  String _userEmail = '';
  int _userAge = 0;
  String _userGoal = '';
  String _userFitnessLevel = '';

  bool get isOnboarded => _isOnboarded;
  String get userName => _userName;
  String get userEmail => _userEmail;
  int get userAge => _userAge;
  String get userGoal => _userGoal;
  String get userFitnessLevel => _userFitnessLevel;

  void setOnboarded(bool value) {
    _isOnboarded = value;
    notifyListeners();
  }

  void setUserInfo({
    String? name,
    String? email,
    int? age,
    String? goal,
    String? fitnessLevel,
  }) {
    if (name != null) _userName = name;
    if (email != null) _userEmail = email;
    if (age != null) _userAge = age;
    if (goal != null) _userGoal = goal;
    if (fitnessLevel != null) _userFitnessLevel = fitnessLevel;
    notifyListeners();
  }

  void resetUser() {
    _userName = '';
    _userEmail = '';
    _userAge = 0;
    _userGoal = '';
    _userFitnessLevel = '';
    _isOnboarded = false;
    notifyListeners();
  }
} 