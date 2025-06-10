import 'package:adsequor_fr/screens/about_widget.dart';
import 'package:adsequor_fr/screens/projects_widget.dart';
import 'package:adsequor_fr/screens/services_widget.dart';
import 'package:flutter/material.dart';
import 'package:adsequor_fr/models/company.dart';
import 'package:adsequor_fr/models/service.dart';
import 'package:adsequor_fr/models/project.dart';
import 'package:adsequor_fr/screens/contact_widget.dart';
import 'package:adsequor_fr/widgets/app_nav_bar.dart';
import 'package:adsequor_fr/widgets/app_footer.dart';
import 'package:adsequor_fr/widgets/hero_banner.dart';
import 'package:adsequor_fr/widgets/service_card.dart';
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
                      style: Theme.of(
                        context,
                      ).textTheme.headlineMedium?.copyWith(
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
                      style: Theme.of(
                        context,
                      ).textTheme.headlineSmall?.copyWith(
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
  Widget _buildServicesGrid(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 24,
        mainAxisSpacing: 24,
        childAspectRatio: 1.5,
      ),
      itemCount: adsequorServices.length,
      itemBuilder: (context, index) {
        final service = adsequorServices[index];
        return ServiceCard(
          service: service,
          onTap: () => _showServiceDetails(context, service),
        );
      },
    );
  }

  // Services List
  Widget _buildServicesList(BuildContext context) {
    return Column(
      children:
          adsequorServices
              .map(
                (service) => Padding(
                  padding: const EdgeInsets.only(bottom: 16.0),
                  child: ServiceCard(
                    service: service,
                    onTap: () => _showServiceDetails(context, service),
                  ),
                ),
              )
              .toList(),
    );
  }

  // Show service details in a dialog
  void _showServiceDetails(BuildContext context, Service service) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    children: [
                      Container(
                        width: 60,
                        height: 60,
                        decoration: BoxDecoration(
                          color: Theme.of(
                            context,
                          ).colorScheme.primary.withValues(alpha: 0.1),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Center(
                          child: Image.asset(
                            service.imageUrl,
                            width: 36,
                            height: 36,
                            errorBuilder: (context, error, stackTrace) {
                              return Icon(
                                Icons.business,
                                size: 32,
                                color: Theme.of(context).colorScheme.primary,
                              );
                            },
                          ),
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: Text(
                          service.title,
                          style: Theme.of(
                            context,
                          ).textTheme.headlineSmall?.copyWith(
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context).colorScheme.primary,
                          ),
                        ),
                      ),
                      IconButton(
                        onPressed: () => Navigator.of(context).pop(),
                        icon: const Icon(Icons.close),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Text(
                    service.description,
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  const SizedBox(height: 24),
                  Text(
                    'What we offer:',
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 16),
                  ...service.features.map(
                    (feature) => Padding(
                      padding: const EdgeInsets.only(bottom: 12.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            padding: const EdgeInsets.all(6),
                            decoration: BoxDecoration(
                              color: Theme.of(
                                context,
                              ).colorScheme.primary.withValues(alpha: 0.1),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Icon(
                              Icons.check,
                              color: Theme.of(context).colorScheme.primary,
                              size: 16,
                            ),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: Text(
                              feature,
                              style: Theme.of(context).textTheme.bodyMedium
                                  ?.copyWith(fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 24),
                  Align(
                    alignment: Alignment.centerRight,
                    child: ElevatedButton.icon(
                      onPressed: () async {
                        Navigator.of(context).pop();
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
                      label: const Text('Schedule Consultation'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Theme.of(context).colorScheme.primary,
                        foregroundColor:
                            Theme.of(context).colorScheme.onPrimary,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

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
              children:
                  project.technologies
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

  // Testimonial Card
  Widget _buildTestimonialCard(BuildContext context, Testimonial testimonial) {
    return Container(
      width: 350,
      margin: const EdgeInsets.only(right: 16),
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Theme.of(context).colorScheme.shadow.withValues(alpha: 0.1),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(
            Icons.format_quote,
            color: Theme.of(context).colorScheme.secondary,
            size: 32,
          ),
          const SizedBox(height: 16),
          Text(
            testimonial.quote,
            style: Theme.of(
              context,
            ).textTheme.bodyLarge?.copyWith(fontStyle: FontStyle.italic),
            maxLines: 4,
            overflow: TextOverflow.ellipsis,
          ),
          const Spacer(),
          Row(
            children: [
              CircleAvatar(
                radius: 20,
                backgroundColor: Theme.of(context).colorScheme.primary,
                child: Text(
                  testimonial.author.substring(0, 1),
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.onPrimary,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    testimonial.author,
                    style: Theme.of(context).textTheme.titleSmall?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    '${testimonial.position}, ${testimonial.company}',
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  // Contact Info
  Widget _buildContactInfo(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildContactMethod(
          context: context,
          icon: Icons.email_outlined,
          title: 'Email Us',
          value: adsequorProfile.contact['email'] ?? 'contact@adsequor.fr',
          onTap: () async {
            final emailUri = Uri(
              scheme: 'mailto',
              path: adsequorProfile.contact['email'],
            );
            if (await canLaunchUrl(emailUri)) {
              await launchUrl(emailUri);
            }
          },
        ),
        _buildContactMethod(
          context: context,
          icon: Icons.location_on_outlined,
          title: 'Location',
          value: adsequorProfile.location,
          onTap: () async {
            final mapsUrl =
                'https://maps.google.com/?q=${Uri.encodeComponent(adsequorProfile.location)}';
            final mapsUri = Uri.parse(mapsUrl);
            if (await canLaunchUrl(mapsUri)) {
              await launchUrl(mapsUri, mode: LaunchMode.externalApplication);
            }
          },
        ),
        _buildContactMethod(
          context: context,
          icon: Icons.link,
          title: 'LinkedIn',
          value:
              adsequorProfile.contact['linkedin'] ??
              'linkedin.com/company/adsequor',
          onTap: () async {
            final linkedInUri = Uri.parse(
              'https://${adsequorProfile.contact['linkedin']}',
            );
            if (await canLaunchUrl(linkedInUri)) {
              await launchUrl(
                linkedInUri,
                mode: LaunchMode.externalApplication,
              );
            }
          },
        ),
      ],
    );
  }

  // Contact Method
  Widget _buildContactMethod({
    required BuildContext context,
    required IconData icon,
    required String title,
    required String value,
    required VoidCallback onTap,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 24.0),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(8),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Theme.of(
                    context,
                  ).colorScheme.primary.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Icon(
                  icon,
                  color: Theme.of(context).colorScheme.primary,
                  size: 24,
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      value,
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: Theme.of(context).colorScheme.primary,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ],
                ),
              ),
              Icon(
                Icons.arrow_forward_ios,
                size: 16,
                color: Theme.of(context).colorScheme.primary,
              ),
            ],
          ),
        ),
      ),
    );
  }

  // FAQ Item
  Widget _buildFaqItem(BuildContext context, FAQ faq) {
    return ExpansionTile(
      title: Text(
        faq.question,
        style: Theme.of(
          context,
        ).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
      ),
      childrenPadding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
      expandedCrossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(faq.answer, style: Theme.of(context).textTheme.bodyMedium),
      ],
    );
  }
}
