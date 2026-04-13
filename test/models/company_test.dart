import 'package:flutter_test/flutter_test.dart';
import 'package:adsequor_fr/models/company.dart';

void main() {
  group('CompanyProfile', () {
    test('can be instantiated with required fields', () {
      const profile = CompanyProfile(
        name: 'Test',
        tagline: 'A tagline',
        foundedYear: '2020',
        description: 'desc',
        location: 'Paris',
        values: ['Quality'],
        contact: {'linkedin': 'test'},
      );
      expect(profile.name, 'Test');
      expect(profile.tagline, 'A tagline');
      expect(profile.foundedYear, '2020');
      expect(profile.description, 'desc');
      expect(profile.location, 'Paris');
      expect(profile.values, ['Quality']);
      expect(profile.contact, {'linkedin': 'test'});
    });
  });

  group('TechComponent', () {
    test('can be instantiated with required fields', () {
      const tech = TechComponent(
        name: 'Flutter',
        description: 'UI toolkit',
        logoAsset: 'assets/flutter.png',
        url: 'https://flutter.dev',
        features: ['Cross-platform'],
      );
      expect(tech.name, 'Flutter');
      expect(tech.description, 'UI toolkit');
      expect(tech.logoAsset, 'assets/flutter.png');
      expect(tech.url, 'https://flutter.dev');
      expect(tech.features, ['Cross-platform']);
    });
  });

  group('Platform', () {
    test('can be instantiated with required fields', () {
      const platform = Platform(
        name: 'Android',
        description: 'Native ARM',
        iconName: 'phone_android',
      );
      expect(platform.name, 'Android');
      expect(platform.description, 'Native ARM');
      expect(platform.iconName, 'phone_android');
    });
  });

  group('PerformanceMetric', () {
    test('can be instantiated with required fields', () {
      const metric = PerformanceMetric(
        headline: '60% faster',
        description: 'desc',
        sourceUrl: 'https://example.com',
        sourceLabel: 'Source',
      );
      expect(metric.headline, '60% faster');
      expect(metric.description, 'desc');
      expect(metric.sourceUrl, 'https://example.com');
      expect(metric.sourceLabel, 'Source');
    });
  });

  group('adsequorProfile', () {
    test('has correct name', () {
      expect(adsequorProfile.name, 'Adsequor');
    });

    test('has founded year', () {
      expect(adsequorProfile.foundedYear, '2002');
    });

    test('has contact info', () {
      expect(adsequorProfile.contact.containsKey('linkedin'), true);
      expect(adsequorProfile.contact.containsKey('github'), true);
    });

    test('has values', () {
      expect(adsequorProfile.values, isNotEmpty);
    });
  });

  group('adsequorTechStack', () {
    test('has 3 components', () {
      expect(adsequorTechStack.length, 3);
    });

    test('contains Flutter', () {
      expect(adsequorTechStack.any((t) => t.name == 'Flutter'), true);
    });

    test('contains Dart', () {
      expect(adsequorTechStack.any((t) => t.name == 'Dart'), true);
    });

    test('contains Appwrite', () {
      expect(adsequorTechStack.any((t) => t.name == 'Appwrite'), true);
    });

    test('each component has features', () {
      for (final tech in adsequorTechStack) {
        expect(tech.features, isNotEmpty);
      }
    });
  });

  group('adsequorPlatforms', () {
    test('has 6 platforms', () {
      expect(adsequorPlatforms.length, 6);
    });

    test('each platform has a name and description', () {
      for (final platform in adsequorPlatforms) {
        expect(platform.name, isNotEmpty);
        expect(platform.description, isNotEmpty);
        expect(platform.iconName, isNotEmpty);
      }
    });
  });

  group('adsequorMetrics', () {
    test('has 4 metrics', () {
      expect(adsequorMetrics.length, 4);
    });

    test('each metric has a source', () {
      for (final metric in adsequorMetrics) {
        expect(metric.headline, isNotEmpty);
        expect(metric.sourceUrl, startsWith('https://'));
        expect(metric.sourceLabel, isNotEmpty);
      }
    });
  });
}
