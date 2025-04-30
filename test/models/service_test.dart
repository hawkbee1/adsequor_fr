import 'package:flutter_test/flutter_test.dart';
import 'package:adsequor_fr/models/service.dart';

void main() {
  group('Service Model', () {
    test('Service constructor creates instance with correct values', () {
      // Arrange - Create test data
      const id = 'test_service';
      const title = 'Test Service';
      const description = 'Service for testing';
      const imageUrl = 'assets/test_image.png';
      final features = ['Feature 1', 'Feature 2', 'Feature 3'];

      // Act - Create a service instance
      final service = Service(
        id: id,
        title: title,
        description: description,
        imageUrl: imageUrl,
        features: features,
      );

      // Assert - Verify properties
      expect(service.id, equals(id));
      expect(service.title, equals(title));
      expect(service.description, equals(description));
      expect(service.imageUrl, equals(imageUrl));
      expect(service.features, equals(features));
    });

    test('adsequorServices list contains all expected services', () {
      // Verify the predefined services list
      expect(adsequorServices.length, equals(3));

      // Test specific services
      expect(adsequorServices[0].id, equals('flutter_dev'));
      expect(adsequorServices[1].id, equals('business_intel'));
      expect(adsequorServices[2].id, equals('it_consulting'));

      // Test service titles
      expect(adsequorServices[0].title, equals('Flutter Development'));
      expect(adsequorServices[1].title, equals('Business Intelligence'));
      expect(adsequorServices[2].title, equals('IT Consulting'));

      // Test image URLs
      expect(adsequorServices[0].imageUrl, equals('assets/flutter_dev.png'));
      expect(adsequorServices[1].imageUrl, equals('assets/bi_solutions.png'));
      expect(adsequorServices[2].imageUrl, equals('assets/consulting.png'));

      // Test feature counts
      expect(adsequorServices[0].features.length, equals(6));
      expect(adsequorServices[1].features.length, equals(6));
      expect(adsequorServices[2].features.length, equals(6));
    });
  });
}
