import 'package:flutter/material.dart';
import 'package:whatsapp/widgets/dummy_list.dart';

class ChatsTile extends StatelessWidget {
  final index;
  const ChatsTile({Key? key, this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          radius: 40,
          backgroundImage: AssetImage(contact[index]['image'].toString()),
        ),
      ],
    );
  }
}
