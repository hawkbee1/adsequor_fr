class Service {
  final String id;
  final String title;
  final String description;
  final String imageUrl;
  final List<String> features;

  Service({
    required this.id,
    required this.title,
    required this.description,
    required this.imageUrl,
    required this.features,
  });
}

// List of services offered by Adsequor
final List<Service> adsequorServices = [
  Service(
    id: 'dart_engineering',
    title: 'Dart Engineering',
    description:
        'Application logic, domain modeling and integration layers built in Dart so the core of your product stays consistent across platforms.',
    imageUrl: 'assets/flutter_dev.png',
    features: [
      'Shared business logic for client and server flows',
      'Clean architecture and modular code organization',
      'API clients, authentication and data workflows',
      'Automated testing and release-ready foundations',
    ],
  ),
  Service(
    id: 'flutter_applications',
    title: 'Flutter Applications',
    description:
        'User-facing products delivered with Flutter for mobile, web and desktop from one codebase, with native-feeling experiences on every target.',
    imageUrl: 'assets/consulting.png',
    features: [
      'Android and iPhone applications',
      'Responsive web applications',
      'Desktop apps for macOS, Windows and Linux',
      'Design system implementation and performance tuning',
    ],
  ),
  Service(
    id: 'appwrite_platform',
    title: 'Appwrite Backend Platform',
    description:
        'Backend capabilities delivered with Appwrite to accelerate authentication, data storage, file handling, functions and operations without rebuilding common infrastructure.',
    imageUrl: 'assets/bi_solutions.png',
    features: [
      'Authentication and user management',
      'Databases, storage and permissions',
      'Cloud functions and event-driven workflows',
      'Deployment patterns for secure web server workloads',
    ],
  ),
];
