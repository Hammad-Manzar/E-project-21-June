import 'package:e_project/admin_login.dart';
import 'package:flutter/material.dart';
import 'listing_screen.dart';
import 'notification.dart';
import 'feedback.dart';
import 'home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: AdminLogin(),
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
    const ListingScreen(),
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


