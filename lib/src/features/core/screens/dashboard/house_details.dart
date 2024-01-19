import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../models/house_model.dart';
import 'reservation_form.dart';

class BoardingHouseDetailsScreen extends StatelessWidget {
  final BoardingHouseModel boardingHouse;

  const BoardingHouseDetailsScreen({required this.boardingHouse});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 200, 184, 173),
      appBar: AppBar(
        title: Text(boardingHouse.houseName),
        backgroundColor: Color.fromARGB(255, 200, 184, 173),
      ),
      body: Padding(
        padding: const EdgeInsets.all(0.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Display the image of the boarding house
            Container(
              height: 300.0,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(
                      "https://resofrance.eu/wp-content/uploads/2018/09/hotel-luxe-mandarin-oriental-paris.jpg"), // Replace with the actual image URL
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(150),
                  bottomRight: Radius.circular(150),
                ),
              ),
            ),
            SizedBox(height: 16.0),

            // Display details of the boarding house
            Text(
              'Location: ${boardingHouse.location}',
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8.0),
            Text(
              'House Owner: ${boardingHouse.ownerName}',
              style: TextStyle(fontSize: 16.0),
            ),
            SizedBox(height: 8.0),
            Text(
              'Contact Number: ${boardingHouse.phoneNo}',
              style: TextStyle(fontSize: 16.0),
            ),
            SizedBox(height: 8.0),
            Text(
              'Email: ${boardingHouse.email}',
              style: TextStyle(fontSize: 16.0),
            ),
            SizedBox(height: 8.0),
            Text(
              'Number of Rooms: ${boardingHouse.noOfRooms}',
              style: TextStyle(fontSize: 16.0),
            ),
            SizedBox(height: 16.0),

            // Add more details as needed

            // Add a button to book the boarding house
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: Color.fromARGB(255, 206, 155, 138),
                  side: BorderSide.none,
                  shape: const StadiumBorder()),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ReservationFormScreen(
                      boardingHouse: boardingHouse,
                      // Pass the selected boarding house
                    ),
                  ),
                );
              },
              child: Text(
                'Book Now',
                style: TextStyle(color: Colors.black),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
