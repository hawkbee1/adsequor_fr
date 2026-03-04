import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:adsequor_fr/providers/theme_provider.dart';

class ThemeSwitcher extends ConsumerWidget {
  const ThemeSwitcher({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentThemeMode = ref.watch(themeProvider);

    final (iconData, tooltip) = switch (currentThemeMode) {
      ThemeMode.system => (Icons.brightness_auto, 'System Theme'),
      ThemeMode.light => (Icons.light_mode, 'Light Theme'),
      ThemeMode.dark => (Icons.dark_mode, 'Dark Theme'),
    };

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
