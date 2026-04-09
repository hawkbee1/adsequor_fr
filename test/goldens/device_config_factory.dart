import 'package:flutter/material.dart';

class DeviceConfig {
  final String name;
  final Size size;
  final double devicePixelRatio;
  final double textScale;

  const DeviceConfig({
    required this.name,
    required this.size,
    this.devicePixelRatio = 1.0,
    this.textScale = 1.0,
  });

  BoxConstraints get constraints => BoxConstraints.tight(size);
}

class DeviceConfigFactory {
  static const DeviceConfig androidPhone = DeviceConfig(
    name: 'android_phone',
    size: Size(411, 823),
    devicePixelRatio: 3.0,
  );

  static const DeviceConfig androidSmall = DeviceConfig(
    name: 'android_small',
    size: Size(320, 533),
    devicePixelRatio: 2.0,
  );

  static const DeviceConfig androidTablet = DeviceConfig(
    name: 'android_tablet',
    size: Size(800, 1280),
    devicePixelRatio: 2.0,
    textScale: 1.5,
  );

  static const DeviceConfig iosPhone = DeviceConfig(
    name: 'ios_phone',
    size: Size(390, 844),
    devicePixelRatio: 3.0,
  );

  static const DeviceConfig iosSmall = DeviceConfig(
    name: 'ios_small',
    size: Size(320, 568),
    devicePixelRatio: 2.0,
  );

  static const DeviceConfig iosTablet = DeviceConfig(
    name: 'ios_tablet',
    size: Size(1024, 1366),
    devicePixelRatio: 2.0,
    textScale: 1.5,
  );

  static const DeviceConfig defaulTestScreen = DeviceConfig(
    name: 'defaulTestScreen',
    size: Size(1800, 2400),
    devicePixelRatio: 1.0,
    textScale: 1,
  );

  static const DeviceConfig minimalTestScreen = DeviceConfig(
    name: 'minimalTestScreen',
    size: Size(320, 480),
    devicePixelRatio: 1.0,
    textScale: 1,
  );

  static List<DeviceConfig> get portraitDevices => [
    androidPhone,
    androidSmall,
    androidTablet,
    iosPhone,
    iosSmall,
    iosTablet,
    defaulTestScreen,
    minimalTestScreen,
  ];

  static List<DeviceConfig> get landscapeDevices =>
      portraitDevices.map((device) {
        return DeviceConfig(
          name: '${device.name}_landscape',
          size: Size(device.size.height, device.size.width),
          devicePixelRatio: device.devicePixelRatio,
          textScale: device.textScale,
        );
      }).toList();

  static List<DeviceConfig> get allDevices => [
    ...portraitDevices,
    ...landscapeDevices,
  ];
}
