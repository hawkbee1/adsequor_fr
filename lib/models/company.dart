/// Represents the company profile information.
class CompanyProfile {
  /// The company name.
  final String name;

  /// Short tagline summarising the company's mission.
  final String tagline;

  /// Year the company was founded.
  final String foundedYear;

  /// A longer text describing the company.
  final String description;

  /// Physical location of the company.
  final String location;

  /// Core values of the company.
  final List<String> values;

  /// Contact links (e.g. linkedin, github).
  final Map<String, String> contact;

  /// Creates a [CompanyProfile].
  const CompanyProfile({
    required this.name,
    required this.tagline,
    required this.foundedYear,
    required this.description,
    required this.location,
    required this.values,
    required this.contact,
  });
}

/// A component of the technical offer (e.g. Flutter, Appwrite, Dart).
class TechComponent {
  /// Display name.
  final String name;

  /// Short description of the technology.
  final String description;

  /// Asset path for the logo image.
  final String logoAsset;

  /// External URL for more information.
  final String url;

  /// Key features / bullet points.
  final List<String> features;

  /// Creates a [TechComponent].
  const TechComponent({
    required this.name,
    required this.description,
    required this.logoAsset,
    required this.url,
    required this.features,
  });
}

/// A supported deployment platform (e.g. Android, Web, Linux).
class Platform {
  /// Display name.
  final String name;

  /// Short description of the platform support.
  final String description;

  /// Material icon name.
  final String iconName;

  /// Creates a [Platform].
  const Platform({
    required this.name,
    required this.description,
    required this.iconName,
  });
}

/// A metric with a source link for credibility.
class PerformanceMetric {
  /// The metric headline (e.g. "60% faster development").
  final String headline;

  /// Longer explanatory text.
  final String description;

  /// URL to the source article/study.
  final String sourceUrl;

  /// Short label for the source.
  final String sourceLabel;

  /// Creates a [PerformanceMetric].
  const PerformanceMetric({
    required this.headline,
    required this.description,
    required this.sourceUrl,
    required this.sourceLabel,
  });
}

/// The Adsequor company profile.
const CompanyProfile adsequorProfile = CompanyProfile(
  name: 'Adsequor',
  tagline: 'Scalable Applications with Open-Source Technologies',
  foundedYear: '2002',
  description:
      'Adsequor builds modern applications which can be deployed on-premise or in the cloud.\n'
      'It works on every major platform: mobile, web and desktop.\n'
      'You own the code, the data and the infrastructure — no vendor lock-in, no hidden fees.',
  location: 'Normandy, France',
  values: [
    'Open Source',
    'Scalability',
    'Multi-Platform',
    'Performance',
    'Ownership',
  ],
  contact: {
    'linkedin': 'linkedin.com/in/hawkbee',
    'github': 'github.com/hawkbee1',
  },
);

/// The three pillars of the Adsequor tech stack.
const List<TechComponent> adsequorTechStack = [
  TechComponent(
    name: 'Flutter',
    description:
        'Google\'s open-source UI toolkit for building beautiful, natively '
        'compiled applications for mobile, web and desktop from a single '
        'codebase. Flutter compiles to ARM/Intel machine code and JavaScript '
        'for fast performance on every device.',
    logoAsset: 'assets/flutter_logo.png',
    url: 'https://flutter.dev/',
    features: [
      'Single codebase for iOS, Android, Web, macOS, Windows & Linux',
      'Hot reload for sub-second development feedback',
      'Rich widget library with Material & Cupertino design',
      'Natively compiled — no bridge, no interpreter',
      'Backed by Google, used by BMW, eBay, Alibaba & more',
    ],
  ),
  TechComponent(
    name: 'Dart',
    description:
        'A client-optimised language created by Google for building fast apps '
        'on any platform. Dart powers Flutter and offers sound null safety, '
        'async/await, strong typing and ahead-of-time compilation.',
    logoAsset: 'assets/dart_logo.png',
    url: 'https://dart.dev/',
    features: [
      'Sound null safety eliminates null-reference errors',
      'AOT compilation for fast startup & consistent performance',
      'JIT compilation with hot reload for rapid development',
      'Modern async/await and isolate-based concurrency',
      'Growing ecosystem with 45 000+ packages on pub.dev',
    ],
  ),
  TechComponent(
    name: 'Appwrite',
    description:
        'An open-source, self-hosted Backend-as-a-Service (BaaS) that provides '
        'all the backend building blocks: authentication, databases, storage, '
        'serverless functions, messaging and real-time subscriptions — all from '
        'a single platform you can install anywhere.',
    logoAsset: 'assets/appwrite_logo.png',
    url: 'https://appwrite.io/',
    features: [
      'Auth, databases, storage, functions, messaging & real-time',
      'Self-hosted or Appwrite Cloud — you choose',
      'SOC-2, GDPR, HIPAA & CCPA compliant',
      'Built-in DDoS protection & encryption at rest and in transit',
      'Trusted by Apple, Oracle, TikTok, Intel & Decathlon',
    ],
  ),
];

/// Supported deployment platforms.
const List<Platform> adsequorPlatforms = [
  Platform(
    name: 'Android & iOS',
    description:
        'Native ARM-compiled apps distributed via Google Play and the App Store.',
    iconName: 'phone_android',
  ),
  Platform(
    name: 'Web Application',
    description:
        'Progressive Web Apps served from any web server, working offline.',
    iconName: 'web',
  ),
  Platform(
    name: 'macOS',
    description: 'Native desktop app for Apple Silicon and Intel Macs.',
    iconName: 'desktop_mac',
  ),
  Platform(
    name: 'Windows',
    description: 'Native Win32 application for Windows 10 and later.',
    iconName: 'desktop_windows',
  ),
  Platform(
    name: 'Linux',
    description: 'Native GTK application for popular Linux distributions.',
    iconName: 'computer',
  ),
  Platform(
    name: 'Web Server (Appwrite)',
    description:
        'Self-hosted backend running on any Linux server or Docker host.',
    iconName: 'dns',
  ),
];

/// Performance metrics with source references.
const List<PerformanceMetric> adsequorMetrics = [
  PerformanceMetric(
    headline: '60% faster development',
    description:
        'DevKind reduced development time by 60% and lowered server costs by 40% '
        'after switching to Appwrite as their backend platform.',
    sourceUrl: 'https://appwrite.io/blog/post/customer-story-storealert',
    sourceLabel: 'Appwrite — DevKind Case Study',
  ),
  PerformanceMetric(
    headline: 'Up to 50% less code',
    description:
        'Flutter\'s single-codebase approach means up to 50% less code compared '
        'to maintaining separate native iOS and Android projects, according to '
        'Surf, a leading Flutter development agency.',
    sourceUrl: 'https://surf.dev/flutter-vs-native/',
    sourceLabel: 'Surf — Flutter vs Native',
  ),
  PerformanceMetric(
    headline: '700% infrastructure savings',
    description:
        'K-Collect reduced infrastructure costs by 700% by migrating to '
        'Appwrite\'s self-hosted backend, demonstrating the scalability of the '
        'open-source stack.',
    sourceUrl: 'https://appwrite.io/',
    sourceLabel: 'Appwrite — Homepage Metrics',
  ),
  PerformanceMetric(
    headline: '1 billion+ monthly DB operations',
    description:
        'The Appwrite platform handles over 1 billion monthly database '
        'operations across its network, proving enterprise-grade scalability.',
    sourceUrl: 'https://appwrite.io/',
    sourceLabel: 'Appwrite — Homepage Metrics',
  ),
];
