import 'package:boarding_ease/src/features/authentication/models/user_model.dart';
import 'package:boarding_ease/src/features/core/models/house_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HouseRepository extends GetxController {
  static HouseRepository get instance => Get.find();

  final _db = FirebaseFirestore.instance;

  createHouse(BoardingHouseModel house) async {
    await _db
        .collection("Houses")
        .add(house.toJson())
        .whenComplete(
          () => Get.snackbar("Success", "Your boarding house has been created.",
              snackPosition: SnackPosition.BOTTOM,
              backgroundColor:
                  Color.fromARGB(255, 181, 111, 87).withOpacity(0.1),
              colorText: Color.fromARGB(255, 181, 111, 87)),
        )
        .catchError((error, StackTrace) {
      Get.snackbar("Error", "Something went wrong. Try again",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.redAccent.withOpacity(0.1),
          colorText: Colors.red);
      print(error.toString());
    });
  }

  Future<BoardingHouseModel> getHouseDetails(String email) async {
    final snapshot =
        await _db.collection("Houses").where("Email", isEqualTo: email).get();
    final houseData =
        snapshot.docs.map((e) => BoardingHouseModel.fromSnapshot(e)).single;
    return houseData;
  }

  Future<List<BoardingHouseModel>> allHouses() async {
    final snapshot = await _db.collection("Houses").get();
    final houseData =
        snapshot.docs.map((e) => BoardingHouseModel.fromSnapshot(e)).toList();
    return houseData;
  }

  Future<void> updateHouseRecord(BoardingHouseModel house) async {
    await _db.collection("Users").doc(house.id).update(house.toJson());
  }
}
