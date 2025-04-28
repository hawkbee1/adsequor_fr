import 'package:flutter/material.dart';

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
