import 'package:cloud_firestore/cloud_firestore.dart';

class BoardingHouseModel {
  final String? id;
  final String? ownerName;
  final String? email;
  final String houseName;
  final String location;
  final String? phoneNo;
  bool isBooked = false;
  final String noOfRooms;
  final double pricePerRoom;
  // final VoidCallback? onPress;

  BoardingHouseModel({
    this.id,
    this.ownerName,
    this.email,
    required this.houseName,
    required this.location,
    this.phoneNo,
    required this.isBooked,
    required this.noOfRooms,
    required this.pricePerRoom,
    //  this.onPress,
  });

  toJson() {
    return {
      "OwnerName": ownerName,
      "Email": email,
      "HouseName": houseName,
      "Location": location,
      "Phone": phoneNo,
      "IsBooked": isBooked,
      "NoOfRooms": noOfRooms,
      "PricePerRoom": pricePerRoom,
    };
  }

  factory BoardingHouseModel.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> document) {
    final data = document.data()!;
    return BoardingHouseModel(
        id: document.id,
        ownerName: data["OwnerName"],
        email: data["Email"],
        houseName: data["HouseName"],
        location: data["Location"],
        phoneNo: data["Phone"],
        isBooked: data["IsBooked"],
        noOfRooms: data["NoOfRooms"],
        pricePerRoom: data["PricePerRoom"]);
  }
  static List<BoardingHouseModel> list = [];
}

// class BoardingHouseModel {
//   final String HouseName;
//   final String OwnerName;
//   final String Location;
//   final String PhoneNo;
//   final String Email;
//   final String Description;
//   final bool IsBooked;
//   final VoidCallback? onPress;

//   BoardingHouseModel(this.HouseName, this.Location, this.Description, this.onPress, this.IsBooked, this.Email, this.OwnerName);

//   static List<BoardingHouseModel> list = [
//     BoardingHouseModel('JS', 'Java Script', '10 Lessons', null),
//     BoardingHouseModel('JS', 'Java Script', '10 Lessons', null),
//     BoardingHouseModel('JS', 'Java Script', '10 Lessons', null),
//     BoardingHouseModel('JS', 'Java Script', '10 Lessons', null),
//     BoardingHouseModel('JS', 'Java Script', '10 Lessons', null),
//   ];
// }
