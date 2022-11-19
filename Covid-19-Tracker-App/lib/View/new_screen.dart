import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NewScreen extends StatefulWidget {
  const NewScreen({Key? key}) : super(key: key);

  @override
  State<NewScreen> createState() => _NewScreenState();
}

class _NewScreenState extends State<NewScreen> {
  int currentIndex = 0;
  final List<Scaffold> ScreenList = [
    Scaffold(
        body: Center(
      child: Text('First Page'),
    )),
    Scaffold(
        body: Center(
      child: Text('Second Page'),
    )),
    Scaffold(
        body: Center(
      child: Text('Third Page'),
    )),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ScreenList[currentIndex],
      appBar: AppBar(
        title: const Text('New Screen'),
      ),
      bottomNavigationBar: BottomNavigationBar(
          onTap: (value) => setState(() {
                currentIndex = value;
              }),
          currentIndex: currentIndex,
          type: BottomNavigationBarType.fixed,
          selectedItemColor: Colors.white,
          items: [
            BottomNavigationBarItem(
                icon: Container(
                    padding: EdgeInsets.symmetric(vertical: 4, horizontal: 12),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: currentIndex == 0
                          ? Colors.blue.shade600
                          : Colors.transparent,
                    ),
                    child: Icon(CupertinoIcons.home)),
                label: ''),
            BottomNavigationBarItem(
                icon: Container(
                    padding: EdgeInsets.symmetric(vertical: 4, horizontal: 12),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: currentIndex == 1
                          ? Colors.blue.shade600
                          : Colors.transparent,
                    ),
                    child: Icon(CupertinoIcons.home)),
                label: ''),
            BottomNavigationBarItem(
                icon: Container(
                    padding: EdgeInsets.symmetric(vertical: 4, horizontal: 12),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: currentIndex == 2
                          ? Colors.blue.shade600
                          : Colors.transparent,
                    ),
                    child: Icon(CupertinoIcons.home)),
                label: ''),
          ]),
    );
  }
}
