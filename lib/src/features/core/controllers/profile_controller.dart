import 'package:boarding_ease/src/repository/authentication_repository/authentication_repository.dart';
import 'package:boarding_ease/src/repository/user_repository/user_repository.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../authentication/models/user_model.dart';

class ProfileController extends GetxController {
  static ProfileController get instance => Get.find();

  //Repositories
  final _authRepo = Get.put(AuthenticationRepository());
  final _userRepo = Get.put(UserRepository());

  //get user email and pass it to fetch user record
  getUserData() {
    final email = _authRepo.firebaseUser.value?.email;
    if (email != null) {
      return _userRepo.getUserDetails(email);
    } else {
      Get.snackbar("Error", "Login to Continue");
    }
  }

  //Fetch list of user records
  Future<List<UserModel>> getAllUsers() async => await _userRepo.allUser();

  //update the user record
  updateRecord(UserModel user) async {
    await _userRepo.updateUserRecord(user);
  }
}
