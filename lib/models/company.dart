class CompanyProfile {
  final String name;
  final String tagline;
  final String foundedYear;
  final String description;
  final String location;
  final List<String> values;
  final List<String> platforms;
  final Map<String, String> contact;
  final List<TeamMember> team;

  const CompanyProfile({
    required this.name,
    required this.tagline,
    required this.foundedYear,
    required this.description,
    required this.location,
    required this.values,
    required this.platforms,
    required this.contact,
    required this.team,
  });
}

class TeamMember {
  final String name;
  final String role;
  final String bio;
  final List<String> expertise;
  final Map<String, String> contact;
  final String? imageAsset;

  const TeamMember({
    required this.name,
    required this.role,
    required this.bio,
    required this.expertise,
    required this.contact,
    this.imageAsset,
  });
}

// Adsequor company profile
final CompanyProfile adsequorProfile = CompanyProfile(
  name: 'Adsequor',
  tagline: 'Dart, Flutter and Appwrite application studio',
  foundedYear: '2002',
  description:
      'Adsequor designs, builds and ships business applications with a pragmatic '
      'stack: Dart for shared logic, Flutter for polished interfaces, and Appwrite '
      'for backend services. We help companies move from product idea to production '
      'with one codebase strategy, clear architecture, and delivery that targets '
      'mobile, web and desktop environments without fragmenting the product team.',
  location: 'Normandy, France',
  values: [
    'Pragmatic architecture',
    'Reliable delivery',
    'Transparent collaboration',
    'Long-term maintainability',
    'Product focus',
  ],
  platforms: [
    'Mobile phones',
    'Web applications',
    'Web servers',
    'macOS',
    'Windows',
    'Linux',
  ],
  contact: {
    'linkedin': 'linkedin.com/in/hawkbee',
    'github': 'github.com/hawkbee1',
  },
  team: [
    TeamMember(
      name: 'Adsequor Delivery Team',
      role: 'Architecture, product delivery and platform engineering',
      bio:
          'Adsequor combines product discovery, application engineering and deployment '
          'practices so clients can launch a coherent platform instead of a disconnected '
          'set of prototypes. The focus is on dependable releases, measurable outcomes '
          'and a codebase that remains easy to evolve.',
      expertise: [
        'Dart architecture',
        'Flutter apps',
        'Appwrite backends',
        'API integration',
        'CI/CD and release management',
        'Cross-platform delivery',
      ],
      contact: {
        'linkedin': 'linkedin.com/in/hawkbee',
        'github': 'github.com/hawkbee1',
      },
      imageAsset: null,
    ),
  ],
);
