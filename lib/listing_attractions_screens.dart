import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'edit_attraction_screen.dart';
import 'package:e_project/AddAttractionScreen.dart';
import 'package:flutter/material.dart';

class AttractionListingScreen extends StatefulWidget {
  @override
  _AttractionListingScreenState createState() => _AttractionListingScreenState();
}

class _AttractionListingScreenState extends State<AttractionListingScreen> {
  final List<Attraction> attractions = [
    Attraction(
      name: 'Princess of Hope',
      description: 'The Princess of Hope is a famous natural rock formation in Balochistan, Pakistan, known for its unique resemblance to the profile of a princess, drawing visitors for its natural beauty and geological significance.',
      imageUrl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSYE0_Bwx7NmbpSuSzFks9654Zdz0fcXLI28A&s',
      contactInfo: '',
      openingHours: '',
      ratings: '',
    ),
    Attraction(
      name: 'K2',
      description: 'K2 is the second-highest mountain in the world, renowned for its challenging ascent and stunning beauty.',
      imageUrl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ-oIntW4X0x-xXGGeF-smSM5rK-UxDhlss3A&s',
      contactInfo: '',
      openingHours: '',
      ratings: '',
    ),
    // Add more attractions as needed
  ];

  void _deleteAttraction(int index) {
    setState(() {
      attractions.removeAt(index);
    });
  }

  void _updateAttraction(int index, Attraction updatedAttraction) {
    setState(() {
      attractions[index] = updatedAttraction;
    });
  }

  void _addAttraction(Attraction newAttraction) {
    setState(() {
      attractions.add(newAttraction);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Listing Attractions",style: TextStyle(fontWeight: FontWeight.bold,fontFamily: 'Railway',fontSize: 25),),
      ),
      body: ListView.builder(
        itemCount: attractions.length,
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              leading: Image.network(
                attractions[index].imageUrl,
                width: 100,
                height: 100,
                fit: BoxFit.cover,
              ),
              title: Text(attractions[index].name),
              subtitle: Text(attractions[index].description),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    icon: Icon(Icons.edit),
                    onPressed: () async {
                      final updatedAttraction = await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => EditAttractionScreen(attraction: attractions[index]),
                        ),
                      );
                      if (updatedAttraction != null) {
                        _updateAttraction(index, updatedAttraction);
                      }
                    },
                  ),
                  IconButton(
                    icon: Icon(Icons.delete),
                    onPressed: (){
                      _deleteAttraction(index);
                    },
                  ),
                ],
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AttractionDetailScreen(attraction: attractions[index]),
                  ),
                );
              },
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () async {
          final newAttraction = await Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AddAttractionScreen(),
            ),
          );
          if (newAttraction != null) {
            _addAttraction(newAttraction);
          }
        },
      ),
    );
  }
}

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
            padding: EdgeInsets.all(16.0),
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

class Attraction {
  String name;
  String description;
  String imageUrl;
  String contactInfo;
  String openingHours;
  String ratings;

  Attraction({required this.name, required this.description, required this.imageUrl, required this.contactInfo, required this.openingHours, required this.ratings});
}
