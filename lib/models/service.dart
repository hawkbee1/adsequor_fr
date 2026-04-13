/// Represents a service offered by Adsequor.
class Service {
  /// Unique identifier.
  final String id;

  /// Display title.
  final String title;

  /// Short description of the service.
  final String description;

  /// Asset path for a representative image.
  final String imageUrl;

  /// Key features / bullet points.
  final List<String> features;

  /// Creates a [Service].
  const Service({
    required this.id,
    required this.title,
    required this.description,
    required this.imageUrl,
    required this.features,
  });
}

/// Services offered by Adsequor.
const List<Service> adsequorServices = [
  Service(
    id: 'app_development',
    title: 'Application Development',
    description:
        'We design and build cross-platform applications with Flutter — a single '
        'codebase that compiles to native code for Android, iOS, Web, macOS, '
        'Windows and Linux.',
    imageUrl: 'assets/flutter_logo.png',
    features: [
      'Mobile apps (Android & iOS)',
      'Progressive Web Applications',
      'Desktop apps (macOS, Windows, Linux)',
      'Custom widget & design-system development',
      'Performance optimisation & profiling',
      'CI/CD pipeline setup with GitHub Actions & Fastlane',
    ],
  ),
  Service(
    id: 'backend_platform',
    title: 'Backend Platform with Appwrite',
    description:
        'We set up and operate Appwrite as your backend — authentication, databases, '
        'file storage, serverless functions, messaging and real-time events — '
        'self-hosted or in the cloud.',
    imageUrl: 'assets/appwrite_logo.png',
    features: [
      'Authentication (email, OAuth, magic link, SMS)',
      'Relational & document databases',
      'File storage with encryption and image transforms',
      'Serverless functions in 13+ languages',
      'Real-time event subscriptions',
      'Self-hosted deployment or Appwrite Cloud',
    ],
  ),
  Service(
    id: 'consulting',
    title: 'Technical Consulting',
    description:
        'We help teams adopt Flutter & Appwrite, set up architecture, review '
        'code and coach developers so the technology transfer is complete.',
    imageUrl: 'assets/dart_logo.png',
    features: [
      'Architecture review & design',
      'Flutter & Dart training workshops',
      'Code review & quality audits',
      'Migration strategy from native or legacy stacks',
      'Agile coaching (Scrum)',
      'Open-source contribution guidance',
    ],
  ),
];
