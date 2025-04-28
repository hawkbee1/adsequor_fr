import 'package:flutter/material.dart';
import 'package:adsequor_fr/models/service.dart';

class ServiceCard extends StatelessWidget {
  final Service service;
  final VoidCallback? onTap;
  final bool isExpanded;

  const ServiceCard({
    Key? key,
    required this.service,
    this.onTap,
    this.isExpanded = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      clipBehavior: Clip.antiAlias,
      margin: const EdgeInsets.all(16),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: InkWell(
        onTap: onTap,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Service image or icon
            Container(
              height: 180,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primary,
                image:
                    service.imageUrl != null
                        ? DecorationImage(
                          image: AssetImage(service.imageUrl!),
                          fit: BoxFit.cover,
                        )
                        : null,
              ),
              child:
                  service.imageUrl == null
                      ? Center(
                        child: Icon(
                          service.icon ?? Icons.miscellaneous_services,
                          size: 64,
                          color: Colors.white,
                        ),
                      )
                      : null,
            ),

            // Service content
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Service title
                  Text(
                    service.title,
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                  const SizedBox(height: 8),

                  // Service short description
                  Text(
                    service.shortDescription,
                    style: Theme.of(context).textTheme.bodyMedium,
                    maxLines: isExpanded ? null : 3,
                    overflow: isExpanded ? null : TextOverflow.ellipsis,
                  ),

                  if (isExpanded) ...[
                    const SizedBox(height: 24),

                    // Key features
                    Text(
                      'Key Features:',
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    ...service.features.map(
                      (feature) => Padding(
                        padding: const EdgeInsets.symmetric(vertical: 4.0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Icon(
                              Icons.check_circle,
                              color: Theme.of(context).colorScheme.secondary,
                              size: 20,
                            ),
                            const SizedBox(width: 8),
                            Expanded(child: Text(feature)),
                          ],
                        ),
                      ),
                    ),

                    // Optional technologies section
                    if (service.technologies.isNotEmpty) ...[
                      const SizedBox(height: 24),
                      Text(
                        'Technologies:',
                        style: Theme.of(context).textTheme.titleMedium
                            ?.copyWith(fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 8),
                      Wrap(
                        spacing: 8,
                        runSpacing: 8,
                        children:
                            service.technologies
                                .map(
                                  (tech) => Chip(
                                    label: Text(tech),
                                    backgroundColor:
                                        Theme.of(
                                          context,
                                        ).colorScheme.surfaceVariant,
                                  ),
                                )
                                .toList(),
                      ),
                    ],
                  ],

                  const SizedBox(height: 16),

                  // Learn more or contact us button
                  Align(
                    alignment: Alignment.centerRight,
                    child:
                        isExpanded
                            ? ElevatedButton.icon(
                              onPressed: () {
                                // Navigate to contact page with service pre-selected
                              },
                              icon: const Icon(Icons.email),
                              label: const Text('Inquire About This Service'),
                            )
                            : TextButton(
                              onPressed: onTap,
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text('Learn More'),
                                  const SizedBox(width: 4),
                                  const Icon(Icons.arrow_forward, size: 16),
                                ],
                              ),
                            ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
