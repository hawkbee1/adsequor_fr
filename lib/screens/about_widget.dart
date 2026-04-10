import 'package:adsequor_fr/models/company.dart';
import 'package:adsequor_fr/widgets/technical_stack_showcase.dart';
import 'package:flutter/material.dart';

class AboutWidget extends StatelessWidget {
  const AboutWidget({super.key});

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
                  'How Adsequor Works',
                  style: Theme.of(context).textTheme.displaySmall?.copyWith(
                    color: Theme.of(context).colorScheme.onPrimary,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 16),
                Text(
                  'We structure applications as one coherent product system instead of separate mobile, web and backend tracks.',
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
            padding: const EdgeInsets.all(32),
            child: LayoutBuilder(
              builder: (context, constraints) {
                final isWide = constraints.maxWidth >= 1000;

                final overview = Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'A company-first delivery model',
                      style: Theme.of(context).textTheme.headlineMedium
                          ?.copyWith(
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context).colorScheme.primary,
                          ),
                    ),
                    const SizedBox(height: 20),
                    Text(
                      adsequorProfile.description,
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                    const SizedBox(height: 24),
                    _buildInfoRow(
                      context,
                      Icons.design_services,
                      'Offer',
                      'Dart foundations, Flutter interfaces and Appwrite backend services delivered as one platform.',
                    ),
                    _buildInfoRow(
                      context,
                      Icons.rocket_launch,
                      'Outcome',
                      'Faster product delivery, lower maintenance overhead and a clearer path from MVP to production scale.',
                    ),
                    _buildInfoRow(
                      context,
                      Icons.language,
                      'Coverage',
                      'Mobile phone, web server, web application, macOS, Windows and Linux targets are considered from the start.',
                    ),
                  ],
                );

                final values = _buildValuesPanel(context);

                if (isWide) {
                  return Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(flex: 5, child: overview),
                      const SizedBox(width: 32),
                      Expanded(flex: 4, child: values),
                    ],
                  );
                }

                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [overview, const SizedBox(height: 24), values],
                );
              },
            ),
          ),
          const Padding(
            padding: EdgeInsets.fromLTRB(32, 0, 32, 32),
            child: TechnicalStackShowcase(),
          ),
        ],
      ),
    );
  }

  Widget _buildInfoRow(
    BuildContext context,
    IconData icon,
    String title,
    String value,
  ) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 18),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            radius: 18,
            backgroundColor: Theme.of(
              context,
            ).colorScheme.primary.withValues(alpha: 0.1),
            child: Icon(
              icon,
              size: 18,
              color: Theme.of(context).colorScheme.primary,
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
                Text(value, style: Theme.of(context).textTheme.bodyMedium),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildValuesPanel(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Delivery principles',
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.bold,
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
            const SizedBox(height: 16),
            ...adsequorProfile.values.map(
              (value) => Padding(
                padding: const EdgeInsets.only(bottom: 12),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(
                      Icons.check_circle,
                      size: 20,
                      color: Theme.of(context).colorScheme.secondary,
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Text(
                        value,
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),
            Text(
              'Platform targets',
              style: Theme.of(
                context,
              ).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            Wrap(
              spacing: 10,
              runSpacing: 10,
              children: adsequorProfile.platforms
                  .map(
                    (platform) => Chip(
                      label: Text(platform),
                      avatar: const Icon(Icons.devices_other, size: 18),
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
