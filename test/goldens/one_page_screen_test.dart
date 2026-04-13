import 'package:adsequor_fr/screens/one_page_screen.dart';
import 'package:alchemist/alchemist.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'device_config_factory.dart';

void main() {
  group('OnePageScreen Golden Tests', () {
    setUp(() {
      SharedPreferences.setMockInitialValues({});
    });

    for (final device in DeviceConfigFactory.allDevices) {
      goldenTest(
        'renders correctly on ${device.name}',
        fileName: 'one_page_screen_${device.name}',
        constraints: device.constraints,
        pumpBeforeTest: precacheImages,
        builder: () => GoldenTestScenario(
          name: device.name,
          child: ClipRect(
            child: SizedBox(
              width: device.size.width,
              height: device.size.height,
              child: MediaQuery(
                data: MediaQueryData(
                  size: device.size,
                  devicePixelRatio: device.devicePixelRatio,
                  textScaler: TextScaler.linear(device.textScale),
                ),
                child: const ProviderScope(
                  child: MaterialApp(
                    debugShowCheckedModeBanner: false,
                    home: OnePageScreen(),
                  ),
                ),
              ),
            ),
          ),
        ),
      );
    }
  });
}
