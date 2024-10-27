import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:val_app/models/agents.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class AgentsProvider with ChangeNotifier {
  List<Agent> _agents = [];
  bool _isLoading = true;

  List<Agent> get agents => _agents;
  bool get isLoading => _isLoading;

  AgentsProvider() {
    fetchAgents();
  }

  Future<void> fetchAgents() async {
    try {
      final response = await http.get(Uri.parse('https://valorant-api.com/v1/agents'));
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        _agents = (data['data'] as List).map((agent) => Agent.fromJson(agent)).toList();
      } else {
        if (kDebugMode) {
          print("Failed to load agents");
        }
      }
    } catch (e) {
      if (kDebugMode) {
        print("Error fetching agents: $e");
      }
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}