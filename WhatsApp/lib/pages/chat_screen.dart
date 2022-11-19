import 'package:flutter/material.dart';
import 'package:bubble/bubble.dart';
import 'package:whatsapp/widgets/colors.dart';
import 'package:whatsapp/widgets/dummy_list.dart';

class ChatScreen extends StatefulWidget {
  final index;
  const ChatScreen({Key? key, this.index}) : super(key: key);

  @override
  State<ChatScreen> createState() => _ChatScreenState(index);
}

class _ChatScreenState extends State<ChatScreen> {
  var myTextStyle = const TextStyle(color: Colors.white);

  final index;
  bool state = true;

  _ChatScreenState(this.index);
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xff777777),
      child: SafeArea(
        minimum: EdgeInsets.only(top: 16),
        child: Container(
          // decoration: BoxDecoration(
          //   image: DecorationImage(
          //       image: AssetImage('asset/WhatsApp_chat_background.jpg'),
          //       fit: BoxFit.cover),
          // ),
          child: Scaffold(
            backgroundColor: chatBackgroundColor,
            // backgroundColor: Colors.grey,
            body: Column(
              children: [
                top(index),
                center(),
                bottom(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Widget top(int index) {
  return Container(
    decoration: const BoxDecoration(
      color: appBarColor,
    ),
    child: Material(
      color: Colors.transparent,
      child: Row(children: [
        Material(
          borderRadius: BorderRadius.circular(22),
          color: Colors.transparent,
          child: InkWell(
            borderRadius: BorderRadius.circular(22),
            onTap: () {},
            child: Ink(
              padding: const EdgeInsets.all(5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(
                    Icons.arrow_back_sharp,
                    color: Colors.white,
                  ),
                  // CircleAvatar(
                  //   radius: 20,
                  //   backgroundImage: AssetImage('asset/MyPic1.jpg'),
                  // ),
                  contact[index]['image'].toString() == '' ? Icon(Icons.person_outline_outlined) : CircleAvatar(
                    backgroundImage: AssetImage(contact[index]['image'].toString()),
                  ),
                ],
              ),
            ),
          ),
        ),
        InkWell(
          onTap: () {},
          child: Ink(
            padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  'Huzaifa Ahmad',
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      color: Colors.white),
                ),
                Text(
                  'today at 2:30 PM',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ),
        const Spacer(),
        Row(
          children: [
            IconButton(
                splashRadius: 20,
                color: Colors.white,
                onPressed: () {},
                icon: const Icon(Icons.videocam_rounded)),
            IconButton(
                splashRadius: 20,
                color: Colors.white,
                onPressed: () {},
                icon: const Icon(Icons.call)),
            PopupMenuButton(
                splashRadius: 20,
                icon: Icon(Icons.more_vert_sharp, color: Colors.white),
                itemBuilder: (context) => [
                      PopupMenuItem(value: 1, child: Text('View contact')),
                      PopupMenuItem(
                          value: 2, child: Text('Media, links, and docs')),
                      PopupMenuItem(value: 3, child: Text('Search')),
                      PopupMenuItem(
                          value: 4, child: Text('Mute notifications')),
                      PopupMenuItem(
                          value: 5, child: Text('Disappearing messages')),
                      PopupMenuItem(value: 6, child: Text('Wallpaper')),
                      PopupMenuItem(
                        value: 7,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('More'),
                            Icon(Icons.arrow_right_sharp),
                          ],
                        ),
                      ),
                    ])
          ],
        ),
      ]),
    ),
  );
}

Widget center() {
  return Expanded(
    child: Container(
      // width: 300,
      // height: 500,
      decoration: const BoxDecoration(
        color: chatBackgroundColor,
        // image: DecorationImage(image: AssetImage('asset/WhatsApp_chat_background.jpg'),fit: BoxFit.cover)
      ),
      child: ListView.builder(
        itemCount: messages.length,
        itemBuilder: (context, index) {
          if(index == 0)
            return Bubble(
              margin: BubbleEdges.only(top: 10),
              alignment: Alignment.center,
              color: Color.fromRGBO(212, 234, 244, 1.0),
              child: Text('TODAY', textAlign: TextAlign.center, style: TextStyle(fontSize: 11.0)),
            );
          else return Card(
            color: chatBackgroundColor,
            elevation: 0,
            margin: EdgeInsets.zero,
            child: Padding(
              padding: messages[index]['isMe'] == 1
                  ? EdgeInsets.only(left: 50)
                  : EdgeInsets.only(right: 50),
              child: Bubble(
                radius: Radius.circular(8),
                // padding: messages[index]['isMe'] == 1 ? BubbleEdges.only(left: 30) : BubbleEdges.only(right: 30),
                margin: const BubbleEdges.only(top: 10, left: 5, right: 5),
                alignment: messages[index]['isMe'] == 1
                    ? Alignment.topRight
                    : Alignment.topLeft,
                nip: bubbleNip(index),
                color: messages[index]['isMe'] == 1
                    ? const Color(0xffE7FFDB)
                    : Colors.white,
                child: Text(messages[index]['text'].toString(),
                    textAlign: TextAlign.right, style: TextStyle(fontSize: 16)),
              ),
            ),
          );
        },
      ),
      // child: SingleChildScrollView(
      //   child: Column(
      //     children: [
      //       ListView.builder(itemCount: 4,itemBuilder: (context, index) => Text('data'))
      //     ],
      //   )
      // ),
    ),
  );
}

Widget bottom() {
  return Container(
    padding: EdgeInsets.all(4),
    child: Row(
      children: [
        Expanded(
          child: Material(
            // color: Colors.transparent,
            borderRadius: BorderRadius.circular(30),
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 4, vertical: 0),
              child: Row(
                children: [
                  IconButton(
                      splashRadius: 20,
                      padding: EdgeInsets.zero,
                      onPressed: () {},
                      icon: Icon(
                        Icons.emoji_emotions_outlined,
                        color: Colors.grey,
                        size: 28,
                      )),
                  Expanded(
                      child: TextField(
                    cursorColor: Colors.grey,
                    decoration: InputDecoration(
                      hintText: 'Message',
                      hintStyle:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                      border: InputBorder.none,
                    ),
                  )),
                  IconButton(
                      splashRadius: 20,
                      onPressed: () {},
                      icon: Icon(
                        Icons.attach_file_outlined,
                        color: Colors.grey,
                      )),
                  IconButton(
                      splashRadius: 20,
                      onPressed: () {},
                      icon: Icon(
                        Icons.camera_alt_rounded,
                        color: Colors.grey,
                      )),
                ],
              ),
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.only(left: 4),
          padding: EdgeInsets.all(12),
          decoration:
              BoxDecoration(color: actionButtonColor, shape: BoxShape.circle),
          child: Icon(
            Icons.keyboard_voice,
            size: 25,
            color: Colors.white,
          ),
        )
      ],
    ),
  );
}

BubbleNip bubbleNip(int index) {
  if (index > 0) {
    if (messages[index]['isMe'] == messages[index - 1]['isMe']) {
      return BubbleNip.no;
    } else {
      if (messages[index]['isMe'] == 1) {
        return BubbleNip.rightTop;
      } else {
        return BubbleNip.leftTop;
      }
    }
  } else {
    if (messages[index]['isMe'] == 1) {
      return BubbleNip.rightTop;
    } else {
      return BubbleNip.leftTop;
    }
  }
}

/*
Column(
          children: [
            Bubble(
              alignment: Alignment.center,
              color: Color.fromRGBO(212, 234, 244, 1.0),
              child: Text('TODAY', textAlign: TextAlign.center, style: TextStyle(fontSize: 11.0)),
            ),
            Bubble(
              margin: BubbleEdges.only(top: 10),
              alignment: Alignment.topRight,
              // nip: BubbleNip.rightTop,
              color: Color.fromRGBO(225, 255, 199, 1.0),
              child: Text('Hello, World!', textAlign: TextAlign.right),
            ),
            Bubble(
              margin: BubbleEdges.only(top: 10),
              alignment: Alignment.topLeft,
              // nip: BubbleNip.leftTop,
              child: Text('Hi, developer!'),
            ),
            Bubble(
              margin: BubbleEdges.only(top: 10),
              alignment: Alignment.topRight,
              // nip: BubbleNip.rightTop,
              color: Color.fromRGBO(225, 255, 199, 1.0),
              child: Text('Hello, World!', textAlign: TextAlign.right),
            ),
            Bubble(
              margin: BubbleEdges.only(top: 10),
              alignment: Alignment.topLeft,
              // nip: BubbleNip.leftTop,
              child: Text('Hi, developer!'),
            ),
            Bubble(
              margin: BubbleEdges.only(top: 10),
              alignment: Alignment.topRight,
              // nip: BubbleNip.rightTop,
              color: Color.fromRGBO(225, 255, 199, 1.0),
              child: Text('Hello, World!', textAlign: TextAlign.right),
            ),
            Bubble(
              margin: BubbleEdges.only(top: 10),
              alignment: Alignment.topLeft,
              // nip: BubbleNip.leftTop,
              child: Text('Hi, developer!'),
            ),
            Bubble(
              margin: BubbleEdges.only(top: 10),
              alignment: Alignment.center,
              nip: BubbleNip.no,
              color: Color.fromRGBO(212, 234, 244, 1.0),
              child: Text('TOMORROW', textAlign: TextAlign.center, style: TextStyle(fontSize: 11.0)),
            ),
          ],
        ),
 */
