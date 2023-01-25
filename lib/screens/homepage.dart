import 'package:flutter/material.dart';
import 'package:subscription/screens/bottomnavigationbar_screeens/approvepage.dart';
import 'package:subscription/screens/bottomnavigationbar_screeens/gradebord.dart';
import 'bottomnavigationbar_screeens/home.dart';
import 'bottomnavigationbar_screeens/profile.dart';



class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selectedIndex = 0;

  static List<Widget>_list =  [
    Home(),
    GradeBoard(),
    AprovePage(),
    Profile(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff191A32),
      body: Center(
        child: _list.elementAt(selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: const Color(0xff181A1E),
        unselectedItemColor: Colors.white,
        selectedItemColor: const Color(0xff07BCD6),
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined,),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.copy,),
            label: 'Gradeboard',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.check_box,),
            label: 'Aprove',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.supervised_user_circle_sharp,),
            label: 'Profile',
          ),
        ],
        currentIndex: selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}


