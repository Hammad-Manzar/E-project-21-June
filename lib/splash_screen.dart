import 'dart:async';
import 'package:e_project/admin_login.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Timer(Duration(seconds: 2), (){
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => AdminLogin()));
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          color: Colors.black12,
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
          CircleAvatar(
          backgroundImage: NetworkImage('https://images.pexels.com/photos/2330507/pexels-photo-2330507.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'),
          radius: 100,

        ),
        const SizedBox(
          height: 20,
        ),
        const Center(child: Text('Explore. Dream. Discover.',style: TextStyle(fontWeight: FontWeight.bold,fontFamily: 'Railway',fontSize: 25),),),
        ]
            ),
        ),
      ));
  }
}
