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
    id: 'flutter_dev',
    title: 'Flutter Development',
    description:
        'Cross-platform mobile and web application development using Google\'s Flutter framework.',
    imageUrl:
        'assets/flutter_dev.png', // You may need to update this with actual image
    features: [
      'Cross-platform mobile apps',
      'Web applications',
      'Desktop applications',
      'Custom widgets development',
      'State management solutions',
      'Performance optimization',
    ],
  ),
  Service(
    id: 'business_intel',
    title: 'Business Intelligence',
    description:
        'Comprehensive business intelligence solutions to help organizations make data-driven decisions.',
    imageUrl:
        'assets/bi_solutions.png', // You may need to update this with actual image
    features: [
      'Data warehouse design',
      'ETL processes',
      'Dashboard development',
      'Data analysis',
      'Reporting solutions',
      'Performance metrics',
    ],
  ),
  Service(
    id: 'it_consulting',
    title: 'IT Consulting',
    description:
        'Strategic IT consulting services to optimize your technology infrastructure and processes.',
    imageUrl:
        'assets/consulting.png', // You may need to update this with actual image
    features: [
      'Technology assessment',
      'Digital transformation',
      'Project management',
      'Team leadership',
      'Agile methodology implementation',
      'Technical architecture design',
    ],
  ),
];
