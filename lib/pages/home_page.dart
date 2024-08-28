import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2, // Number of tabs
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
              insets: EdgeInsets.symmetric(
                  horizontal: 100.0), // Customize indicator length
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
            ListView(
              children: List.generate(10, (index) {
                return Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: SizedBox(
                    width: 400.0,
                    height: 180.0,
                    child: Card(
                      child: Center(
                        child: Text('Hello World! Item $index'),
                      ),
                    ),
                  ),
                );
              }),
            ),
            ListView(
              children: List.generate(10, (index) {
                return Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: SizedBox(
                    width: 400.0,
                    height: 180.0,
                    child: Card(
                      child: Center(
                        child: Text('Hello World! Item $index'),
                      ),
                    ),
                  ),
                );
              }),
            )
          ],
        ),
        backgroundColor: Colors.grey[900],
      ),
    );
  }
}
