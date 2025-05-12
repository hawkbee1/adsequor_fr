import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:adsequor_fr/screens/one_page_screen.dart';
import 'package:adsequor_fr/utils/app_theme.dart';
import 'package:adsequor_fr/providers/theme_provider.dart';

void main() {
  runApp(
    // Wrap the entire app with ProviderScope to enable Riverpod
    const ProviderScope(child: MyApp()),
  );
}

// Convert to ConsumerWidget to access providers
class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Watch the theme provider to get current theme mode
    final themeMode = ref.watch(themeProvider);

    return MaterialApp(
      title: 'Adsequor',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: themeMode,
      home: const OnePageScreen(),
    );
  }
}
