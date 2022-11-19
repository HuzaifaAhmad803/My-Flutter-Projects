import 'package:flutter/material.dart';

class Testing extends StatefulWidget {
  const Testing({Key? key}) : super(key: key);

  @override
  State<Testing> createState() => _TestingState();
}

class _TestingState extends State<Testing> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print('init State');
  }
  @override
  Widget build(BuildContext context) {
    print('in Function\n');
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Testinng Page'),
        ),
        body: Center(
          child: TextButton(onPressed: () {
            setState(() {

            });
          }, child: Text('Button')),
        ),
      ),
    );
  }
}
