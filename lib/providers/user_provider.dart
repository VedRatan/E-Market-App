import 'package:emarket/models/user.dart';
import 'package:flutter/material.dart';

class UserProvider extends ChangeNotifier {
  User _user = User(
      email: '',
      token: '',
      id: '',
      name: 'name',
      password: 'password',
      address: 'address',
      type: 'type',
      cart: []);

  User get user => _user;

  void setUser(String user) //to update the user
  {
    _user = User.fromJson(user);
    notifyListeners();
  }

  void setUserFromModel(User user) {
    _user = user;
    notifyListeners();
  }
}
