import 'package:flutter/material.dart';
import 'package:adsequor_fr/models/company.dart';
import 'package:url_launcher/url_launcher.dart';

// FAQ class definition
class FAQ {
  final String question;
  final String answer;

  const FAQ({required this.question, required this.answer});
}

class ContactWidget extends StatefulWidget {
  const ContactWidget({super.key});

  @override
  State<ContactWidget> createState() => _ContactWidgetState();
}

class _ContactWidgetState extends State<ContactWidget> {
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _subjectController = TextEditingController();
  final _messageController = TextEditingController();


  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _subjectController.dispose();
    _messageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
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
                    color: Theme.of(
                      context,
                    ).colorScheme.onPrimary.withAlpha(230),
                  ),
                ),
              ],
            ),
          ),

          // Contact info and form
          Padding(
            padding: const EdgeInsets.all(32),
            child: LayoutBuilder(
              builder: (context, constraints) {
                if (constraints.maxWidth > 900) {
                  // Desktop layout
                  return Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Contact information
                      Expanded(flex: 2, child: _buildContactInfo(context)),
                      const SizedBox(width: 32),
                      // Contact form
                    ],
                  );
                } else {
                  // Mobile layout
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildContactInfo(context),
                      const SizedBox(height: 32),
                    ],
                  );
                }
              },
            ),
          ),
        ],
      ),
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
          'Feel free to reach out to us using any of the contact methods below or fill out the form and we\'ll get back to you as soon as possible.',
          style: Theme.of(context).textTheme.bodyLarge,
        ),
        const SizedBox(height: 32),

        // Location
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

        // LinkedIn
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

        // GitHub
        _buildContactMethod(
          context: context,
          icon: Icons.code,
          title: 'GitHub',
          value: adsequorProfile.contact['github'] ?? 'github.com/adsequor',
          onTap: () async {
            final githubUri = Uri.parse(
              'https://${adsequorProfile.contact['github']}',
            );
            if (await canLaunchUrl(githubUri)) {
              await launchUrl(githubUri, mode: LaunchMode.externalApplication);
            }
          },
        ),
      ],
    );
  }

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



}
