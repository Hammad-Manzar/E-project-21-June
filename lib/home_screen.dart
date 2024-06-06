import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.all(20),
        child: const Row(
          children: [
            
            Text('Admin Dashboard',style: TextStyle(fontWeight: FontWeight.bold,fontFamily: 'Railway',fontSize: 25),)
          ],
        ),
      )
    );
  }
}
