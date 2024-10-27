import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:val_app/pages/home_page.dart';
import 'package:val_app/service/agents_provider.dart';
import 'package:val_app/service/weapons_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => AgentsProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => WeaponsProvider(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.red,
        ),
        home: const HomePage(),
      ),
    );
  }
}
