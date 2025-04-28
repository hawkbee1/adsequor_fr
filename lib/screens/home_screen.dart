import 'package:flutter/material.dart';
import 'package:adsequor_fr/models/company.dart';
import 'package:adsequor_fr/models/service.dart';
import 'package:adsequor_fr/widgets/hero_banner.dart';
import 'package:adsequor_fr/widgets/service_card.dart';
import 'package:adsequor_fr/widgets/app_footer.dart';
import 'package:adsequor_fr/widgets/app_nav_bar.dart';
import 'package:adsequor_fr/screens/services_screen.dart';
import 'package:adsequor_fr/screens/projects_screen.dart';
import 'package:adsequor_fr/screens/about_screen.dart';
import 'package:adsequor_fr/screens/contact_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppNavBar(currentPage: 'home'),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Hero Banner
            HeroBanner(
              title: adsequorProfile.name,
              subtitle: adsequorProfile.tagline,
              description:
                  'Delivering innovative Flutter solutions and IT consultancy services since ${adsequorProfile.foundedYear}',
              ctaText: 'Contact Us',
              onCtaPressed:
                  () => Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => const ContactScreen()),
                  ),
            ),

            // Services Section
            Padding(
              padding: const EdgeInsets.all(32.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Our Services',
                        style: Theme.of(
                          context,
                        ).textTheme.headlineMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).colorScheme.primary,
                        ),
                      ),
                      TextButton(
                        onPressed:
                            () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => const ServicesScreen(),
                              ),
                            ),
                        child: const Row(
                          children: [
                            Text('View All'),
                            SizedBox(width: 4),
                            Icon(Icons.arrow_forward, size: 16),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'Specialized in Flutter development and business intelligence solutions.',
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  const SizedBox(height: 24),
                  LayoutBuilder(
                    builder: (context, constraints) {
                      return constraints.maxWidth > 900
                          ? _buildServicesGrid(context)
                          : _buildServicesList(context);
                    },
                  ),
                ],
              ),
            ),

            // About Section
            Container(
              color: Theme.of(context).colorScheme.primary.withOpacity(0.05),
              padding: const EdgeInsets.all(32.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'About Us',
                    style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    adsequorProfile.description,
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  const SizedBox(height: 24),
                  Row(
                    children: [
                      ElevatedButton(
                        onPressed:
                            () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => const AboutScreen(),
                              ),
                            ),
                        child: const Text('Learn More About Us'),
                      ),
                      const SizedBox(width: 16),
                      OutlinedButton(
                        onPressed:
                            () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => const ProjectsScreen(),
                              ),
                            ),
                        child: const Text('View Our Projects'),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            // CTA Section
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(48.0),
              color: Theme.of(context).colorScheme.primary,
              child: Column(
                children: [
                  Text(
                    'Ready to transform your business with innovative tech solutions?',
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 24),
                  ElevatedButton(
                    onPressed:
                        () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => const ContactScreen(),
                          ),
                        ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      foregroundColor: Theme.of(context).colorScheme.primary,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 32,
                        vertical: 16,
                      ),
                    ),
                    child: const Text(
                      'Contact Us Today',
                      style: TextStyle(fontWeight: FontWeight.bold),
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
    );
  }

  Widget _buildServicesGrid(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 24,
        mainAxisSpacing: 24,
        childAspectRatio: 1,
      ),
      itemCount: adsequorServices.length > 3 ? 3 : adsequorServices.length,
      itemBuilder: (context, index) {
        return ServiceCard(
          service: adsequorServices[index],
          onTap:
              () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => ServicesScreen(initialIndex: index),
                ),
              ),
        );
      },
    );
  }

  Widget _buildServicesList(BuildContext context) {
    return Column(
      children:
          adsequorServices
              .take(3)
              .map(
                (service) => Padding(
                  padding: const EdgeInsets.only(bottom: 16.0),
                  child: ServiceCard(
                    service: service,
                    onTap: () {
                      final index = adsequorServices.indexOf(service);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => ServicesScreen(initialIndex: index),
                        ),
                      );
                    },
                  ),
                ),
              )
              .toList(),
    );
  }
}
