import 'package:flutter/material.dart';
import 'edit_attraction_screen.dart';
import 'package:e_project/AddAttractionScreen.dart';

class AttractionListingScreen extends StatefulWidget {
  @override
  _AttractionListingScreenState createState() => _AttractionListingScreenState();
}

class _AttractionListingScreenState extends State<AttractionListingScreen> {
  final List<Attraction> attractions = [
    Attraction(
      name: 'Statue of Liberty',
      description: 'A symbol of freedom and democracy located in New York City.',
      imageUrl: 'https://example.com/statue_of_liberty.jpg',
    ),
    Attraction(
      name: 'Eiffel Tower',
      description: 'Iconic iron lattice tower located in Paris, France.',
      imageUrl: 'https://example.com/eiffel_tower.jpg',
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
        title: Text('Attractions'),
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
                    onPressed: () {
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

  Attraction({required this.name, required this.description, required this.imageUrl});
}
