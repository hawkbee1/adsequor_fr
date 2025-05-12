import 'package:adsequor_fr/screens/one_page_screen.dart';
import 'package:flutter/material.dart';
import 'package:adsequor_fr/models/company.dart';
import 'package:adsequor_fr/screens/about_screen.dart';
import 'package:adsequor_fr/screens/contact_screen.dart';
import 'package:adsequor_fr/screens/projects_screen.dart';
import 'package:adsequor_fr/screens/services_screen.dart';
import 'package:adsequor_fr/widgets/theme_switcher.dart';

class AppNavBar extends StatelessWidget implements PreferredSizeWidget {
  final String currentPage;

  const AppNavBar({super.key, required this.currentPage});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: GestureDetector(
        onTap: () {
          if (currentPage != 'home') {
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (_) => const OnePageScreen()),
            );
          }
        },
        child: Text(adsequorProfile.name),
      ),
      actions: [
        _buildNavItem(
          context: context,
          title: 'Services',
          isSelected: currentPage == 'services',
          onTap: () {
            if (currentPage != 'services') {
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (_) => const ServicesScreen()),
              );
            }
          },
        ),
        _buildNavItem(
          context: context,
          title: 'Projects',
          isSelected: currentPage == 'projects',
          onTap: () {
            if (currentPage != 'projects') {
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (_) => const ProjectsScreen()),
              );
            }
          },
        ),
        _buildNavItem(
          context: context,
          title: 'About',
          isSelected: currentPage == 'about',
          onTap: () {
            if (currentPage != 'about') {
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (_) => const AboutScreen()),
              );
            }
          },
        ),
        _buildNavItem(
          context: context,
          title: 'Contact',
          isSelected: currentPage == 'contact',
          isButton: true,
          onTap: () {
            if (currentPage != 'contact') {
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (_) => const ContactScreen()),
              );
            }
          },
        ),
        // Add theme switcher button
        const ThemeSwitcher(),
        const SizedBox(width: 16),
      ],
    );
  }

  Widget _buildNavItem({
    required BuildContext context,
    required String title,
    required bool isSelected,
    required VoidCallback onTap,
    bool isButton = false,
  }) {
    if (isButton) {
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: ElevatedButton(
          onPressed: onTap,
          style: ElevatedButton.styleFrom(
            backgroundColor:
                isSelected
                    ? Theme.of(context).colorScheme.secondary
                    : Theme.of(context).colorScheme.primary,
            foregroundColor: Theme.of(context).colorScheme.onPrimary,
            padding: const EdgeInsets.symmetric(horizontal: 16),
          ),
          child: Text(title),
        ),
      );
    }

    return TextButton(
      onPressed: onTap,
      style: TextButton.styleFrom(
        foregroundColor:
            isSelected
                ? Theme.of(context).colorScheme.primary
                : Theme.of(context).colorScheme.onSurface,
        textStyle: TextStyle(
          fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
        ),
      ),
      child: Text(title),
    );
  }
}
