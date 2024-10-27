import 'package:flutter/foundation.dart';

class Weapon {
  final String displayName;
  final String displayIcon;
  final String category;

  Weapon({
    required this.displayName,
    required this.displayIcon,
    required this.category,
  });

  factory Weapon.fromJson(Map<String, dynamic> json) {
    if (kDebugMode) {
      print(json);
    }

    return Weapon(
      displayName: json['displayName'] ?? '',
      displayIcon: json['displayIcon'] ?? '',
      category: (json['category'] as String).split('::').last,
    );
  }
}
