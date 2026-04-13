import 'package:flutter/material.dart';
import 'package:adsequor_fr/models/company.dart';
import 'package:url_launcher/url_launcher.dart';

/// Contact section with links to LinkedIn, GitHub and a location map.
class ContactWidget extends StatelessWidget {
  /// Creates a [ContactWidget].
  const ContactWidget({super.key});

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
                'Contact Us',
                style: Theme.of(context).textTheme.displaySmall?.copyWith(
                  color: Theme.of(context).colorScheme.onPrimary,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16),
              Text(
                'We\'d love to hear from you. Get in touch with our team.',
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  color: Theme.of(context).colorScheme.onPrimary.withAlpha(230),
                ),
              ),
            ],
          ),
        ),

        // Contact info
        Padding(
          padding: const EdgeInsets.all(32),
          child: _buildContactInfo(context),
        ),
      ],
    );
  }

  Widget _buildContactInfo(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Get In Touch',
          style: Theme.of(context).textTheme.headlineMedium?.copyWith(
            fontWeight: FontWeight.bold,
            color: Theme.of(context).colorScheme.primary,
          ),
        ),
        const SizedBox(height: 16),
        Text(
          'Feel free to reach out to us using any of the contact methods below.',
          style: Theme.of(context).textTheme.bodyLarge,
        ),
        const SizedBox(height: 32),

        // Location
        _ContactMethod(
          icon: Icons.location_on_outlined,
          title: 'Location',
          value: adsequorProfile.location,
          url:
              'https://maps.google.com/?q=${Uri.encodeComponent(adsequorProfile.location)}',
        ),

        // LinkedIn
        _ContactMethod(
          icon: Icons.link,
          title: 'LinkedIn',
          value:
              adsequorProfile.contact['linkedin'] ??
              'linkedin.com/company/adsequor',
          url: 'https://${adsequorProfile.contact['linkedin']}',
        ),

        // GitHub
        _ContactMethod(
          icon: Icons.code,
          title: 'GitHub',
          value: adsequorProfile.contact['github'] ?? 'github.com/adsequor',
          url: 'https://${adsequorProfile.contact['github']}',
        ),
      ],
    );
  }
}

class _ContactMethod extends StatelessWidget {
  const _ContactMethod({
    required this.icon,
    required this.title,
    required this.value,
    required this.url,
  });

  final IconData icon;
  final String title;
  final String value;
  final String url;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 24.0),
      child: InkWell(
        onTap: () async {
          final uri = Uri.parse(url);
          if (await canLaunchUrl(uri)) {
            await launchUrl(uri, mode: LaunchMode.externalApplication);
          }
        },
        borderRadius: BorderRadius.circular(8),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
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
}
