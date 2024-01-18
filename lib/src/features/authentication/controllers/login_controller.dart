import 'package:boarding_ease/src/features/authentication/models/user_model.dart';
import 'package:boarding_ease/src/repository/authentication_repository/authentication_repository.dart';
import 'package:boarding_ease/src/repository/user_repository/user_repository.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  static LoginController get instance => Get.find();
  final email = TextEditingController();
  final password = TextEditingController();

  void loginUser(String email, String password) {
    AuthenticationRepository.instance
        .loginWithEmailAndPassword(email, password);
  }
}
