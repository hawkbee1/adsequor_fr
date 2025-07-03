import 'package:adsequor_fr/screens/about_widget.dart';
import 'package:adsequor_fr/screens/projects_widget.dart';
import 'package:adsequor_fr/screens/services_widget.dart';
import 'package:flutter/material.dart';
import 'package:adsequor_fr/models/company.dart';
import 'package:adsequor_fr/models/project.dart';
import 'package:adsequor_fr/screens/contact_widget.dart';
import 'package:adsequor_fr/widgets/app_nav_bar.dart';
import 'package:adsequor_fr/widgets/app_footer.dart';
import 'package:adsequor_fr/widgets/hero_banner.dart';
import 'package:adsequor_fr/widgets/calendly_cta.dart';
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
              // Hero Banner
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: HeroBanner(
                  title: adsequorProfile.name,
                  subtitle: adsequorProfile.tagline,
                  description:
                      'Delivering innovative Flutter solutions and IT consultancy services since ${adsequorProfile.foundedYear}',
                  ctaText: 'Schedule a Consultation',
                  onCtaPressed: () async {
                    final uri = Uri.parse(
                      'https://calendly.com/romuald-barbe/prendre-un-the',
                    );
                    if (await canLaunchUrl(uri)) {
                      await launchUrl(
                        uri,
                        mode: LaunchMode.externalApplication,
                      );
                    }
                  },
                ),
              ),

              // Services Section
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ServicesWidget(),
              ),

              // First Calendly CTA
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 32.0),
                child: CalendlyCta(
                  title: 'Interested in our services?',
                  description:
                      'Schedule a free 15-minutes consultation to discuss how we can help with your specific technology needs.',
                ),
              ),

              // About Section
              Padding(padding: const EdgeInsets.all(8.0), child: AboutWidget()),

              // Projects Section
              ProjectsWidget(),
              Padding(
                padding: const EdgeInsets.all(32.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Our Projects',
                      style: Theme.of(context).textTheme.headlineMedium
                          ?.copyWith(
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context).colorScheme.primary,
                          ),
                    ),
                    const SizedBox(height: 16),
                    Text(
                      'Discover some of our successful implementations and technology solutions.',
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                    const SizedBox(height: 24),
                    ...adsequorProjects
                        .take(3)
                        .map(
                          (project) => _buildProjectSummary(context, project),
                        ),
                  ],
                ),
              ),

              // Second Calendly CTA
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 32.0),
                child: CalendlyCta(
                  title: 'Ready to discuss your project?',
                  description:
                      'Let\'s have a tea together and explore how we can bring your ideas to life.',
                  icon: Icons.emoji_food_beverage,
                ),
              ),

              // Contact Form Section
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ContactWidget(),
              ),

              // Final CTA Section
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(48.0),
                color: Theme.of(context).colorScheme.primary,
                child: Column(
                  children: [
                    Text(
                      'Ready to transform your business with innovative tech solutions?',
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.headlineSmall
                          ?.copyWith(
                            color: Theme.of(context).colorScheme.onPrimary,
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                    const SizedBox(height: 24),
                    ElevatedButton.icon(
                      onPressed: () async {
                        final uri = Uri.parse(
                          'https://calendly.com/romuald-barbe/prendre-un-the',
                        );
                        if (await canLaunchUrl(uri)) {
                          await launchUrl(
                            uri,
                            mode: LaunchMode.externalApplication,
                          );
                        }
                      },
                      icon: const Icon(Icons.calendar_month),
                      label: const Text('Schedule Your Consultation'),
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

              // Footer
              const AppFooter(),
            ],
          ),
        ),
      ),
    );
  }

  // Services Grid

  // Services List

  // Show service details in a dialog

  // Project Summary Card
  Widget _buildProjectSummary(BuildContext context, Project project) {
    return Card(
      elevation: 2,
      margin: const EdgeInsets.only(bottom: 24),
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    project.title,
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 6,
                  ),
                  decoration: BoxDecoration(
                    color: Theme.of(
                      context,
                    ).colorScheme.primary.withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    project.duration,
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.primary,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Text(
              'Client: ${project.client}',
              style: Theme.of(
                context,
              ).textTheme.titleMedium?.copyWith(fontStyle: FontStyle.italic),
            ),
            const SizedBox(height: 16),
            Text(
              project.description,
              style: Theme.of(context).textTheme.bodyMedium,
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(height: 16),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: project.technologies
                  .take(4)
                  .map(
                    (tech) => Chip(
                      label: Text(tech),
                      backgroundColor: Theme.of(
                        context,
                      ).colorScheme.secondary.withValues(alpha: 0.1),
                      labelStyle: TextStyle(
                        color: Theme.of(context).colorScheme.secondary,
                        fontSize: 12,
                      ),
                    ),
                  )
                  .toList(),
            ),
          ],
        ),
      ),
    );
  }
}
