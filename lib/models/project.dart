class Project {
  final String title;
  final String client;
  final String duration;
  final String description;
  final List<String> achievements;
  final List<String> technologies;
  final String? imageAsset;

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

class Testimonial {
  final String author;
  final String position;
  final String company;
  final String quote;

  const Testimonial({
    required this.author,
    required this.position,
    required this.company,
    required this.quote,
  });
}

// Sample projects based on the resume information
final List<Project> adsequorProjects = [
  Project(
    title: 'ALTME Mobile Wallet',
    client: 'TALAO - ALTME',
    duration: '2021 - Present',
    description:
        'Leading the development of mobile wallets for crypto and Self Sovereign Identity (SSI), evolving from a basic SSI wallet to a comprehensive crypto solution with advanced features.',
    achievements: [
      'Led a Flutter development team using SCRUM methodology',
      'Maintained and improved two mobile applications with continuous delivery via GitHub and Fastlane',
      'Implemented support for OIDC4VCI, OIDC4VP, SD-JWT VC, DID standards',
      'Added support for multiple blockchains including Ethereum, Tezos, Fantom, Polygon, BNB and Etherlink',
      'Built and published specialized wallets for specific use cases',
    ],
    technologies: [
      'Flutter',
      'Dart',
      'Firebase',
      'GitHub Actions',
      'Fastlane',
      'Blockchain',
      'SSI',
      'OIDC',
    ],
    imageAsset: null,
  ),
  Project(
    title: 'Enterprise Business Intelligence System',
    client: 'Confidential',
    duration: '2010 - 2018',
    description:
        'Created custom operating systems specifically designed for direct Business Intelligence usage, resulting in significant cost reductions while maintaining long-term performance.',
    achievements: [
      'Reduced project costs by 40%',
      'Developed a solution that has remained effective for over 15 years',
      'Designed and implemented optimized data warehouse architecture',
      'Provided comprehensive documentation and user training',
    ],
    technologies: [
      'Business Intelligence',
      'Data Warehousing',
      'SQL',
      'ETL',
      'Business Objects',
    ],
    imageAsset: null,
  ),
  Project(
    title: 'University Teacher Recruitment Platform',
    client: 'National Education Institution',
    duration: '2001 - 2002',
    description:
        'Developed a comprehensive web application for the national recruitment of university teachers, streamlining the application and selection process.',
    achievements: [
      'Built a scalable platform handling thousands of applications',
      'Implemented secure user authentication and data management',
      'Provided administrators with powerful tools for candidate evaluation',
      'Improved efficiency in the teacher recruitment process',
    ],
    technologies: ['PHP', 'HTML', 'CSS', 'JavaScript', 'MySQL'],
    imageAsset: null,
  ),
];

// Sample testimonials
final List<Testimonial> adsequorTestimonials = [
  Testimonial(
    author: 'Marie Laurent',
    position: 'CTO',
    company: 'TechInnovate',
    quote:
        'Working with Adsequor transformed our approach to data analysis. Their expertise in Business Intelligence helped us uncover critical insights that have driven our growth strategy.',
  ),
  Testimonial(
    author: 'Philippe Dubois',
    position: 'Product Manager',
    company: 'MobileSoft',
    quote:
        'The Flutter applications developed by Adsequor exceeded our expectations. They delivered on time, with excellent quality, and provided thoughtful guidance throughout the process.',
  ),
  Testimonial(
    author: 'Sophie Moreau',
    position: 'Team Lead',
    company: 'DataForge',
    quote:
        'The Scrum coaching we received from Adsequor was invaluable. Our team productivity improved significantly, and we now have a sustainable, efficient development process.',
  ),
];
