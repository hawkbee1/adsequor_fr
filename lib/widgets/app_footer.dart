import 'package:flutter/material.dart';
import 'package:adsequor_fr/models/company.dart';
import 'package:url_launcher/url_launcher.dart';

class AppFooter extends StatelessWidget {
  const AppFooter({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).colorScheme.primary.withValues(alpha: 0.1),
      padding: const EdgeInsets.all(32.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    adsequorProfile.name,
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(adsequorProfile.location),
                  const SizedBox(height: 4),
                  Text('Founded in ${adsequorProfile.foundedYear}'),
                ],
              ),
              Row(
                children: [
                  _buildSocialButton(
                    context: context,
                    icon: Icons.email,
                    tooltip: 'Email',
                    url: 'mailto:${adsequorProfile.contact['email']}',
                  ),
                  _buildSocialButton(
                    context: context,
                    icon: Icons.link,
                    tooltip: 'LinkedIn',
                    url: 'https://${adsequorProfile.contact['linkedin']}',
                  ),
                  _buildSocialButton(
                    context: context,
                    icon: Icons.code,
                    tooltip: 'GitHub',
                    url: 'https://${adsequorProfile.contact['github']}',
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 24),
          const Divider(),
          const SizedBox(height: 24),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '© ${DateTime.now().year} ${adsequorProfile.name}. All rights reserved.',
                style: Theme.of(context).textTheme.bodySmall,
              ),
              Text(
                'Built with Flutter',
                style: Theme.of(
                  context,
                ).textTheme.bodySmall?.copyWith(fontStyle: FontStyle.italic),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildSocialButton({
    required BuildContext context,
    required IconData icon,
    required String tooltip,
    required String url,
  }) {
    return Container(
      margin: const EdgeInsets.only(left: 12),
      child: IconButton(
        onPressed: () async {
          final uri = Uri.parse(url);
          if (await canLaunchUrl(uri)) {
            await launchUrl(uri);
          }
        },
        icon: Icon(icon),
        tooltip: tooltip,
        style: IconButton.styleFrom(
          backgroundColor: Theme.of(
            context,
          ).colorScheme.primary.withValues(alpha: 0.1),
          foregroundColor: Theme.of(context).colorScheme.primary,
        ),
      ),
    );
  }
}
