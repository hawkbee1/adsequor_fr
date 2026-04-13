import 'package:flutter_test/flutter_test.dart';
import 'package:adsequor_fr/models/service.dart';

void main() {
  group('Service', () {
    test('can be instantiated with required fields', () {
      const service = Service(
        id: 'test_id',
        title: 'Test Service',
        description: 'A test service',
        imageUrl: 'assets/test.png',
        features: ['Feature 1', 'Feature 2'],
      );
      expect(service.id, 'test_id');
      expect(service.title, 'Test Service');
      expect(service.description, 'A test service');
      expect(service.imageUrl, 'assets/test.png');
      expect(service.features, ['Feature 1', 'Feature 2']);
    });
  });

  group('adsequorServices', () {
    test('has 3 services', () {
      expect(adsequorServices.length, 3);
    });

    test('each service has an id and features', () {
      for (final service in adsequorServices) {
        expect(service.id, isNotEmpty);
        expect(service.title, isNotEmpty);
        expect(service.description, isNotEmpty);
        expect(service.features, isNotEmpty);
      }
    });

    test('contains Application Development', () {
      expect(adsequorServices.any((s) => s.id == 'app_development'), true);
    });

    test('contains Backend Platform', () {
      expect(adsequorServices.any((s) => s.id == 'backend_platform'), true);
    });

    test('contains Technical Consulting', () {
      expect(adsequorServices.any((s) => s.id == 'consulting'), true);
    });
  });
}
