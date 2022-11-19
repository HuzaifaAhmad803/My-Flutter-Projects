import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import '../widgets/dummy_list.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double Width = MediaQuery.of(context).size.width;
    double cameraWidth = Width / 24;
    double yourWidth = (Width - cameraWidth) / 5;
    print((Width - (cameraWidth + yourWidth * 3)) / 8);

    return DefaultTabController(
      initialIndex: 1,
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xff075E54),
          title: const Text('WhatsApp'),
          actions: [
            const Icon(Icons.search),
            const SizedBox(width: 10),
            PopupMenuButton(
              child: const Icon(Icons.more_vert_outlined),
              itemBuilder: (context) => [
                const PopupMenuItem(value: 1, child: Text('New group')),
                const PopupMenuItem(value: 2, child: Text('New broadcast')),
                const PopupMenuItem(value: 3, child: Text('Linked devices')),
                const PopupMenuItem(value: 4, child: Text('Starred messages')),
                const PopupMenuItem(value: 5, child: Text('Settings'))
              ],
            ),
            const SizedBox(width: 10)
          ],
          bottom: TabBar(
              // padding: EdgeInsets.symmetric(horizontal: 10),
              indicatorColor: Colors.white,
              labelPadding: EdgeInsets.symmetric(
                  horizontal: (Width - (cameraWidth + yourWidth * 3)) / 8),
              isScrollable: true,
              tabs: [
                Container(
                  child: Tab(icon: Icon(Icons.camera_alt)),
                  width: cameraWidth,
                ),
                Container(
                  child: Tab(
                    text: "CHATS",
                  ),
                  width: yourWidth,
                ),
                Container(
                  child: Tab(
                    text: "STATUS",
                  ),
                  width: yourWidth,
                ),
                Container(
                  child: Tab(
                    text: "CALL",
                  ),
                  width: yourWidth,
                ),
              ]),
        ),
        body: TabBarView(children: [
          Camera(),
          ChatsList(),
          StatusList(),
          CallsList(),
        ]),
        floatingActionButton: FloatingActionButton(
          backgroundColor: const Color(0xff128C7E),
          child: Icon(Icons.message_rounded),
          onPressed: () {},
        ),
      ),
    );
  }
}

class Camera extends StatefulWidget {
  const Camera({Key? key}) : super(key: key);

  @override
  State<Camera> createState() => _CameraState();
}

class _CameraState extends State<Camera> {
  final picker = ImagePicker();
  File? image;
  bool state = false;

  void fun() async {
    try {
      final picked = await picker.pickImage(source: ImageSource.camera);
      if (picked != null) {
        image = File(picked.path);
        state = true;
        setState(() {});
      } else {
        setState(() {});
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ChatsList(),
            ));
      }
    } catch (e) {
      print(e.toString());
    }
  }

  @override
  initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: const Text('Camera', style: TextStyle(fontSize: 30)),
    );
  }
}

class ChatsList extends StatelessWidget {
  const ChatsList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ListView.builder(
      padding: EdgeInsets.only(top: 10),
      itemCount: contact.length,
      itemBuilder: (context, index) {
        return ListTile(
          onTap: () {},
          contentPadding: EdgeInsets.symmetric(vertical: 2, horizontal: 16),
          // contentPadding: EdgeInsets.zero,
          leading: contact[index]['image'] == ""
              ? Icon(Icons.person)
              : CircleAvatar(
                  radius: 25,
                  foregroundImage:
                      AssetImage(contact[index]['image'].toString()),
                ),
          title: Container(
            margin: EdgeInsets.only(bottom: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(contact[index]['name'].toString(),
                    style: TextStyle(fontWeight: FontWeight.w500)),
                Text(
                  contact[index]['time'].toString(),
                  style: TextStyle(fontSize: 11, color: Colors.blueGrey),
                )
              ],
            ),
          ),
          subtitle: Row(
            children: [
              Icon(
                Icons.done_all_sharp,
                size: 17,
                color: index % 2 == 0 ? Colors.blue : Colors.grey,
              ),
              const SizedBox(width: 5),
              Text(contact[index]['message'].toString())
            ],
          ),
        );
      },
    );
  }
}

class StatusList extends StatelessWidget {
  const StatusList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 10,
      itemBuilder: (context, index) => ListTile(
        onTap: () {},
        leading: Container(
          decoration: BoxDecoration(
            border: Border.all(color: Colors.green, width: 2),
            shape: BoxShape.circle,
          ),
          child: CircleAvatar(
            radius: 23,
            foregroundImage: AssetImage('asset/MyPic1.jpg'),
          ),
        ),
        title: Text('Huzaifa Ahmad'),
        subtitle: Text('Today, 6:30 PM'),
      ),
    );
  }
}

class CallsList extends StatelessWidget {
  const CallsList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 10,
      itemBuilder: (context, index) {
        return ListTile(
          // contentPadding: EdgeInsets.zero,
          onTap: () {},
          leading: const CircleAvatar(
            foregroundImage: AssetImage('asset/MyPic1.jpg'),
          ),
          title: const Text('Huzaifa Ahmad'),
          subtitle: Row(
            children: [
              Icon(
                color: index % 2 == 0 ? Colors.green : Colors.red,
                index % 2 == 0
                    ? Icons.call_made_sharp
                    : Icons.call_received_sharp,
                size: 16,
              ),
              const SizedBox(width: 6),
              const Text('August 13, 7:33 AM'),
            ],
          ),
          trailing: const Icon(Icons.phone, color: Colors.teal),
        );
      },
    );
  }
}
