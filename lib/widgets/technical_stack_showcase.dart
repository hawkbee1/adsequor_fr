import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class TechnicalStackShowcase extends StatelessWidget {
  const TechnicalStackShowcase({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      color: Theme.of(context).colorScheme.surface,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Technical stack overview',
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                fontWeight: FontWeight.bold,
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
            const SizedBox(height: 12),
            Text(
              'A visual summary of how Dart, Flutter and Appwrite fit together across product delivery and deployment.',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            const SizedBox(height: 20),
            AspectRatio(
              aspectRatio: 5 / 3,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: SvgPicture.asset(
                  'assets/technical_stack.svg',
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
