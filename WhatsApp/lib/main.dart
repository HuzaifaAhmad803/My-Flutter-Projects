import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:whatsapp/pages/homepage.dart';
import 'package:whatsapp/pages/mobile_page.dart';
import 'package:whatsapp/pages/rest_api.dart';
import 'package:whatsapp/pages/testing.dart';
import 'package:whatsapp/pages/web_page.dart';
import 'package:whatsapp/responsive/responsive_layout.dart';

import 'pages/chat_screen.dart';

main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'WhatsApp',
      initialRoute: 'HomeScreen',
      // theme: ThemeData(primarySwatch: Colors.teal),
      // home: const ResponsiveLayout(
      //     mobileScreenLayout: MobileScreen(), webScreenLayout: WebScreen()),
      routes: {
        'Chats': (context) => ChatScreen(),
        'RestApi': (context) => RestApi(),
        'MobilePage': (context) => const MobileScreen(),
        'test': (context) => const Testing(),
        'HomeScreen': (context) => const HomePage(),
      },
    );
  }
}
