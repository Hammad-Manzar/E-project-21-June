import 'package:e_project/admin_login.dart';
import 'package:e_project/home.dart';
import 'package:e_project/listing_attractions_screens.dart';
import 'package:e_project/splash_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'firebase_options.dart';
import 'notification.dart';
import 'feedback.dart';
import 'home_screen.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreenUi(),
    );
  }
}

class bottom extends StatefulWidget {
  const bottom({super.key});

  @override
  State<bottom> createState() => _bottomState();
}

class _bottomState extends State<bottom> {
  int currentIndex = 0;

  void pageShifter(index){
    setState(() {
      currentIndex=index;
    });
  }
  List<Widget> myScreen = [
    const HomeScreen(),
    AttractionListingScreen(),
    const feedback(),
    const NotificationPage(),


  ];
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: myScreen[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.lightBlue,
        unselectedItemColor: Colors.black,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        currentIndex: currentIndex,
        onTap: pageShifter,
        items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home),label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.list),label: "Listing"),
          BottomNavigationBarItem(icon: Icon(Icons.feedback),label: "Feedback and Reviews"),
          BottomNavigationBarItem(icon: Icon(Icons.notifications),label: "Notification"),
        ],
      ),
    );
  }
}
class AdminNav extends StatefulWidget {
  const AdminNav({super.key});

  @override
  State<AdminNav> createState() => _AdminNavState();
}

class _AdminNavState extends State<AdminNav> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}


