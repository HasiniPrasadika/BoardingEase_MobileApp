import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../features/core/models/reservation_model.dart';

class ReservationRepository extends GetxController {
  static ReservationRepository get instance => Get.find();

  final _db = FirebaseFirestore.instance;

  createReservation(ReservationModel reservation) async {
    await _db
        .collection("Reservations")
        .add(reservation.toJson())
        .whenComplete(
          () => Get.snackbar("Success", "Your reservation has been created.",
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

  Future<ReservationModel> getReservationDetails(String userId) async {
    final snapshot = await _db
        .collection("Reservations")
        .where("UserId", isEqualTo: userId)
        .get();
    final reservationData =
        snapshot.docs.map((e) => ReservationModel.fromSnapshot(e)).single;
    return reservationData;
  }

  Future<List<ReservationModel>> allReservations(String userId) async {
    final snapshot = await _db
        .collection("Reservations")
        .where("UserId", isEqualTo: userId)
        .get();
    final reservationData =
        snapshot.docs.map((e) => ReservationModel.fromSnapshot(e)).toList();
    return reservationData;
  }

  Future<void> updateReservationRecord(ReservationModel reservation) async {
    await _db
        .collection("Reservations")
        .doc(reservation.id)
        .update(reservation.toJson());
  }
}
