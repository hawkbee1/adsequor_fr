import 'package:flutter/material.dart';
import 'package:adsequor_fr/models/company.dart';
import 'package:adsequor_fr/widgets/app_nav_bar.dart';
import 'package:adsequor_fr/widgets/app_footer.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppNavBar(currentPage: 'about'),
      body: SingleChildScrollView(
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
                    'About Adsequor',
                    style: Theme.of(context).textTheme.displaySmall?.copyWith(
                      color: Theme.of(context).colorScheme.onPrimary,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'Learn more about our company, our values, and our expertise.',
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      color: Theme.of(context).colorScheme.onPrimary.withAlpha(
                        230,
                      ), // 0.9 opacity is approximately 230 in 0-255 scale
                    ),
                  ),
                ],
              ),
            ),

            // Company Story
            Padding(
              padding: const EdgeInsets.all(32),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Our Story',
                    style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                  const SizedBox(height: 24),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Company info
                      Expanded(
                        flex: 3,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              adsequorProfile.description,
                              style: Theme.of(context).textTheme.bodyLarge,
                            ),
                            const SizedBox(height: 24),
                            _buildInfoRow(
                              context: context,
                              title: 'Founded',
                              value: adsequorProfile.foundedYear,
                              icon: Icons.calendar_today,
                            ),
                            _buildInfoRow(
                              context: context,
                              title: 'Location',
                              value: adsequorProfile.location,
                              icon: Icons.location_on,
                            ),
                            _buildInfoRow(
                              context: context,
                              title: 'Focus',
                              value:
                                  'Flutter Development, Business Intelligence, Team Leadership',
                              icon: Icons.lightbulb,
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 32),

                      // Founder image
                      (MediaQuery.of(context).size.width >= 800)
                          ? Expanded(
                            flex: 2,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(12),
                              child: Image.asset(
                                'assets/profil_online.jpg',
                                fit: BoxFit.cover,
                                errorBuilder: (context, error, stackTrace) {
                                  return Container(
                                    height: 300,
                                    decoration: BoxDecoration(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .primary
                                          .withValues(alpha: 0.1),
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    child: Center(
                                      child: Icon(
                                        Icons.business,
                                        size: 64,
                                        color: Theme.of(context)
                                            .colorScheme
                                            .primary
                                            .withValues(alpha: 0.5),
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                          )
                          : SizedBox.shrink(),
                    ],
                  ),
                ],
              ),
            ),

            // Our Values
            Container(
              color: Theme.of(
                context,
              ).colorScheme.primary.withValues(alpha: 0.05),
              padding: const EdgeInsets.all(32),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Our Values',
                    style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                  const SizedBox(height: 24),
                  GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: 2.5,
                          crossAxisSpacing: 16,
                          mainAxisSpacing: 16,
                        ),
                    itemCount: adsequorProfile.values.length,
                    itemBuilder: (context, index) {
                      return Card(
                        elevation: 2,
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                _getValueIcon(index),
                                color: Theme.of(context).colorScheme.secondary,
                                size: 32,
                              ),
                              const SizedBox(height: 12),
                              Text(
                                adsequorProfile.values[index],
                                style: Theme.of(context).textTheme.titleSmall,
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),

            // Team section
            Padding(
              padding: const EdgeInsets.all(32),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Our Team',
                    style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'Meet the experts behind Adsequor\'s success.',
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  const SizedBox(height: 24),
                  ...adsequorProfile.team.map(
                    (member) => _buildTeamMemberCard(context, member),
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

  Widget _buildInfoRow({
    required BuildContext context,
    required String title,
    required String value,
    required IconData icon,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            radius: 16,
            backgroundColor: Theme.of(
              context,
            ).colorScheme.primary.withValues(alpha: 0.1),
            child: Icon(
              icon,
              size: 16,
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

  Widget _buildTeamMemberCard(BuildContext context, TeamMember member) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Member photo
                CircleAvatar(
                  radius: 40,
                  backgroundImage:
                      member.imageAsset != null
                          ? AssetImage(member.imageAsset!) as ImageProvider
                          : null,
                  backgroundColor: Theme.of(context).colorScheme.primary,
                  child:
                      member.imageAsset == null
                          ? Text(
                            member.name.substring(0, 1),
                            style: TextStyle(
                              fontSize: 32,
                              color: Theme.of(context).colorScheme.onPrimary,
                              fontWeight: FontWeight.bold,
                            ),
                          )
                          : null,
                ),
                const SizedBox(width: 24),

                // Member info
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        member.name,
                        style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        member.role,
                        style: Theme.of(
                          context,
                        ).textTheme.titleMedium?.copyWith(
                          color: Theme.of(context).colorScheme.primary,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          for (final contact in member.contact.entries)
                            Padding(
                              padding: const EdgeInsets.only(right: 16.0),
                              child: InkWell(
                                onTap: () {},
                                child: Row(
                                  children: [
                                    Icon(
                                      _getContactIcon(contact.key),
                                      size: 16,
                                    ),
                                    const SizedBox(width: 4),
                                    Text(
                                      _getContactLabel(contact.key),
                                      style: Theme.of(
                                        context,
                                      ).textTheme.bodySmall?.copyWith(
                                        decoration: TextDecoration.underline,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Text(member.bio, style: Theme.of(context).textTheme.bodyMedium),
            const SizedBox(height: 16),

            // Expertise chips
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children:
                  member.expertise
                      .map(
                        (expertise) => Chip(
                          label: Text(expertise),
                          backgroundColor: Theme.of(
                            context,
                          ).colorScheme.primary.withValues(alpha: 0.1),
                          labelStyle: TextStyle(
                            color: Theme.of(context).colorScheme.primary,
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

  IconData _getContactIcon(String contactType) {
    switch (contactType.toLowerCase()) {
      case 'email':
        return Icons.email;
      case 'phone':
        return Icons.phone;
      case 'linkedin':
        return Icons.link;
      case 'twitter':
        return Icons.messenger_outline;
      case 'github':
        return Icons.code;
      default:
        return Icons.contact_page;
    }
  }

  String _getContactLabel(String contactType) {
    switch (contactType.toLowerCase()) {
      case 'email':
        return 'Email';
      case 'phone':
        return 'Phone';
      case 'linkedin':
        return 'LinkedIn';
      case 'twitter':
        return 'Twitter';
      case 'github':
        return 'GitHub';
      default:
        return contactType.capitalize();
    }
  }

  IconData _getValueIcon(int index) {
    final icons = [
      Icons.star,
      Icons.lightbulb,
      Icons.school,
      Icons.message,
      Icons.groups,
    ];
    return index < icons.length ? icons[index] : Icons.check_circle;
  }
}

extension StringExtension on String {
  String capitalize() {
    return "${this[0].toUpperCase()}${substring(1)}";
  }
}
