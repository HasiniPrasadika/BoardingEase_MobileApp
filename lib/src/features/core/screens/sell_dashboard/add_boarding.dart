import 'package:boarding_ease/src/constants/image_strings.dart';
import 'package:boarding_ease/src/constants/sizes.dart';

import 'package:boarding_ease/src/features/core/models/house_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../authentication/models/user_model.dart';

import '../../controllers/house_controller.dart';
import '../../controllers/profile_controller.dart';
import '../signup_screen/form_header_widget.dart';

class HouseScreen extends StatefulWidget {
  const HouseScreen({Key? key}) : super(key: key);

  @override
  State<HouseScreen> createState() => _HouseScreenState();
}

class _HouseScreenState extends State<HouseScreen> {
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(HouseController());
    final pcontroller = Get.put(ProfileController());
    final _formKey = GlobalKey<FormState>();
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 200, 184, 173),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(tDefaultSize),
          child: FutureBuilder(
            future: pcontroller.getUserData(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                if (snapshot.hasData) {
                  UserModel user = snapshot.data as UserModel;

                  //Controllers

                  final email = TextEditingController(text: user.email);
                  final fullName = TextEditingController(text: user.fullname);
                  final phoneNo = TextEditingController(text: user.phoneNo);
                  return Column(
                    children: [
                      const FormHeaderWidget(
                        image: tWelcomeScreenImage,
                        title: "Add your Place",
                        subTitle: "Publish your boarding house here",
                        imageHeight: 0.15,
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: tFormHeight - 10),
                        child: Form(
                          key: _formKey,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              //Full Name
                              TextFormField(
                                controller: controller.houseName,
                                decoration: const InputDecoration(
                                    label: Text("House Name"),
                                    prefixIcon: Icon(Icons.house_outlined)),
                              ),
                              const SizedBox(height: tFormHeight - 20),
                              //Email
                              TextFormField(
                                controller: controller.location,
                                decoration: const InputDecoration(
                                    label: Text("Location"),
                                    prefixIcon:
                                        Icon(Icons.location_on_outlined)),
                              ),
                              const SizedBox(height: tFormHeight - 20),
                              //Email
                              TextFormField(
                                controller: controller.noOfRooms,
                                decoration: const InputDecoration(
                                    label: Text("Number of Rooms"),
                                    prefixIcon: Icon(Icons.numbers_outlined)),
                              ),

                              const SizedBox(height: tFormHeight - 20),
                              // Phone Number
                              TextFormField(
                                controller: controller.pricePerRoom,
                                decoration: const InputDecoration(
                                    label: Text("Price Per Room"),
                                    prefixIcon:
                                        Icon(Icons.price_change_outlined)),
                              ),
                              const SizedBox(height: tFormHeight - 20),
                              //Password

                              const SizedBox(height: tFormHeight - 10),
                              // Dropdown for selecting user role
                              // Display selected role

                              SizedBox(
                                width: double.infinity,
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      backgroundColor:
                                          Color.fromARGB(255, 206, 155, 138),
                                      side: BorderSide.none,
                                      shape: const StadiumBorder()),
                                  onPressed: () {
                                    if (_formKey.currentState!.validate()) {
                                      // Email and password authentication
                                      // SignUpController.instance.registerUser(controller.email.text.trim(), controller.password.text.trim());

                                      //phone Number authentication
                                      // SignUpController.instance
                                      //     .phoneAuthentication(controller.phoneNo.text.trim());
                                      // Get.to(() => const OTPScreen());

                                      //Get user and pass it to controller

                                      // final user = UserModel(
                                      //   email: controller.email.text.trim(),
                                      //   password: controller.password.text.trim(),
                                      //   fullname: controller.fullName.text.trim(),
                                      //   phoneNo: controller.phoneNo.text.trim(),
                                      // );
                                      final house = BoardingHouseModel(
                                        houseName:
                                            controller.houseName.text.trim(),
                                        location:
                                            controller.location.text.trim(),
                                        isBooked: false,
                                        noOfRooms:
                                            controller.noOfRooms.text.trim(),
                                        pricePerRoom: double.parse(controller
                                            .pricePerRoom.text
                                            .trim()),
                                        email: email.text,
                                        phoneNo: phoneNo.text,
                                        ownerName: fullName.text,
                                      );
                                      HouseController.instance
                                          .createHouse(house);
                                    }
                                  },
                                  child: const Text(
                                    "Add",
                                    style: TextStyle(color: Colors.black),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
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
      ),
    );
  }
}
