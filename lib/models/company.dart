class CompanyProfile {
  final String name;
  final String tagline;
  final String foundedYear;
  final String description;
  final String location;
  final List<String> values;
  final Map<String, String> contact;
  final List<TeamMember> team;

  const CompanyProfile({
    required this.name,
    required this.tagline,
    required this.foundedYear,
    required this.description,
    required this.location,
    required this.values,
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

// Adsequor company profile based on the resume information
final CompanyProfile adsequorProfile = CompanyProfile(
  name: 'Adsequor',
  tagline: 'IT Consultancy & Flutter Development Experts',
  foundedYear: '2002',
  description:
      'Adsequor is an IT services provider founded by Romuald Barbe in 2002. '
      'Specializing in Flutter development, Business Intelligence, and team leadership, '
      'Adsequor delivers innovative digital solutions for businesses of all sizes. '
      'With a focus on quality, efficiency, and long-term sustainability, we help clients '
      'navigate the complex technological landscape and achieve their business goals.',
  location: 'Normandy, France',
  values: [
    'Innovation',
    'Quality',
    'Expertise',
    'Collaboration',
    'Adaptability',
  ],
  contact: {
    'linkedin': 'linkedin.com/in/hawkbee',
    'github': 'github.com/hawkbee1',
  },
  team: [
    TeamMember(
      name: 'Romuald Barbe',
      role: 'Founder & Lead Developer',
      bio:
          'Seasoned IT contractor with extensive expertise in Flutter development, '
          'Business Intelligence, and Agile methodologies. With over 20 years of experience, '
          'Romuald has led teams of various sizes and worked with companies across different '
          'industries to deliver impactful digital solutions.',
      expertise: [
        'Flutter & Dart',
        'Business Intelligence',
        'Scrum Master',
        'Team Leadership',
        'Data Warehouse Design',
        'Mobile Development',
      ],
      contact: {
        'linkedin': 'linkedin.com/in/hawkbee',
        'github': 'github.com/hawkbee1',
      },
      imageAsset: 'assets/profil_online.jpg',
    ),
  ],
);
