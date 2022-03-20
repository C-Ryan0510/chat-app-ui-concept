import 'package:chatappui/screens/HomeScreen.dart';
import 'package:flutter/material.dart';

import '../models/message_model.dart';
import '../screens/chatscreen.dart';

class FavoriteContacts extends StatefulWidget {
  const FavoriteContacts({Key? key}) : super(key: key);

  @override
  State<FavoriteContacts> createState() => _FavoriteContactsState();
}

class _FavoriteContactsState extends State<FavoriteContacts> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Favorite Contacts',
            style: TextStyle(
                color: Colors.blueGrey,
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
            letterSpacing: 0.8),
          ),
          IconButton(
            icon: Icon(Icons.more_horiz,
            size: 30.0,
            color: Colors.blueGrey,),
            onPressed: () {},
          )
        ],
      ),
    );
  }
}

class FavoriteContacts_Users extends StatelessWidget {
  const FavoriteContacts_Users({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120.0,
      child: ListView.builder(
          padding: EdgeInsets.only(left: 10.0),
          scrollDirection: Axis.horizontal,
          itemCount: favorites.length,
          itemBuilder: (BuildContext context, int index) {
            return Padding(
              padding: const EdgeInsets.all(10.0),
              child: GestureDetector(
                onTap:()=>Navigator.push(context, MaterialPageRoute(builder:(_) => ChatScreen(user: favorites[index]),),),
                child: Column(children: [
                  CircleAvatar(
                    radius: 35.0,
                    backgroundImage:
                    AssetImage(favorites[index].imageUrl),
                  ),
                  SizedBox(
                    height: 6.0,
                  ),
                  Text(
                    favorites[index].name,
                    style: TextStyle(
                        color: Colors.blueGrey,
                        fontSize: 16.0,
                        fontWeight: FontWeight.w600),
                  )
                ]),
              ),
            );
          }),
    );
  }
}