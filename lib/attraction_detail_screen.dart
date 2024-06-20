import 'package:flutter/material.dart';
import 'listing_attractions_screens.dart'; // Adjust import based on your file structure

class AttractionDetailScreen extends StatelessWidget {
  final Attraction attraction;

  AttractionDetailScreen({required this.attraction});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(attraction.name),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Image.network(
            attraction.imageUrl,
            height: 200,
            fit: BoxFit.cover,
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              attraction.description,
              style: TextStyle(fontSize: 18.0),
            ),
          ),
        ],
      ),
    );
  }
}
