import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:val_app/models/weapons.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class WeaponsProvider with ChangeNotifier {
  List<Weapon> _weapons = [];
  bool _isLoading = true;

  List<Weapon> get weapons => _weapons;
  bool get isLoading => _isLoading;

  WeaponsProvider() {
    fetchWeapons();
  }

  Future<void> fetchWeapons() async {
    try {
      final response = await http.get(Uri.parse('https://valorant-api.com/v1/weapons'));
      if (response.statusCode == 200) {
        final Map<String, dynamic> data = json.decode(response.body);
        print(data); // Log the entire response data
        final List<dynamic> weaponList = data['data'];
        _weapons = weaponList.map((weapon) => Weapon.fromJson(weapon)).toList();
      } else {
        throw Exception('Failed to load weapons');
      }
    } catch (error) {
      if (kDebugMode) {
        print(error);
      }
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}