import 'package:flutter_test/flutter_test.dart';
import 'package:adsequor_fr/models/company.dart';

void main() {
  group('Company Models', () {
    test('TeamMember constructor creates instance with correct values', () {
      // Arrange - Create test data
      const name = 'Test Member';
      const role = 'Test Role';
      const bio = 'Test biography';
      final expertise = ['Skill 1', 'Skill 2'];
      final contact = {'email': 'test@example.com', 'github': 'test-user'};
      const imageAsset = 'assets/test_image.jpg';

      // Act - Create a team member instance
      final teamMember = TeamMember(
        name: name,
        role: role,
        bio: bio,
        expertise: expertise,
        contact: contact,
        imageAsset: imageAsset,
      );

      // Assert - Verify properties
      expect(teamMember.name, equals(name));
      expect(teamMember.role, equals(role));
      expect(teamMember.bio, equals(bio));
      expect(teamMember.expertise, equals(expertise));
      expect(teamMember.contact, equals(contact));
      expect(teamMember.imageAsset, equals(imageAsset));
    });

    test('TeamMember constructor works with null imageAsset', () {
      // Act - Create a team member instance without imageAsset
      final teamMember = TeamMember(
        name: 'Name',
        role: 'Role',
        bio: 'Bio',
        expertise: ['Skill'],
        contact: {'email': 'email@test.com'},
        // imageAsset not provided
      );

      // Assert - Verify imageAsset is null
      expect(teamMember.imageAsset, isNull);
    });

    test('CompanyProfile constructor creates instance with correct values', () {
      // Arrange
      const name = 'Test Company';
      const tagline = 'Test Tagline';
      const foundedYear = '2020';
      const description = 'Test description';
      const location = 'Test Location';
      final values = ['Value 1', 'Value 2'];
      final contact = {'email': 'company@example.com'};
      final team = [
        TeamMember(
          name: 'Team Member 1',
          role: 'Role 1',
          bio: 'Bio 1',
          expertise: ['Skill 1'],
          contact: {'email': 'member1@example.com'},
        ),
      ];

      // Act - Create company profile
      final companyProfile = CompanyProfile(
        name: name,
        tagline: tagline,
        foundedYear: foundedYear,
        description: description,
        location: location,
        values: values,
        contact: contact,
        team: team,
      );

      // Assert
      expect(companyProfile.name, equals(name));
      expect(companyProfile.tagline, equals(tagline));
      expect(companyProfile.foundedYear, equals(foundedYear));
      expect(companyProfile.description, equals(description));
      expect(companyProfile.location, equals(location));
      expect(companyProfile.values, equals(values));
      expect(companyProfile.contact, equals(contact));
      expect(companyProfile.team, equals(team));
    });

    test('adsequorProfile contains correct predefined values', () {
      // Verify the predefined profile
      expect(adsequorProfile.name, equals('Adsequor'));
      expect(adsequorProfile.foundedYear, equals('2002'));
      expect(adsequorProfile.location, equals('Normandy, France'));

      // Team tests
      expect(adsequorProfile.team.length, equals(1));
      expect(adsequorProfile.team[0].name, equals('Romuald Barbe'));
      expect(adsequorProfile.team[0].role, equals('Founder & Lead Developer'));
      expect(
        adsequorProfile.team[0].imageAsset,
        equals('assets/profil_online.jpg'),
      );

      // Contact information
      expect(
        adsequorProfile.contact['email'],
        equals('barbe.romuald@gmail.com'),
      );
      expect(adsequorProfile.contact['github'], equals('github.com/hawkbee1'));

      // Values
      expect(adsequorProfile.values.length, equals(5));
      expect(adsequorProfile.values.contains('Innovation'), isTrue);
      expect(adsequorProfile.values.contains('Quality'), isTrue);
    });
  });
}
