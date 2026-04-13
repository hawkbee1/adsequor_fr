/// Represents a project or case study.
class Project {
  /// Project title.
  final String title;

  /// Client name.
  final String client;

  /// Duration / period.
  final String duration;

  /// Short description.
  final String description;

  /// Key achievements.
  final List<String> achievements;

  /// Technologies used.
  final List<String> technologies;

  /// Optional image asset path.
  final String? imageAsset;

  /// Creates a [Project].
  const Project({
    required this.title,
    required this.client,
    required this.duration,
    required this.description,
    required this.achievements,
    required this.technologies,
    this.imageAsset,
  });
}

/// Represents a client testimonial.
class Testimonial {
  /// Author's name.
  final String author;

  /// Author's position / title.
  final String position;

  /// Author's company.
  final String company;

  /// Quote text.
  final String quote;

  /// Creates a [Testimonial].
  const Testimonial({
    required this.author,
    required this.position,
    required this.company,
    required this.quote,
  });
}

/// Sample projects delivered with the Flutter + Appwrite stack.
const List<Project> adsequorProjects = [
  Project(
    title: 'ALTME Mobile Wallet',
    client: 'TALAO — ALTME',
    duration: '2021 — Present',
    description:
        'A cross-platform crypto and Self-Sovereign Identity wallet built '
        'entirely in Flutter, published on both app stores with continuous '
        'delivery via GitHub Actions and Fastlane.',
    achievements: [
      'Led a Flutter team using Scrum methodology',
      'Published on Google Play and the App Store',
      'Implemented OIDC4VCI, OIDC4VP, SD-JWT VC and DID standards',
      'Multi-blockchain support: Ethereum, Tezos, Polygon, BNB & more',
    ],
    technologies: [
      'Flutter',
      'Dart',
      'GitHub Actions',
      'Fastlane',
      'Blockchain',
    ],
  ),
  Project(
    title: 'Enterprise Business Intelligence',
    client: 'Confidential',
    duration: '2010 — 2018',
    description:
        'Custom BI system that reduced project costs by 40% and has remained '
        'in production for over 15 years, demonstrating the long-term value '
        'of well-architected solutions.',
    achievements: [
      'Reduced project costs by 40%',
      'Solution still in production after 15+ years',
      'Optimised data-warehouse architecture',
    ],
    technologies: ['Business Intelligence', 'Data Warehousing', 'SQL', 'ETL'],
  ),
];

/// Sample testimonials.
const List<Testimonial> adsequorTestimonials = [
  Testimonial(
    author: 'Philippe Dubois',
    position: 'Product Manager',
    company: 'MobileSoft',
    quote:
        'The Flutter applications developed by Adsequor exceeded our '
        'expectations. Delivered on time, with excellent quality.',
  ),
  Testimonial(
    author: 'Sophie Moreau',
    position: 'Team Lead',
    company: 'DataForge',
    quote:
        'The Scrum coaching we received from Adsequor was invaluable. '
        'Our team productivity improved significantly.',
  ),
];
