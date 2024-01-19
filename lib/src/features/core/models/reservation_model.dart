import 'package:cloud_firestore/cloud_firestore.dart';

class ReservationModel {
  final String? id; // Unique identifier for the booking
  final String? userId; // ID of the user making the booking
  final String? boardingHouseId; // ID of the boarding house being booked
  final DateTime checkInDate; // Date when the user plans to check in
  final DateTime checkOutDate; // Date when the user plans to check out
  final int numberOfRooms; // Number of rooms being booked
  final double totalPrice; // Total cost of the booking
  // Indicates whether the booking is confirmed by the owner

  ReservationModel({
    this.id,
    this.userId,
    this.boardingHouseId,
    required this.checkInDate,
    required this.checkOutDate,
    required this.numberOfRooms,
    required this.totalPrice,
  });
  toJson() {
    return {
      "UserId": userId,
      "BoardingHouseId": boardingHouseId,
      "CheckInDate": checkInDate.toIso8601String(),
      "CheckOutDate": checkOutDate.toIso8601String(),
      "NumberOfRooms": numberOfRooms,
      "TotalPrice": totalPrice,

      // ... other attributes ...
    };
  }

  factory ReservationModel.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> document) {
    final data = document.data()!;
    return ReservationModel(
      id: document.id,
      userId: data["UserId"],
      boardingHouseId: data["BoardingHouseId"],
      checkInDate: DateTime.parse(data["CheckInDate"]),
      checkOutDate: DateTime.parse(data["CheckOutDate"]),
      numberOfRooms: data["NumberOfRooms"],
      totalPrice: data["TotalPrice"],

      // ... other attributes ...
    );
  }
}
