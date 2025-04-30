import 'package:flutter_test/flutter_test.dart';
import 'package:adsequor_fr/models/project.dart';

void main() {
  group('Project Models', () {
    test('Project constructor creates instance with correct values', () {
      // Arrange - Create test data
      const title = 'Test Project';
      const client = 'Test Client';
      const duration = '2022-2023';
      const description = 'Test project description';
      final achievements = ['Achievement 1', 'Achievement 2'];
      final technologies = ['Tech 1', 'Tech 2'];
      const imageAsset = 'assets/test_image.jpg';

      // Act - Create a project instance
      final project = Project(
        title: title,
        client: client,
        duration: duration,
        description: description,
        achievements: achievements,
        technologies: technologies,
        imageAsset: imageAsset,
      );

      // Assert - Verify properties
      expect(project.title, equals(title));
      expect(project.client, equals(client));
      expect(project.duration, equals(duration));
      expect(project.description, equals(description));
      expect(project.achievements, equals(achievements));
      expect(project.technologies, equals(technologies));
      expect(project.imageAsset, equals(imageAsset));
    });

    test('Project constructor works with null imageAsset', () {
      // Act - Create a project instance without imageAsset
      final project = Project(
        title: 'Test',
        client: 'Client',
        duration: 'Duration',
        description: 'Description',
        achievements: ['Achievement'],
        technologies: ['Tech'],
        // imageAsset not provided
      );

      // Assert - Verify imageAsset is null
      expect(project.imageAsset, isNull);
    });

    test('Testimonial constructor creates instance with correct values', () {
      // Arrange - Create test data
      const author = 'Test Author';
      const position = 'Test Position';
      const company = 'Test Company';
      const quote = 'Test quote text';

      // Act - Create testimonial
      final testimonial = Testimonial(
        author: author,
        position: position,
        company: company,
        quote: quote,
      );

      // Assert - Verify properties
      expect(testimonial.author, equals(author));
      expect(testimonial.position, equals(position));
      expect(testimonial.company, equals(company));
      expect(testimonial.quote, equals(quote));
    });

    test('adsequorProjects contains expected projects', () {
      // Verify the predefined projects
      expect(adsequorProjects.length, equals(3));

      // Test first project
      expect(adsequorProjects[0].title, equals('ALTME Mobile Wallet'));
      expect(adsequorProjects[0].client, equals('TALAO - ALTME'));
      expect(adsequorProjects[0].technologies.contains('Flutter'), isTrue);
      expect(adsequorProjects[0].technologies.contains('Dart'), isTrue);

      // Test second project
      expect(
        adsequorProjects[1].title,
        equals('Enterprise Business Intelligence System'),
      );
      expect(adsequorProjects[1].client, equals('Confidential'));
      expect(
        adsequorProjects[1].technologies.contains('Business Intelligence'),
        isTrue,
      );

      // Test third project
      expect(
        adsequorProjects[2].title,
        equals('University Teacher Recruitment Platform'),
      );
      expect(
        adsequorProjects[2].client,
        equals('National Education Institution'),
      );
      expect(adsequorProjects[2].technologies.contains('PHP'), isTrue);
    });

    test('adsequorTestimonials contains expected testimonials', () {
      // Verify the predefined testimonials list
      expect(adsequorTestimonials.length, equals(3));

      // Test testimonials
      expect(adsequorTestimonials[0].author, equals('Marie Laurent'));
      expect(adsequorTestimonials[0].position, equals('CTO'));
      expect(adsequorTestimonials[0].company, equals('TechInnovate'));

      expect(adsequorTestimonials[1].author, equals('Philippe Dubois'));
      expect(adsequorTestimonials[1].position, equals('Product Manager'));

      expect(adsequorTestimonials[2].author, equals('Sophie Moreau'));
      expect(adsequorTestimonials[2].company, equals('DataForge'));
    });
  });
}
