import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'chat_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  try {
    await dotenv.load(fileName: ".env");
    print('dotenv loaded successfully');
  } catch (e) {
    print('Error loading .env file: $e');
  }

  runZonedGuarded(() {
    runApp(const MyApp());
  }, (error, stackTrace) {
    // Handle uncaught errors here
    print('Uncaught error: $error');
    print(stackTrace);
  });
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key});

  @override
  Widget build(BuildContext context) {
    final apiKey = dotenv.env['API_KEY'];
    if (apiKey == null) {
      print('API_KEY is null or not found. Check .env file and variable name.');
    }

    return MaterialApp(
      title: 'ChatGPT Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.green,
        useMaterial3: true,
      ),
      home: const ChatScreen(),
    );
  }
}
