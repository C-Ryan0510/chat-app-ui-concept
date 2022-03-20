import 'package:flutter/material.dart';
import '../models/message_model.dart';
import '../models/user_model.dart';

class ChatScreen extends StatefulWidget {
  final User user;
  const ChatScreen({Key? key, required this.user}) : super(key: key);
  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  buildMessage(Message message, bool isMe) {
    Container MessageR= Container(
      width: MediaQuery.of(context).size.width*0.75,
      margin: isMe
          ? EdgeInsets.only(top: 8.0, bottom: 8.0, left: 80.0)
          : EdgeInsets.only(top: 8.0, bottom: 8.0, ),
      padding: EdgeInsets.symmetric(horizontal: 25.0, vertical: 15.0),
      decoration: BoxDecoration(
          color: isMe ? Color(0xFFFEF8E8) : Color(0xFFFFEFEE),
          borderRadius: isMe
              ? BorderRadius.only(
              topLeft: Radius.circular(15.0),
              bottomLeft: Radius.circular(15.0))
              : BorderRadius.only(
              topRight: Radius.circular(15.0),
              bottomRight: Radius.circular(15.0))),
      child: Column(
        children: [
          Text(message.time,
            style: TextStyle(color: Colors.blueGrey,fontSize: 16.0, fontWeight: FontWeight.w600),),
          Text(message.text)],
        crossAxisAlignment: CrossAxisAlignment.start,
      ),
    );
    if (isMe){return MessageR;}
    return Row(
      children: [
        MessageR,
        IconButton(
          icon: message.isLiked? Icon(
            Icons.favorite_outlined,
            color: Colors.red,
          ):Icon(
            Icons.favorite_border_outlined,
            color: Colors.red,
          ),
          iconSize: isMe? 0.0 : 30.0,
          color: Colors.black,
          onPressed: () {},
        ),
      ],
    );
  }

  MessageComposer(      ){
    return Container(
      color: Colors.white,
      child: Container(
        margin: EdgeInsets.fromLTRB(10.0,5.0,10.0,10.0),
        decoration: BoxDecoration(color: Color(0xFFFEF8E8),
        borderRadius: BorderRadius.all(Radius.circular(30.0))),
        padding: EdgeInsets.symmetric(horizontal: 8.0),
        height: 70.0,
        child: Row(
          children: [
            IconButton(onPressed: (){}, icon: Icon(Icons.sentiment_satisfied_alt_outlined),
            iconSize: 25.0,
            color: Colors.blueGrey,),
            Expanded(child: TextField(
              textCapitalization: TextCapitalization.sentences,
              decoration: InputDecoration.collapsed(hintText: ('Send a message...'),),
            )),
            IconButton(onPressed: (){}, icon: Icon(Icons.send),
              iconSize: 25.0,
              color: Colors.blueGrey,)
          ],
        ),
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_outlined,
          ),
          iconSize: 30.0,
          color: Colors.white,
          onPressed: () {},
        ),
        elevation: 0.0,
        title: Text(widget.user.name),
        toolbarHeight: 85.0,
        backgroundColor: Colors.red,
        actions: [
          IconButton(
            icon: Icon(
              Icons.more_horiz_outlined,
            ),
            iconSize: 30.0,
            color: Colors.white,
            onPressed: () {},
          )
        ],
      ),
      body: Column(children: [
        Expanded(
          child: Container(
            padding: EdgeInsets.only(
              top: 16.0,
            ),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30.0),
                topRight: Radius.circular(30.0),
              ),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30.0),
                topRight: Radius.circular(30.0),
              ),
              child: ListView.builder(
                reverse: true,
                  itemCount: messages.length,
                  itemBuilder: (BuildContext context, int index) {
                    Message message = messages[index];
                    bool isMe = message.sender.id == currentUser.id;
                    return buildMessage(message, isMe);
                  }),
            ),
          ),
        ),
        MessageComposer(),
      ]),
    );
  }
}
