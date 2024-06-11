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

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(text: widget.attraction.name);
    _descriptionController = TextEditingController(text: widget.attraction.description);
    _imageUrlController = TextEditingController(text: widget.attraction.imageUrl);
  }

  @override
  void dispose() {
    _nameController.dispose();
    _descriptionController.dispose();
    _imageUrlController.dispose();
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
              onPressed: () {
                // Update the attraction with new details and return it
                final updatedAttraction = Attraction(
                  name: _nameController.text,
                  description: _descriptionController.text,
                  imageUrl: _imageUrlController.text,
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
