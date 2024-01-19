import 'package:boarding_ease/src/features/authentication/models/user_model.dart';
import 'package:boarding_ease/src/features/core/models/house_model.dart';
import 'package:boarding_ease/src/repository/authentication_repository/authentication_repository.dart';
import 'package:boarding_ease/src/repository/house_repository/house_repository.dart';
import 'package:boarding_ease/src/repository/user_repository/user_repository.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../repository/reservation_repository/reservation_repository.dart';
import '../models/reservation_model.dart';

class ReservationController extends GetxController {
  static ReservationController get instance => Get.find();

  final checkInDate = TextEditingController();
  final checkOutDate = TextEditingController();
  final noOfRooms = TextEditingController();

  // ignore: slash_for_doc_comments
  /**   "UserId": userId,
      "BoardingHouseId": boardingHouseId,
      "CheckInDate": checkInDate.toIso8601String(),
      "CheckOutDate": checkOutDate.toIso8601String(),
      "NumberOfRooms": numberOfRooms,
      "TotalPrice": totalPrice,*/

  final reservationRepository = Get.put(ReservationRepository());

  void createReservation(ReservationModel reservation) async {
    await reservationRepository.createReservation(reservation);
  }
}
