import 'package:flutter/material.dart';

class NotificationPage extends StatefulWidget {
  const NotificationPage({super.key});

  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.all(20),
        child: const Row(
          children: [
            Text('Notifications',style: TextStyle(fontWeight: FontWeight.bold,fontFamily: 'Railway',fontSize: 25),)
          ],
        ),
      )
    );
  }
}

