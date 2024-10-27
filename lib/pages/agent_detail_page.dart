import 'package:flutter/material.dart';
import 'package:val_app/models/agents.dart';

class AgentDetailPage extends StatelessWidget {
  final Agent agent;

  const AgentDetailPage({Key? key, required this.agent}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Agent Detail',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        automaticallyImplyLeading: false,
        backgroundColor: Colors.grey[900],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pop(context);
        },
        child: const Icon(Icons.arrow_back),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Bust Portrait Image
            Center(
              child: Image.network(
                agent.bustPortrait.isNotEmpty
                    ? agent.bustPortrait
                    : 'https://via.placeholder.com/150',
                width: 500,
                height: 500,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) =>
                    const Icon(Icons.broken_image, size: 100),
              ),
            ),
            const SizedBox(height: 20),

            // Display Name
            Center(
              child: Text(
                agent.displayName,
                style: const TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                  color: Colors.lightBlue,
                ),
              ),
            ),
            const SizedBox(height: 10),

            // Description
            Text(
              agent.description.isNotEmpty
                  ? agent.description
                  : 'No description available.',
              style: const TextStyle(
                fontSize: 16,
                color: Colors.white70,
              ),
            ),
            const SizedBox(height: 20),

            // Role Information
            Row(
              children: [
                if (agent.role.displayIcon.isNotEmpty)
                  Image.network(
                    agent.role.displayIcon,
                    width: 40,
                    height: 40,
                    errorBuilder: (context, error, stackTrace) =>
                        const Icon(Icons.broken_image, size: 30),
                  ),
                const SizedBox(width: 10),
                Text(
                  agent.role.displayName.isNotEmpty
                      ? agent.role.displayName
                      : 'No role information',
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 40),

            // Abilities List
            const Text(
              'Abilities:',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 10),
            Column(
              children: agent.abilities.map((ability) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20.0),
                  child: Row(
                    children: [
                      // Ability Icon
                      if (ability.displayIcon.isNotEmpty)
                        Image.network(
                          ability.displayIcon,
                          width: 60,
                          height: 60,
                          errorBuilder: (context, error, stackTrace) =>
                              const Icon(Icons.broken_image, size: 40),
                        ),
                      const SizedBox(width: 15),
                      // Ability Details
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              ability.displayName.isNotEmpty
                                  ? ability.displayName
                                  : 'No ability name',
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                            const SizedBox(height: 5),
                            Text(
                              ability.description.isNotEmpty
                                  ? ability.description
                                  : 'No description available.',
                              style: const TextStyle(
                                fontSize: 14,
                                color: Colors.white70,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              }).toList(),
            ),
          ],
        ),
      ),
      backgroundColor: Colors.grey[900],
    );
  }
}

