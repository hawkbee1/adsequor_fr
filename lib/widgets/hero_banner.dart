import 'package:adsequor_fr/widgets/schedule_now.dart';
import 'package:flutter/material.dart';
import 'package:adsequor_fr/screens/contact_widget.dart';

class HeroBanner extends StatelessWidget {
  final String title;
  final String subtitle;
  final String? description;
  final String? ctaText;
  final VoidCallback? onCtaPressed;

  const HeroBanner({
    super.key,
    required this.title,
    required this.subtitle,
    this.description,
    this.ctaText,
    this.onCtaPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      constraints: const BoxConstraints(minHeight: 500),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primary,
        image: DecorationImage(
          image: AssetImage('assets/pyrenees.jpeg'),
          fit: BoxFit.cover,
        ),
      ),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(32.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Company logo
              Image.asset('assets/logo_adsequor.png', fit: BoxFit.contain),
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
              if (description != null) ...[
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
              ],
              Padding(padding: const EdgeInsets.all(8.0), child: ScheduleNow()),
            ],
          ),
        ),
      ),
    );
  }
}
