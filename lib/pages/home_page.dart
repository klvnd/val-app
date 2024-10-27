import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:val_app/service/agents_provider.dart';
import 'package:val_app/service/weapons_provider.dart';
import 'package:val_app/pages/agent_detail_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final agentProvider = Provider.of<AgentsProvider>(context);
    final weaponsProvider = Provider.of<WeaponsProvider>(context);

    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Center(
            child: Image.asset(
              'assets/val_teks.png',
              height: 40,
            ),
          ),
          bottom: const TabBar(
            labelColor: Colors.red,
            indicator: UnderlineTabIndicator(
              borderSide: BorderSide(width: 4.0, color: Colors.red),
              insets: EdgeInsets.symmetric(horizontal: 100.0),
            ),
            tabs: [
              Tab(text: 'AGENTS'),
              Tab(text: 'WEAPONS'),
            ],
          ),
          backgroundColor: Colors.grey[900],
        ),
        body: TabBarView(
          children: [
            // Agent List View with onTap to open detail
            agentProvider.isLoading
                ? const Center(child: CircularProgressIndicator())
                : ListView.builder(
                    itemCount: agentProvider.agents.length,
                    itemBuilder: (ctx, index) {
                      final agent = agentProvider.agents[index];
                      return Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => AgentDetailPage(agent: agent),
                              ),
                            );
                          },
                          child: SizedBox(
                            width: double.infinity,
                            height: 150.0,
                            child: Card(
                              color: Colors.grey[800],
                              child: Padding(
                                padding: const EdgeInsets.all(15.0),
                                child: Row(
                                  children: [
                                    Image.network(
                                      agent.displayIcon,
                                      width: 100,
                                      height: 100,
                                      fit: BoxFit.cover,
                                      errorBuilder: (context, error, stackTrace) =>
                                          const Icon(Icons.broken_image, color: Colors.white),
                                    ),
                                    const SizedBox(width: 15),
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            agent.displayName,
                                            style: const TextStyle(
                                              fontSize: 24,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.white,
                                            ),
                                          ),
                                          Text(
                                            agent.description,
                                            style: const TextStyle(
                                              fontSize: 14,
                                              color: Colors.white70,
                                            ),
                                            maxLines: 3,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
            // Weapons List View
            weaponsProvider.isLoading
                ? const Center(child: CircularProgressIndicator())
                : ListView.builder(
                    itemCount: weaponsProvider.weapons.length,
                    itemBuilder: (ctx, index) {
                      final weapon = weaponsProvider.weapons[index];
                      return Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: SizedBox(
                          width: double.infinity,
                          height: 150.0,
                          child: Card(
                            color: Colors.grey[800],
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                children: [
                                  Image.network(
                                    weapon.displayIcon,
                                    width: 200,
                                    height: 50,
                                    fit: BoxFit.contain,
                                    errorBuilder: (context, error, stackTrace) =>
                                    const Icon(Icons.broken_image, color: Colors.white),
                                  ),
                                  const SizedBox(width: 15),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          weapon.displayName,
                                          style: const TextStyle(
                                            fontSize: 24,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white,
                                          ),
                                        ),
                                        Text(
                                          weapon.category,
                                          style: const TextStyle(
                                            fontSize: 16,
                                            color: Colors.white70,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
          ],
        ),
        backgroundColor: Colors.grey[900],
      ),
    );
  }
}
