import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:whatsapp/widgets/photosModel.dart';
import 'package:whatsapp/widgets/userModel.dart';
import '../widgets/postModel.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RestApi extends StatefulWidget {
  const RestApi({Key? key}) : super(key: key);

  @override
  State<RestApi> createState() => _RestApiState();
}

class _RestApiState extends State<RestApi> {
  List<File> images = [];
  final picker = ImagePicker();
  int i = 0;
  bool state = true;

  @override
  initState() {
    super.initState();
    // fun();
    print('init State');
    // getModel();
  }

  void fun() async {
    // SharedPreferences pref = await SharedPreferences.getInstance();

    while (true) {
      Timer(Duration(seconds: 1), () {
        state = state ? false : true;
      });
    }
  }

  Future<dynamic> getModel() async {
    print('in getModel');
    http.Response response =
        await http.get(Uri.parse('https://reqres.in/api/users?delay=3'));
    print(response.statusCode);
    UserModel model = UserModel();
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body.toString());
      model = UserModel.fromJson(data);
      return model;
    } else {
      return 404;
    }
  }

  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 3));
    print('in Function');
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          leadingWidth: 80,
          leading: Padding(
            padding: const EdgeInsets.all(4.0),
            child: Material(
              color: Colors.transparent,
              borderRadius: BorderRadius.circular(25),
              // shape: StadiumBorder(),
              child: InkWell(
                borderRadius: BorderRadius.circular(25),
                onTap: () {},
                child: Ink(
                  padding: EdgeInsets.symmetric(horizontal: 4),
                  child: Row(
                    children: [
                      Icon(Icons.arrow_back),
                      CircleAvatar(
                        radius: 20,
                        child: Icon(Icons.person),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
          title: Text('Camera'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              // Container(
              //   child: images.isEmpty
              //       ? Center(child: Text('No image selected'))
              //       : ListView.builder(
              //           itemCount: images.length,
              //           itemBuilder: (context, index) {
              //             return Padding(
              //               padding: EdgeInsets.all(10),
              //               child: Container(
              //                   height: MediaQuery.of(context).size.height * .5,
              //                   width: MediaQuery.of(context).size.width * .7,
              //                   child: Image.file(File(images[index].path))),
              //             );
              //           },
              //         ),
              // ),
              // myClass,
              MyClass(
                color: state ? Colors.yellow : Colors.green,
                i: i,
              ),
              MyClass(
                color: state ? Colors.green : Colors.yellow,
                i: i,
              ),
              Container(
                margin: EdgeInsets.only(top: 10),
                color: Colors.green,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: () {},
                      child: Text('Button'),
                      style: ButtonStyle(
                          elevation: MaterialStateProperty.all(0.0),
                          shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(
                                  borderRadius: BorderRadius.zero))),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            // final picked = await picker.pickImage(
            //     source: ImageSource.camera, imageQuality: 80);
            // if (picked != null) {
            //   images.add(File(picked.path));
            // }
            ++i;
            state = state ? false : true;
            setState(() {});
            print(i);
            // myClass.fun1();
          },
        ),
      ),
    );
  }

  var mod = [
    {'id': 1, 'title': 'name'},
    {'id': 1, 'title': 'name'},
    {'id': 1, 'title': 'name'},
  ];
}

class MyClass extends StatefulWidget {
  final Color color;
  final int i;

  const MyClass({Key? key, required this.color, required this.i})
      : super(key: key);

  @override
  State<MyClass> createState() => _MyClassState();
}

class _MyClassState extends State<MyClass> {
  int j = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 30, horizontal: 50),
      height: 100,
      width: 200,
      color: widget.color,
      child: ElevatedButton(
        style: ButtonStyle(
            // maximumSize: MaterialStateProperty.all(Size(50, 50)),
            // backgroundColor: MaterialStateProperty.all(Colors.transparent),
            ),
        onPressed: () {
          j++;
          setState(() {});
        },
        child: Text(
          (widget.i + j).toString(),
          style: TextStyle(fontSize: 30),
        ),
      ),
    );
  }
}

// class MyClass extends StatefulWidget {
//   final int p;
//   final Color color;
//   const MyClass({Key? key, required this.color, required this.p})
//       : super(key: key);
//
//   @override
//   State<MyClass> createState() => _MyClassState(color, p);
// }
//
// class _MyClassState extends State<MyClass> {
//   final int p;
//   final Color color;
//   int c = 0;
//
//   _MyClassState(this.color, this.p);
//
//   @override
//   void initState() {
//     // TODO: implement initState
//     setState(() {
//       print('p: $p');
//     });
//     super.initState();
//     print('init: MyClass');
//   }
//
//   // void fun(){
//   //   setState(() {
//   //     p++;
//   //   });
//   // }
//
//   @override
//   Widget build(BuildContext context) {
//     print('Function: MyClass');
//    return Container(
//       height: 100,
//       width: 200,
//       color: color,
//       alignment: Alignment.center,
//       child: ElevatedButton(
//           onPressed: () {
//             // setState(() {
//             //   p++;
//             // });
//           },
//           child: Text(p.toString())),
//     );
//   }
// }

/*
Scaffold(
          appBar: AppBar(
            title: Text('Rest Api'),
          ),

          // "id": 1,
          // "email": "george.bluth@reqres.in",
          // "first_name": "George",
          // "last_name": "Bluth",
          // "avatar":
          body: FutureBuilder(
            future: getModel(),
            builder: (context, AsyncSnapshot<dynamic> snapshot) {
              if (snapshot.hasData && snapshot.data != 404) {
                return Column(
                  children: [
                    // Text(snapshot.hasError.toString()),
                    Expanded(
                      child: ListView.builder(
                        itemCount: snapshot.data!.perPage!.toInt(),
                        itemBuilder: (context, index) => Card(
                          child: ListTile(
                            leading: CircleAvatar(
                              backgroundImage: NetworkImage(snapshot
                                  .data!.data![index].avatar
                                  .toString()),
                            ),
                            title: Text(
                                '${snapshot.data!.data![index].firstName} ${snapshot.data!.data![index].lastName}'),
                            subtitle: Text(
                                snapshot.data!.data![index].email.toString()),
                            trailing: Icon(Icons.more_vert),
                          ),
                        ),
                      ),
                    ),
                  ],
                );
              }
              else if (snapshot.data == 404) {
                return Center(
                  child: Text('Connection Error.!', style: TextStyle(fontSize: 30),),
                );
              } else {
                return Center(child: CircularProgressIndicator());
              }
            },
          ))
 */
