import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'listing_attractions_screens.dart';

class EditAttractionScreen extends StatefulWidget {
  final Attraction attraction;

  EditAttractionScreen({required this.attraction});

  @override
  _EditAttractionScreenState createState() => _EditAttractionScreenState();
}

class _EditAttractionScreenState extends State<EditAttractionScreen> {
  late TextEditingController _nameController;
  late TextEditingController _descriptionController;
  late TextEditingController _imageUrlController;
  late TextEditingController _contactInfoController;
  late TextEditingController _openingHoursController;
  late TextEditingController _ratingsController;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(text: widget.attraction.name);
    _descriptionController = TextEditingController(text: widget.attraction.description);
    _imageUrlController = TextEditingController(text: widget.attraction.imageUrl);
    _contactInfoController = TextEditingController(text: widget.attraction.contactInfo);
    _openingHoursController = TextEditingController(text: widget.attraction.openingHours);
    _ratingsController = TextEditingController(text: widget.attraction.ratings);
  }

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
        title: Text('Edit Attraction'),
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
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: (){
                // Update the attraction with new details and return it
                final updatedAttraction = Attraction(
                  name: _nameController.text,
                  description: _descriptionController.text,
                  imageUrl: _imageUrlController.text,
                  contactInfo: _contactInfoController.text,
                  openingHours: _openingHoursController.text,
                  ratings: _ratingsController.text,
                );
                Navigator.pop(context, updatedAttraction);
              },
              child: Text('Save'),
            ),
          ],
        ),
      ),
    );
  }
}
