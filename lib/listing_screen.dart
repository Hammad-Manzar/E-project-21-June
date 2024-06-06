import 'package:flutter/material.dart';
import 'reuseable_container.dart';

class ListingScreen extends StatefulWidget {
  const ListingScreen({super.key});

  @override
  State<ListingScreen> createState() => _ListingScreenState();
}

class _ListingScreenState extends State<ListingScreen> {
  @override
  Widget build(BuildContext context) {


    return Scaffold(
      appBar: AppBar(
        title: const Text('List View Screen Page',style: TextStyle(fontWeight: FontWeight.bold,fontFamily: 'Railway',fontSize: 25),),
      ),
        body: ListView.builder(
            itemBuilder: (context , index) {
          return const ReuseableContainer(
          locationCity: "karachi",
          );
        }),
    );
  }
}



