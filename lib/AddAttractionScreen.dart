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
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                final newAttraction = Attraction(
                  name: _nameController.text,
                  description: _descriptionController.text,
                  imageUrl: _imageUrlController.text,
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
