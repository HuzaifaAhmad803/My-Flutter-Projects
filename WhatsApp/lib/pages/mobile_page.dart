import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:whatsapp/pages/chat_screen.dart';

import '../widgets/dummy_list.dart';

class MobileScreen extends StatelessWidget {
  const MobileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var w = MediaQuery.of(context).size.width;
    return DefaultTabController(
        length: 3,
        child: SafeArea(
          child: Scaffold(
            appBar: AppBar(
              title: Text('WhatsApp'),
              backgroundColor: const Color(0xff128C7E),
              bottom:
                  TabBar(indicatorWeight: 3, indicatorColor: Colors.white, tabs: [
                Tab(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: const [
                      Text(
                        'CHATS',
                        style: TextStyle(fontWeight: FontWeight.w700),
                      ),
                      // Padding(padding: EdgeInsets.only(left: 8)),
                      CircleAvatar(
                        radius: 9,
                        backgroundColor: Colors.white,
                        child: Text(
                          '4',
                          style: TextStyle(
                              color: Color(0xff075E54),
                              fontSize: 11,
                              fontWeight: FontWeight.w500),
                        ),
                      )
                    ],
                  ),
                ),
                Tab(
                  child: Text('STATUS'),
                ),
                Tab(
                  child: Text('CALLS'),
                ),
              ]),
              actions: [
                IconButton(onPressed: () {}, icon: const Icon(Icons.search)),
                PopupMenuButton(
                  icon: const Icon(Icons.more_vert),
                  itemBuilder: (context) => const [
                    PopupMenuItem(value: 1, child: Text('New group')),
                    PopupMenuItem(value: 2, child: Text('New broadcast')),
                    PopupMenuItem(value: 3, child: Text('Linked devices')),
                    PopupMenuItem(value: 4, child: Text('Starred messages')),
                    PopupMenuItem(value: 5, child: Text('Settings'))
                  ],
                )
                // IconButton(onPressed: () {}, icon: Icon(Icons.more_vert)),
              ],
            ),
            body: TabBarView(children: [
              ChatList(w: w),
              Text('STATUS'),
              Text('CALLS'),
            ]),
          ),
        ));
  }
}

class ChatList extends StatelessWidget {
  final w;
  const ChatList({Key? key, this.w}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double hv = 80;
    return ListView.builder(
      padding: EdgeInsets.only(top: 8),
      itemCount: contact.length,
      itemBuilder: (context, index) => ListTile(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (BuildContext) => ChatScreen(
                        index: index,
                      )));
          // Navigator.pushNamed(context, 'Chats');
        },
        leading: contact[index]['image'].toString() == '' ? Icon(Icons.person_outline_outlined) : CircleAvatar(
          backgroundImage: AssetImage(contact[index]['image'].toString()),
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              contact[index]['name'].toString(),
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
            ),
            Text(
              contact[index]['time'].toString(),
              style: TextStyle(fontSize: 12, color: Colors.grey.shade600),
            )
          ],
        ),
        subtitle: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Icon(
                  Icons.done_all,
                  size: index % 2 != 0 ? 16 : 0,
                  color: index % 2 == 0 ? Colors.grey : Colors.blue,
                ),
                Padding(padding: EdgeInsets.only(left: 1.5)),
                Text(contact[index]['message'].toString()),
              ],
            ),
            CircleAvatar(
              radius: index % 2 == 0 ? 9.7 : 0,
              backgroundColor: Color(0xff25D366),
              child: const Text(
                '2',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 10, color: Colors.white),
              ),
            )
            // Container(
            //   alignment: Alignment.center,
            //   padding: EdgeInsets.all(5),
            //   child: Text(
            //     '1',
            //     textAlign: TextAlign.center,
            //     style: TextStyle(color: Colors.white, fontSize: 10),
            //   ),
            //   decoration:
            //       BoxDecoration(shape: BoxShape.circle, color: Colors.green),
            // )
          ],
        ),
      ),
    );
  }
}
