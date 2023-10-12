import 'dart:convert';
import 'package:flutter/cupertino.dart';

import '../models/user_models.dart';
import 'package:http/http.dart' as http;

class UserController {
  User user = User(id: 0, name: "", email: "", phone: "", website: "");
  ValueNotifier<bool> isLoading = ValueNotifier<bool>(true);

  UserController() {
    init();
  }

  void dispose() {
    isLoading.dispose();
  }

  void init() async {
    user = await _getUser();
    isLoading.value = false;
  }

  Future<User> _getUser() async {
    var url = Uri.https('jsonplaceholder.typicode.com', '/users/1');
    var response = await http.get(url);
    User user = User.fromJson(jsonDecode(response.body));
    return user;
  }
}
