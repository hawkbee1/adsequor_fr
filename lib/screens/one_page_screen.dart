import 'package:flutter/material.dart';
import 'package:adsequor_fr/models/company.dart';
import 'package:adsequor_fr/screens/tech_stack_section.dart';
import 'package:adsequor_fr/screens/platforms_section.dart';
import 'package:adsequor_fr/screens/metrics_section.dart';
import 'package:adsequor_fr/screens/services_widget.dart';
import 'package:adsequor_fr/screens/contact_widget.dart';
import 'package:adsequor_fr/widgets/app_nav_bar.dart';
import 'package:adsequor_fr/widgets/app_footer.dart';
import 'package:adsequor_fr/widgets/hero_banner.dart';
import 'package:adsequor_fr/widgets/calendly_cta.dart';

/// The single-page layout that presents the Adsequor company website.
class OnePageScreen extends StatelessWidget {
  /// Creates a [OnePageScreen].
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
              // Hero Banner
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: HeroBanner(
                  title: adsequorProfile.name,
                  subtitle: adsequorProfile.tagline,
                  description: adsequorProfile.description,
                ),
              ),

              // Tech Stack Section
              const TechStackSection(),

              // Platforms Section
              const PlatformsSection(),

              // First CTA
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 32.0),
                child: CalendlyCta(
                  title: 'Interested in our stack?',
                  description:
                      'Schedule a free 15-minute consultation to see how '
                      'Flutter + Appwrite can accelerate your next project.',
                ),
              ),

              // Services Section
              const ServicesWidget(),

              // Metrics Section
              const MetricsSection(),

              // Second CTA
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 32.0),
                child: CalendlyCta(
                  title: 'Ready to discuss your project?',
                  description:
                      'Let\'s have a tea together and explore how we can '
                      'bring your ideas to life.',
                  icon: Icons.emoji_food_beverage,
                ),
              ),

              // Contact Section
              const ContactWidget(),

              // Footer
              const AppFooter(),
            ],
          ),
        ),
      ),
    );
  }
}
