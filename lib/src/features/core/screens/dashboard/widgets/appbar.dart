import 'package:flutter/material.dart';

class DashboardAppBar extends StatelessWidget implements PreferredSizeWidget {
  const DashboardAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0.0,
      backgroundColor: Color.fromARGB(255, 200, 184, 173),
      foregroundColor: const Color.fromARGB(255, 0, 0, 0),
      title: const Row(
        children: [
          Text(
            "BoardingEase",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
          )
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(55);
}

//Size get preferredSize => const Size.fromHeight(55);