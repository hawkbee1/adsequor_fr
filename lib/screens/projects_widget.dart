import 'package:flutter/material.dart';
import 'package:adsequor_fr/models/project.dart';

class ProjectsWidget extends StatelessWidget {
  const ProjectsWidget({super.key});

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
                  'Our Projects',
                  style: Theme.of(context).textTheme.displaySmall?.copyWith(
                    color: Theme.of(context).colorScheme.onPrimary,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 16),
                Text(
                  'Discover our successful implementations and technology solutions.',
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    color: Theme.of(
                      context,
                    ).colorScheme.onPrimary.withAlpha(230),
                  ),
                ),
              ],
            ),
          ),

          // Projects list
          Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ...adsequorProjects.map(
                  (project) => _buildProjectCard(context, project),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProjectCard(BuildContext context, Project project) {
    return Card(
      elevation: 4,
      margin: const EdgeInsets.only(bottom: 32),
      clipBehavior: Clip.antiAlias,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Project image (if available)
          if (project.imageAsset != null)
            Image.asset(
              project.imageAsset!,
              height: 200,
              width: double.infinity,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return Container(
                  height: 200,
                  color: Theme.of(
                    context,
                  ).colorScheme.primary.withValues(alpha: 0.1),
                  child: Center(
                    child: Icon(
                      Icons.image,
                      size: 48,
                      color: Theme.of(
                        context,
                      ).colorScheme.primary.withValues(alpha: 0.5),
                    ),
                  ),
                );
              },
            ),

          // Project details
          Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Title and duration
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      child: Text(
                        project.title,
                        style: Theme.of(
                          context,
                        ).textTheme.headlineSmall?.copyWith(
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).colorScheme.primary,
                        ),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                      ),
                    ),
                    const SizedBox(width: 16),
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Container(
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
                    ),
                  ],
                ),

                const SizedBox(height: 8),

                // Client
                Text(
                  'Client: ${project.client}',
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontStyle: FontStyle.italic,
                  ),
                ),

                const SizedBox(height: 16),

                // Description
                Text(
                  project.description,
                  style: Theme.of(context).textTheme.bodyLarge,
                ),

                const SizedBox(height: 24),

                // Achievements
                Text(
                  'Key Achievements',
                  style: Theme.of(
                    context,
                  ).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
                ),

                const SizedBox(height: 16),

                ...project.achievements.map(
                  (achievement) => Padding(
                    padding: const EdgeInsets.only(bottom: 8.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Icon(
                          Icons.check_circle,
                          color: Theme.of(context).colorScheme.primary,
                          size: 20,
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Text(
                            achievement,
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                const SizedBox(height: 24),

                // Technologies used
                Text(
                  'Technologies Used',
                  style: Theme.of(
                    context,
                  ).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
                ),

                const SizedBox(height: 16),

                Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  children:
                      project.technologies
                          .map(
                            (tech) => Chip(
                              label: Text(tech),
                              backgroundColor: Theme.of(
                                context,
                              ).colorScheme.secondary.withValues(alpha: 0.1),
                              labelStyle: TextStyle(
                                color: Theme.of(context).colorScheme.secondary,
                              ),
                            ),
                          )
                          .toList(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
