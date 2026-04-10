import 'package:adsequor_fr/screens/about_widget.dart';
import 'package:adsequor_fr/screens/projects_widget.dart';
import 'package:adsequor_fr/screens/services_widget.dart';
import 'package:adsequor_fr/models/company.dart';
import 'package:adsequor_fr/screens/contact_widget.dart';
import 'package:adsequor_fr/widgets/app_footer.dart';
import 'package:adsequor_fr/widgets/app_nav_bar.dart';
import 'package:adsequor_fr/widgets/hero_banner.dart';
import 'package:adsequor_fr/widgets/calendly_cta.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class OnePageScreen extends StatelessWidget {
  const OnePageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppNavBar(currentPage: 'home'),
      body: SelectionArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8),
                child: HeroBanner(
                  title: adsequorProfile.name,
                  subtitle:
                      'Applications engineered with Dart, Flutter and Appwrite',
                  description:
                      'Adsequor helps companies launch coherent products that run on mobile phone, web server, web application, macOS, Windows and Linux targets.',
                  ctaText: 'Schedule a Consultation',
                  onCtaPressed: _openCalendly,
                ),
              ),

              const Padding(
                padding: EdgeInsets.all(8),
                child: ServicesWidget(),
              ),

              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 32),
                child: CalendlyCta(
                  title: 'Need a product stack that stays coherent?',
                  description:
                      'Use a short consultation to align product scope, technical stack and the right deployment targets for your application.',
                ),
              ),

              const Padding(padding: EdgeInsets.all(8), child: AboutWidget()),
              const ProjectsWidget(),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 32),
                child: CalendlyCta(
                  title: 'Ready to scope the next release?',
                  description:
                      'We can review architecture, platform coverage and delivery priorities before development starts.',
                  icon: Icons.emoji_food_beverage,
                ),
              ),

              const Padding(padding: EdgeInsets.all(8), child: ContactWidget()),

              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(48),
                color: Theme.of(context).colorScheme.primary,
                child: Column(
                  children: [
                    Text(
                      'Build one product foundation and deliver it everywhere it needs to run.',
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.headlineSmall
                          ?.copyWith(
                            color: Theme.of(context).colorScheme.onPrimary,
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                    const SizedBox(height: 16),
                    Text(
                      'Dart keeps the core logic maintainable, Flutter keeps the experience consistent, and Appwrite keeps backend capabilities practical.',
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        color: Theme.of(
                          context,
                        ).colorScheme.onPrimary.withAlpha(235),
                      ),
                    ),
                    const SizedBox(height: 24),
                    ElevatedButton.icon(
                      onPressed: _openCalendly,
                      icon: const Icon(Icons.calendar_month),
                      label: const Text('Discuss Your Application'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Theme.of(context).colorScheme.surface,
                        foregroundColor: Theme.of(context).colorScheme.primary,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 32,
                          vertical: 16,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const AppFooter(),
            ],
          ),
        ),
      ),
    );
  }

  static Future<void> _openCalendly() async {
    final uri = Uri.parse('https://calendly.com/romuald-barbe/prendre-un-the');
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    }
  }
}
