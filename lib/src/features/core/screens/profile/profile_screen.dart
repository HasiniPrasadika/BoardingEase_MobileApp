import 'package:boarding_ease/src/constants/colors.dart';
import 'package:boarding_ease/src/constants/image_strings.dart';
import 'package:boarding_ease/src/constants/sizes.dart';
import 'package:boarding_ease/src/constants/text_strings.dart';
import 'package:boarding_ease/src/repository/authentication_repository/authentication_repository.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

import 'update_profile_screen.dart';
import 'widgets/profile_menu.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 24.0),
      child: Container(
        padding: const EdgeInsets.all(tDefaultSize),
        child: Column(
          children: [
            /// -- IMAGE
            Stack(
              children: [
                SizedBox(
                  width: 120,
                  height: 120,
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(100),
                      child:
                          const Image(image: AssetImage(tForgetPasswordImage))),
                ),
                Positioned(
                  bottom: 0,
                  right: 0,
                  child: Container(
                    width: 35,
                    height: 35,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        color: Color.fromARGB(255, 206, 155, 138)),
                    child: const Icon(
                      LineAwesomeIcons.alternate_pencil,
                      color: Colors.black,
                      size: 20,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Text(tProfileHeading,
                style: Theme.of(context).textTheme.headlineMedium),
            Text(tProfileSubHeading,
                style: Theme.of(context).textTheme.bodyMedium),
            const SizedBox(height: 20),

            /// -- BUTTON
            SizedBox(
              width: 200,
              child: ElevatedButton(
                onPressed: () => Get.to(() => const UpdateProfileScreen()),
                style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromARGB(255, 206, 155, 138),
                    side: BorderSide.none,
                    shape: const StadiumBorder()),
                child: const Text(tEditProfile,
                    style: TextStyle(color: tDarkColor)),
              ),
            ),
            const SizedBox(height: 30),
            const Divider(),
            const SizedBox(height: 10),

            /// -- MENU
            ProfileMenuWidget(
              title: "Settings",
              icon: LineAwesomeIcons.cog,
              onPress: () {},
              iconColor: Color.fromARGB(255, 206, 155, 138),
            ),

            const Divider(),
            const SizedBox(height: 10),
            ProfileMenuWidget(
                title: "Information",
                icon: LineAwesomeIcons.info,
                onPress: () {},
                iconColor: Color.fromARGB(255, 206, 155, 138)),

            ProfileMenuWidget(
                title: "Logout",
                icon: Icons.logout_outlined,
                textColor: Colors.red,
                endIcon: false,
                onPress: () {
                  Get.defaultDialog(
                    title: "LOGOUT",
                    titleStyle: const TextStyle(fontSize: 20),
                    content: const Padding(
                      padding: EdgeInsets.symmetric(vertical: 15.0),
                      child: Text("Are you sure, you want to Logout?"),
                    ),
                    confirm: Expanded(
                      child: ElevatedButton(
                        onPressed: () =>
                            AuthenticationRepository.instance.logout(),
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.redAccent,
                            side: BorderSide.none),
                        child: const Text("Yes"),
                      ),
                    ),
                    cancel: OutlinedButton(
                        onPressed: () => Get.back(), child: const Text("No")),
                  );
                },
                iconColor: Color.fromARGB(255, 206, 155, 138)),
          ],
        ),
      ),
    );
  }
}
