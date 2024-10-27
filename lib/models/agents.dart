class Agent {
  final String displayName;
  final String description;
  final String displayIcon;
  final String bustPortrait;
  final Role role;
  final List<Ability> abilities;

  Agent({
    required this.displayName,
    required this.description,
    required this.displayIcon,
    required this.bustPortrait,
    required this.role,
    required this.abilities,
  });

  factory Agent.fromJson(Map<String, dynamic> json) {
    return Agent(
      displayName: json['displayName'] ?? '',
      description: json['description'] ?? '',
      displayIcon: json['displayIcon'] ?? '',
      bustPortrait: json['bustPortrait'] ?? '',
      role: Role.fromJson(json['role'] ?? {}),
      abilities: (json['abilities'] as List)
          .map((abilityJson) => Ability.fromJson(abilityJson))
          .toList(),
    );
  }
}

class Role {
  final String displayName;
  final String displayIcon;

  Role({required this.displayName, required this.displayIcon});

  factory Role.fromJson(Map<String, dynamic> json) {
    return Role(
      displayName: json['displayName'] ?? '',
      displayIcon: json['displayIcon'] ?? '',
    );
  }
}

class Ability {
  final String displayName;
  final String description;
  final String displayIcon;

  Ability({
    required this.displayName,
    required this.description,
    required this.displayIcon,
  });

  factory Ability.fromJson(Map<String, dynamic> json) {
    return Ability(
      displayName: json['displayName'] ?? '',
      description: json['description'] ?? '',
      displayIcon: json['displayIcon'] ?? '',
    );
  }
}
