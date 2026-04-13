import 'package:flutter_test/flutter_test.dart';
import 'package:adsequor_fr/models/project.dart';

void main() {
  group('Project', () {
    test('can be instantiated with required fields', () {
      const project = Project(
        title: 'Test',
        client: 'Client',
        duration: '2023',
        description: 'desc',
        achievements: ['Done something'],
        technologies: ['Dart'],
      );
      expect(project.title, 'Test');
      expect(project.client, 'Client');
      expect(project.duration, '2023');
      expect(project.description, 'desc');
      expect(project.achievements, ['Done something']);
      expect(project.technologies, ['Dart']);
      expect(project.imageAsset, isNull);
    });

    test('can be instantiated with optional imageAsset', () {
      const project = Project(
        title: 'Test',
        client: 'Client',
        duration: '2023',
        description: 'desc',
        achievements: [],
        technologies: [],
        imageAsset: 'assets/test.png',
      );
      expect(project.imageAsset, 'assets/test.png');
    });
  });

  group('Testimonial', () {
    test('can be instantiated with required fields', () {
      const testimonial = Testimonial(
        author: 'John',
        position: 'CTO',
        company: 'Acme',
        quote: 'Great work!',
      );
      expect(testimonial.author, 'John');
      expect(testimonial.position, 'CTO');
      expect(testimonial.company, 'Acme');
      expect(testimonial.quote, 'Great work!');
    });
  });

  group('adsequorProjects', () {
    test('has projects', () {
      expect(adsequorProjects, isNotEmpty);
    });

    test('each project has technologies', () {
      for (final project in adsequorProjects) {
        expect(project.technologies, isNotEmpty);
      }
    });
  });

  group('adsequorTestimonials', () {
    test('has testimonials', () {
      expect(adsequorTestimonials, isNotEmpty);
    });

    test('each testimonial has a quote', () {
      for (final testimonial in adsequorTestimonials) {
        expect(testimonial.quote, isNotEmpty);
      }
    });
  });
}
