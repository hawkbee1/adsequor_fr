import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:adsequor_fr/models/company.dart';

/// Section that presents the three pillars of the tech stack
/// (Flutter, Dart, Appwrite) with logos and feature lists.
class TechStackSection extends StatelessWidget {
  /// Creates a [TechStackSection].
  const TechStackSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Header
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(32),
          color: Theme.of(context).colorScheme.primary,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Our Technology Stack',
                style: Theme.of(context).textTheme.displaySmall?.copyWith(
                  color: Theme.of(context).colorScheme.onPrimary,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16),
              Text(
                'Open-source technologies that scale — from prototype to '
                'production, from a single server to a global network.',
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  color: Theme.of(context).colorScheme.onPrimary.withAlpha(230),
                ),
              ),
            ],
          ),
        ),

        // Tech stack image row
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 24),
          child: Center(
            child: LayoutBuilder(
              builder: (context, constraints) {
                if (constraints.maxWidth > 700) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: adsequorTechStack
                        .map(
                          (tech) => _TechLogo(
                            logoAsset: tech.logoAsset,
                            name: tech.name,
                            url: tech.url,
                          ),
                        )
                        .toList(),
                  );
                }
                return Wrap(
                  alignment: WrapAlignment.center,
                  spacing: 24,
                  runSpacing: 24,
                  children: adsequorTechStack
                      .map(
                        (tech) => _TechLogo(
                          logoAsset: tech.logoAsset,
                          name: tech.name,
                          url: tech.url,
                        ),
                      )
                      .toList(),
                );
              },
            ),
          ),
        ),

        // Tech component cards
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32),
          child: LayoutBuilder(
            builder: (context, constraints) {
              if (constraints.maxWidth > 900) {
                return Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: adsequorTechStack
                      .map(
                        (tech) => Expanded(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 8.0,
                            ),
                            child: _TechCard(tech: tech),
                          ),
                        ),
                      )
                      .toList(),
                );
              }
              return Column(
                children: adsequorTechStack
                    .map(
                      (tech) => Padding(
                        padding: const EdgeInsets.only(bottom: 16),
                        child: _TechCard(tech: tech),
                      ),
                    )
                    .toList(),
              );
            },
          ),
        ),

        const SizedBox(height: 32),
      ],
    );
  }
}

class _TechLogo extends StatelessWidget {
  const _TechLogo({
    required this.logoAsset,
    required this.name,
    required this.url,
  });

  final String logoAsset;
  final String name;
  final String url;

  @override
  Widget build(BuildContext context) {
    return Tooltip(
      message: 'Visit $name website',
      child: InkWell(
        onTap: () async {
          final uri = Uri.parse(url);
          if (await canLaunchUrl(uri)) {
            await launchUrl(uri, mode: LaunchMode.externalApplication);
          }
        },
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Image.asset(
            logoAsset,
            height: 60,
            errorBuilder: (context, error, stackTrace) => Text(
              name,
              style: Theme.of(
                context,
              ).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ),
    );
  }
}

class _TechCard extends StatelessWidget {
  const _TechCard({required this.tech});

  final TechComponent tech;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              tech.name,
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.bold,
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
            const SizedBox(height: 12),
            Text(
              tech.description,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const SizedBox(height: 16),
            ...tech.features.map(
              (feature) => Padding(
                padding: const EdgeInsets.only(bottom: 8),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(
                      Icons.check_circle,
                      color: Theme.of(context).colorScheme.primary,
                      size: 18,
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        feature,
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 12),
            Align(
              alignment: Alignment.centerRight,
              child: TextButton.icon(
                onPressed: () async {
                  final uri = Uri.parse(tech.url);
                  if (await canLaunchUrl(uri)) {
                    await launchUrl(uri, mode: LaunchMode.externalApplication);
                  }
                },
                icon: const Icon(Icons.open_in_new, size: 16),
                label: Text('Learn more about ${tech.name}'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
