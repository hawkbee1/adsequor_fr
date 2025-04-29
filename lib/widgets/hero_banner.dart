import 'package:flutter/material.dart';
import 'package:adsequor_fr/screens/services_screen.dart';
import 'package:adsequor_fr/screens/contact_screen.dart';

class HeroBanner extends StatelessWidget {
  final String title;
  final String subtitle;
  final String? description;
  final String? backgroundImage;
  final String? ctaText;
  final VoidCallback? onCtaPressed;

  const HeroBanner({
    super.key,
    required this.title,
    required this.subtitle,
    this.description,
    this.backgroundImage,
    this.ctaText,
    this.onCtaPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: MediaQuery.of(context).size.height * 0.7, // 70% of screen height
      constraints: const BoxConstraints(minHeight: 500),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primary,
        image:
            backgroundImage != null
                ? DecorationImage(
                  image: AssetImage(backgroundImage!),
                  fit: BoxFit.cover,
                  colorFilter: ColorFilter.mode(
                    Theme.of(
                      context,
                    ).colorScheme.primary.withValues(alpha: 0.85),
                    BlendMode.srcOver,
                  ),
                )
                : null,
      ),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(32.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                title,
                style: Theme.of(context).textTheme.displayMedium?.copyWith(
                  color: Theme.of(context).colorScheme.onPrimary,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 24),
              Container(
                constraints: const BoxConstraints(maxWidth: 800),
                child: Text(
                  subtitle,
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    color: Theme.of(
                      context,
                    ).colorScheme.onPrimary.withAlpha(230),
                    height: 1.5,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              if (description != null) ...[
                const SizedBox(height: 16),
                Container(
                  constraints: const BoxConstraints(maxWidth: 800),
                  child: Text(
                    description!,
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      color: Theme.of(
                        context,
                      ).colorScheme.onPrimary.withValues(alpha: 0.8),
                      height: 1.4,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
              const SizedBox(height: 48),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton.icon(
                    onPressed:
                        () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => const ServicesScreen(),
                          ),
                        ),
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Theme.of(context).colorScheme.primary,
                      backgroundColor: Theme.of(context).colorScheme.surface,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 32,
                        vertical: 20,
                      ),
                      textStyle: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    icon: const Icon(Icons.business_center),
                    label: const Text('View Our Services'),
                  ),
                  const SizedBox(width: 16),
                  OutlinedButton(
                    onPressed:
                        onCtaPressed ??
                        () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => const ContactScreen(),
                          ),
                        ),
                    style: OutlinedButton.styleFrom(
                      foregroundColor: Theme.of(context).colorScheme.onPrimary,
                      side: BorderSide(
                        color: Theme.of(context).colorScheme.onPrimary,
                        width: 2,
                      ),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 32,
                        vertical: 20,
                      ),
                      textStyle: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    child: Text(ctaText ?? 'Contact Us'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
