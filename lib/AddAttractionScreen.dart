import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'listing_attractions_screens.dart';
class AddAttractionScreen extends StatefulWidget {
  @override
  _AddAttractionScreenState createState() => _AddAttractionScreenState();
}

class _AddAttractionScreenState extends State<AddAttractionScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _imageUrlController = TextEditingController();
  final TextEditingController _contactInfoController = TextEditingController();
  final TextEditingController _openingHoursController = TextEditingController();
  final TextEditingController _ratingsController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _descriptionController.dispose();
    _imageUrlController.dispose();
    _contactInfoController.dispose();
    _openingHoursController.dispose();
    _ratingsController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Attraction'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _nameController,
              decoration: InputDecoration(labelText: 'Name'),
            ),
            TextField(
              controller: _descriptionController,
              decoration: InputDecoration(labelText: 'Description'),
            ),
            TextField(
              controller: _imageUrlController,
              decoration: InputDecoration(labelText: 'Image URL'),
            ),
            TextField(
              controller: _contactInfoController,
              decoration: InputDecoration(labelText: 'Contact-Info'),
            ),
            TextField(
              controller: _openingHoursController,
              decoration: InputDecoration(labelText: 'Opening-Hours'),
            ),
            TextField(
              controller: _ratingsController,
              decoration: InputDecoration(labelText: 'Ratings'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async{
                await FirebaseFirestore.instance.collection("attraction-listings").add({
                  "attractionName" : _nameController.text,
                  "attractionDescription" : _descriptionController.text,
                  "attractionImage" : _imageUrlController.text,
                  "attractionContactInfo" : _contactInfoController.text,
                  "attractionOpeningHours" : _openingHoursController.text,
                  "attractionRatings" : _ratingsController.text,
                });

                final newAttraction = Attraction(
                  name: _nameController.text,
                  description: _descriptionController.text,
                  imageUrl: _imageUrlController.text,
                  contactInfo: _contactInfoController.text,
                  openingHours: _openingHoursController.text,
                  ratings: _ratingsController.text,
                );
                Navigator.pop(context, newAttraction);
              },
              child: Text('Add'),
            ),
          ],
        ),
      ),
    );
  }
}
