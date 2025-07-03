import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:alchemist/alchemist.dart';
import 'package:adsequor_fr/utils/app_theme.dart';

void main() {
  group('AppTheme Golden Tests', () {
    goldenTest(
      'Theme components render correctly',
      fileName: 'theme_components',
      builder: () => GoldenTestGroup(
        scenarioConstraints: const BoxConstraints(maxWidth: 400),
        children: [
          // Colors test
          GoldenTestScenario(
            name: 'Theme Colors',
            child: Wrap(
              spacing: 8,
              runSpacing: 8,
              children: [
                _ColorBox(color: AppTheme.seedColor, label: 'Seed Color'),
                _ColorBox(
                  color: AppTheme.lightTheme.colorScheme.primary,
                  label: 'Primary',
                ),
                _ColorBox(
                  color: AppTheme.lightTheme.colorScheme.secondary,
                  label: 'Secondary',
                ),
                _ColorBox(
                  color: AppTheme.lightTheme.colorScheme.surface,
                  label: 'Surface',
                ),
              ],
            ),
          ),

          // Buttons test
          GoldenTestScenario(
            name: 'Buttons',
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ElevatedButton(
                  onPressed: () {},
                  child: const Text('Elevated Button'),
                ),
                const SizedBox(height: 8),
                OutlinedButton(
                  onPressed: () {},
                  child: const Text('Outlined Button'),
                ),
                const SizedBox(height: 8),
                TextButton(onPressed: () {}, child: const Text('Text Button')),
              ],
            ),
          ),

          // Input Fields test
          GoldenTestScenario(
            name: 'Input Fields',
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const TextField(
                  decoration: InputDecoration(
                    labelText: 'Normal Input',
                    hintText: 'Enter text',
                  ),
                ),
                const SizedBox(height: 16),
                const TextField(
                  decoration: InputDecoration(
                    labelText: 'Error Input',
                    errorText: 'Error message',
                  ),
                ),
              ],
            ),
          ),

          // Cards test
          GoldenTestScenario(
            name: 'Cards',
            child: Card(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Card Title',
                      style: AppTheme.lightTheme.textTheme.titleLarge,
                    ),
                    const SizedBox(height: 8),
                    const Text('Card content with some example text'),
                  ],
                ),
              ),
            ),
          ),

          // Chips test
          GoldenTestScenario(
            name: 'Chips',
            child: Wrap(
              spacing: 8,
              children: [
                const Chip(label: Text('Default Chip')),
                Chip(
                  label: const Text('Selected Chip'),
                  backgroundColor:
                      AppTheme.lightTheme.colorScheme.primaryContainer,
                ),
              ],
            ),
          ),
        ],
      ),
    );

    // Test dark theme components
    goldenTest(
      'Dark theme components render correctly',
      fileName: 'dark_theme_components',
      builder: () => MaterialApp(
        theme: AppTheme.darkTheme,
        home: GoldenTestGroup(
          scenarioConstraints: const BoxConstraints(maxWidth: 400),
          children: [
            GoldenTestScenario(
              name: 'Dark Theme Colors',
              child: Wrap(
                spacing: 8,
                runSpacing: 8,
                children: [
                  _ColorBox(
                    color: AppTheme.darkTheme.colorScheme.primary,
                    label: 'Primary',
                  ),
                  _ColorBox(
                    color: AppTheme.darkTheme.colorScheme.surface,
                    label: 'Surface',
                  ),
                ],
              ),
            ),
            GoldenTestScenario(
              name: 'Dark Theme Components',
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ElevatedButton(
                    onPressed: () {},
                    child: const Text('Dark Button'),
                  ),
                  const SizedBox(height: 16),
                  const Card(
                    child: Padding(
                      padding: EdgeInsets.all(16.0),
                      child: Text('Dark Theme Card'),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );

    // Test responsive layouts
    goldenTest(
      'Components render correctly at different screen sizes',
      fileName: 'responsive_components',
      builder: () => MaterialApp(
        theme: AppTheme.lightTheme,
        home: GoldenTestGroup(
          children: [
            for (final size in [
              const Size(360, 640), // Mobile
              const Size(768, 1024), // Tablet
              const Size(1440, 900), // Desktop
            ])
              GoldenTestScenario(
                name: '${size.width.toInt()}x${size.height.toInt()}',
                constraints: BoxConstraints(
                  maxWidth: size.width,
                  maxHeight: size.height,
                ),
                child: _ResponsiveTestWidget(),
              ),
          ],
        ),
      ),
    );
  });
}

class _ColorBox extends StatelessWidget {
  const _ColorBox({required this.color, required this.label});

  final Color color;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 80,
          height: 80,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: Colors.grey.withAlpha(51)),
          ),
        ),
        const SizedBox(height: 4),
        Text(label, style: const TextStyle(fontSize: 12)),
      ],
    );
  }
}

class _ResponsiveTestWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(16),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Responsive Components',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            const SizedBox(height: 16),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: [
                ElevatedButton(
                  onPressed: () {},
                  child: const Text('Primary Action'),
                ),
                OutlinedButton(
                  onPressed: () {},
                  child: const Text('Secondary Action'),
                ),
              ],
            ),
            const SizedBox(height: 16),
            const TextField(
              decoration: InputDecoration(labelText: 'Responsive Input'),
            ),
          ],
        ),
      ),
    );
  }
}
