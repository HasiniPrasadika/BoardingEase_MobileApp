import 'package:boarding_ease/src/features/core/screens/dashboard/home.dart';
import 'package:boarding_ease/src/features/core/screens/dashboard/widgets/appbar.dart';
import 'package:boarding_ease/src/features/core/screens/profile/profile_screen.dart';
import 'package:boarding_ease/src/repository/authentication_repository/authentication_repository.dart';

import 'package:flutter/material.dart';

class SellDashboard extends StatefulWidget {
  const SellDashboard({super.key});

  @override
  State<SellDashboard> createState() => _SellDashboardState();
}

class _SellDashboardState extends State<SellDashboard> {
  final List _pages = [
    const Home(),
    const Center(
      child: Text("My reservations"),
    ),
    const ProfileScreen(),
  ];

  int _selectedTab = 0;
  _changeTab(int index) {
    setState(() {
      _selectedTab = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color.fromARGB(255, 200, 184, 173),
        appBar: const DashboardAppBar(),
        body: _pages[_selectedTab],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _selectedTab,
          onTap: (index) => _changeTab(index),
          unselectedItemColor: const Color(0xFFB7B7B7),
          selectedItemColor: const Color(0xFFFE8C68),
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'My Boarding Houses',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Publish',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Profile',
            ),
          ],
        ),
        drawer: Drawer(
          child: ListView(
            // Important: Remove any padding from the ListView.

            padding: EdgeInsets.zero,
            children: <Widget>[
              const UserAccountsDrawerHeader(
                accountName: Text("Rashmi Imasha"),
                accountEmail: Text("rimasha977@gmail.com"),
                currentAccountPicture: CircleAvatar(
                  backgroundColor: Colors.orange,
                  child: Text(
                    "R",
                    style: TextStyle(fontSize: 40.0),
                  ),
                ),
              ),
              ListTile(
                leading: const Icon(Icons.home),
                title: const Text("Home"),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: const Icon(Icons.settings),
                title: const Text("My Reservations"),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: const Icon(Icons.contacts),
                title: const Text("Logout"),
                onTap: () {
                  AuthenticationRepository.instance.logout();
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// class Dashboard extends StatelessWidget {
//   const Dashboard({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final textTheme = Theme.of(context).textTheme;

//     return SafeArea(
//       child: Scaffold(
//         appBar: const DashboardAppBar(),
//         body: SingleChildScrollView(
//           child: Container(
//             padding: const EdgeInsets.all(tDashboardPadding),
//             child: Column(
//               children: [
//                 //Heading
//                 Text(tDashboardTitle, style: textTheme.bodyMedium),
//                 Text(tDashboardHeading, style: textTheme.headlineSmall),
//                 const SizedBox(height: tDashboardPadding),
//                 //Search box
//                 DashboardSearchBox(textTheme: textTheme),
//                 const SizedBox(height: tDashboardPadding),

//                 //Categories
//                 DashboardCategories(textTheme: textTheme),
//                 const SizedBox(height: tDashboardPadding),

//                 //Banners
//                 const DashboardBanners(),
//                 const SizedBox(height: tDashboardPadding),

//                 //Top Courses

//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
