import 'package:adsequor_fr/widgets/schedule_now.dart';
import 'package:flutter/material.dart';
import 'package:adsequor_fr/models/company.dart';
import 'package:adsequor_fr/widgets/theme_switcher.dart';

class AppNavBar extends StatelessWidget implements PreferredSizeWidget {
  final String currentPage;

  const AppNavBar({super.key, required this.currentPage});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(adsequorProfile.name),
      actions: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: const ScheduleNow(),
        ), // Add theme switcher button
        const ThemeSwitcher(),
        const SizedBox(width: 16),
      ],
    );
  }
}
