import 'package:flutter/material.dart';

class feedback extends StatefulWidget {
  const feedback({super.key});

  @override
  State<feedback> createState() => _feedbackState();
}

class _feedbackState extends State<feedback> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(20),
      child: const Row(
        children: [
          Text('Feedback and Reviews',style: TextStyle(fontWeight: FontWeight.bold,fontFamily: 'Railway',fontSize: 25),)
        ],
      ),
    );
  }
}
