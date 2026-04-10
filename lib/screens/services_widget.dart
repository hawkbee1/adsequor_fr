import 'package:adsequor_fr/models/service.dart';
import 'package:adsequor_fr/widgets/service_card.dart';
import 'package:flutter/material.dart';

class ServicesWidget extends StatelessWidget {
  const ServicesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(32),
            color: Theme.of(context).colorScheme.primary,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'What We Deliver',
                  style: Theme.of(context).textTheme.displaySmall?.copyWith(
                    color: Theme.of(context).colorScheme.onPrimary,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 16),
                Text(
                  'Three complementary building blocks shape the offer: Dart for maintainable logic, Flutter for product interfaces, and Appwrite for backend capabilities.',
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    color: Theme.of(
                      context,
                    ).colorScheme.onPrimary.withAlpha(230),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(24),
            child: LayoutBuilder(
              builder: (context, constraints) {
                final columns = constraints.maxWidth >= 1280
                    ? 3
                    : constraints.maxWidth >= 760
                    ? 2
                    : 1;

                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    GridView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: columns,
                        crossAxisSpacing: 16,
                        mainAxisSpacing: 16,
                        mainAxisExtent: 470,
                      ),
                      itemCount: adsequorServices.length,
                      itemBuilder: (context, index) {
                        return ServiceCard(
                          service: adsequorServices[index],
                          isExpanded: true,
                        );
                      },
                    ),
                    const SizedBox(height: 24),
                    const _PlatformCoveragePanel(),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class _PlatformCoveragePanel extends StatelessWidget {
  const _PlatformCoveragePanel();

  @override
  Widget build(BuildContext context) {
    const platformItems = [
      _PlatformItem(
        'Mobile phone',
        Icons.smartphone,
        'Flutter apps for Android and iPhone with one product codebase.',
      ),
      _PlatformItem(
        'Web application',
        Icons.language,
        'Responsive browser experiences for dashboards, portals and customer-facing products.',
      ),
      _PlatformItem(
        'Web server',
        Icons.dns,
        'Appwrite services, functions and APIs running server-side for product operations.',
      ),
      _PlatformItem(
        'macOS',
        Icons.laptop_mac,
        'Desktop workflows packaged for Apple desktops with shared UI and logic.',
      ),
      _PlatformItem(
        'Windows',
        Icons.desktop_windows,
        'Internal tools and commercial applications delivered for Windows environments.',
      ),
      _PlatformItem(
        'Linux',
        Icons.computer,
        'Cross-platform desktop distribution for Linux-based teams and infrastructure.',
      ),
    ];

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Where the application runs',
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                fontWeight: FontWeight.bold,
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
            const SizedBox(height: 12),
            Text(
              'The offer is built to support the same product across mobile phone, web server, web application, macOS, Windows and Linux targets.',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            const SizedBox(height: 20),
            LayoutBuilder(
              builder: (context, constraints) {
                final wide = constraints.maxWidth >= 900;
                return GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: wide ? 3 : 1,
                    crossAxisSpacing: 14,
                    mainAxisSpacing: 14,
                    mainAxisExtent: 152,
                  ),
                  itemCount: platformItems.length,
                  itemBuilder: (context, index) {
                    final item = platformItems[index];
                    return Container(
                      padding: const EdgeInsets.all(18),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(18),
                        color: Theme.of(
                          context,
                        ).colorScheme.primary.withValues(alpha: 0.06),
                        border: Border.all(
                          color: Theme.of(
                            context,
                          ).colorScheme.primary.withValues(alpha: 0.15),
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Icon(
                            item.icon,
                            color: Theme.of(context).colorScheme.primary,
                          ),
                          const SizedBox(height: 12),
                          Text(
                            item.title,
                            style: Theme.of(context).textTheme.titleMedium
                                ?.copyWith(fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(height: 8),
                          Text(item.description),
                        ],
                      ),
                    );
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class _PlatformItem {
  final String title;
  final IconData icon;
  final String description;

  const _PlatformItem(this.title, this.icon, this.description);
}
