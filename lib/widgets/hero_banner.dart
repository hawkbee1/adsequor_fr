import 'package:adsequor_fr/widgets/schedule_now.dart';
import 'package:flutter/material.dart';

/// Full-width hero banner with a background image, logo, subtitle
/// and a call-to-action button.
class HeroBanner extends StatelessWidget {
  /// The main title (not displayed — logo used instead).
  final String title;

  /// Subtitle text displayed below the logo.
  final String subtitle;

  /// Optional longer description.
  final String? description;

  /// Creates a [HeroBanner].
  const HeroBanner({
    super.key,
    required this.title,
    required this.subtitle,
    this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      constraints: const BoxConstraints(minHeight: 500),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primary,
        image: const DecorationImage(
          image: AssetImage('assets/pyrenees.jpeg'),
          fit: BoxFit.cover,
        ),
      ),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(32.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Company logo
              Image.asset(
                'assets/logo_adsequor.png',
                fit: BoxFit.contain,
                errorBuilder: (context, error, stackTrace) => Text(
                  title,
                  style: Theme.of(context).textTheme.displayMedium?.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  constraints: const BoxConstraints(maxWidth: 800),
                  child: Text(
                    subtitle,
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      color: Colors.white,
                      height: 1.5,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              if (description != null)
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    constraints: const BoxConstraints(maxWidth: 800),
                    child: Text(
                      description!,
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        color: Colors.white,
                        height: 1.4,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              const Padding(padding: EdgeInsets.all(8.0), child: ScheduleNow()),
            ],
          ),
        ),
      ),
    );
  }
}
