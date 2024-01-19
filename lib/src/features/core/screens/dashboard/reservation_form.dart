import 'package:boarding_ease/src/features/core/controllers/house_controller.dart';
import 'package:boarding_ease/src/features/core/models/reservation_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../authentication/models/user_model.dart';
import '../../controllers/profile_controller.dart';
import '../../controllers/reservation_controller.dart';
import '../../models/house_model.dart';

class ReservationFormScreen extends StatelessWidget {
  final BoardingHouseModel boardingHouse;

  ReservationFormScreen({super.key, required this.boardingHouse});
  final pcontroller = Get.put(ProfileController());
  final rcontroller = Get.put(ReservationController());

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 200, 184, 173),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 200, 184, 173),
        title: const Text('Reservation Form'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: FutureBuilder(
          future: pcontroller.getUserData(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              if (snapshot.hasData) {
                UserModel user = snapshot.data as UserModel;
                final id = TextEditingController(text: user.id);

                return Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      TextFormField(
                        controller: rcontroller.noOfRooms,
                        decoration:
                            const InputDecoration(labelText: 'Number of Rooms'),
                        keyboardType: TextInputType.number,
                      ),
                      const SizedBox(height: 16.0),
                      TextFormField(
                        controller: rcontroller.checkInDate,
                        decoration:
                            const InputDecoration(labelText: 'Check-In Date'),
                        onTap: () => _selectDate(context, true),
                      ),
                      const SizedBox(height: 16.0),
                      TextFormField(
                        controller: rcontroller.checkOutDate,
                        decoration:
                            const InputDecoration(labelText: 'Check-Out Date'),
                        onTap: () => _selectDate(context, false),
                      ),
                      const SizedBox(height: 16.0),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Color.fromARGB(255, 206, 155, 138),
                            side: BorderSide.none,
                            shape: const StadiumBorder()),
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            final reservation = ReservationModel(
                              userId: id.text,
                              boardingHouseId: boardingHouse.id.toString(),
                              checkInDate: DateTime.parse(
                                  rcontroller.checkInDate.text.trim()),
                              checkOutDate: DateTime.parse(
                                  rcontroller.checkOutDate.text.trim()),
                              numberOfRooms:
                                  int.parse(rcontroller.noOfRooms.text.trim()),
                              totalPrice: boardingHouse.pricePerRoom *
                                  int.parse(rcontroller.noOfRooms.text.trim()),
                            );
                            ReservationController.instance
                                .createReservation(reservation);
                            Get.back();
                          }
                          // Close the form after submission
                        },
                        child: const Text(
                          'Book Now',
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                    ],
                  ),
                );
              } else if (snapshot.hasError) {
                return Center(child: Text(snapshot.error.toString()));
              } else {
                return const Center(
                  child: Text('Something Went Wrong'),
                );
              }
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ),
      ),
    );
  }

  Future<void> _selectDate(BuildContext context, bool isCheckInDate) async {
    DateTime currentDate = DateTime.now();
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: currentDate,
      firstDate: currentDate,
      lastDate: DateTime(currentDate.year + 1),
    );

    if (pickedDate != null) {
      String formattedDate =
          "${pickedDate.year}-${pickedDate.month.toString().padLeft(2, '0')}-${pickedDate.day.toString().padLeft(2, '0')}";

      if (isCheckInDate) {
        rcontroller.checkInDate.text = formattedDate;
      } else {
        rcontroller.checkOutDate.text = formattedDate;
      }
    }
  }
}
