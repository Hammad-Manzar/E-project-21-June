import 'package:flutter/material.dart';

class ReuseableContainer extends StatelessWidget {
  const ReuseableContainer({
    super.key,
    this.locationCity,
  this.locationName,
  this.locationImage,
    this.locationDescription,
  });
  final String? locationCity;
  final String? locationName;
  final String? locationImage;
  final String? locationDescription;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Container(
              margin: const EdgeInsets.all(20),
              alignment: Alignment.center,
              width: double.infinity,
              height: 150,

              decoration: BoxDecoration(
                  color: Colors.blueAccent,
                  borderRadius: BorderRadius.circular(10),
                image: DecorationImage(image: NetworkImage(""))
              ),

               child: locationCity == null ? Text("") : Text(locationCity!)
               ),
           ] ),
        ]);
  }
}
