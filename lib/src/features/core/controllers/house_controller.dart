import 'package:boarding_ease/src/features/authentication/models/user_model.dart';
import 'package:boarding_ease/src/features/core/models/house_model.dart';
import 'package:boarding_ease/src/repository/authentication_repository/authentication_repository.dart';
import 'package:boarding_ease/src/repository/house_repository/house_repository.dart';
import 'package:boarding_ease/src/repository/user_repository/user_repository.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HouseController extends GetxController {
  static HouseController get instance => Get.find();

  final houseName = TextEditingController();
  final location = TextEditingController();
  final noOfRooms = TextEditingController();
  final pricePerRoom = TextEditingController();

  /**  final String? id;
  final String? ownerName;
  final String? email;
  final String houseName;
  final String location;
  final String? phoneNo;
  bool isBooked = false;
  final int noOfRooms;*/

  final houseRepository = Get.put(HouseRepository());

  void createHouse(BoardingHouseModel house) async {
    await houseRepository.createHouse(house);
  }
}
