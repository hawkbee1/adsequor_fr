import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:adsequor_fr/providers/theme_provider.dart';

class ThemeSwitcher extends ConsumerWidget {
  const ThemeSwitcher({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentThemeMode = ref.watch(themeProvider);

    // Get icon and tooltip text based on current theme mode
    IconData iconData;
    String tooltip;

    switch (currentThemeMode) {
      case ThemeMode.system:
        iconData = Icons.brightness_auto;
        tooltip = 'System Theme';
        break;
      case ThemeMode.light:
        iconData = Icons.light_mode;
        tooltip = 'Light Theme';
        break;
      case ThemeMode.dark:
        iconData = Icons.dark_mode;
        tooltip = 'Dark Theme';
        break;
    }

    return IconButton(
      icon: Icon(iconData),
      tooltip: tooltip,
      onPressed: () {
        // Toggle theme using the provider
        ref.read(themeProvider.notifier).toggleTheme();
      },
    );
  }
}
