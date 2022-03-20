import 'package:chatappui/models/message_model.dart';
import 'package:chatappui/widgets/RecentChats.dart';
import 'package:chatappui/widgets/favorite_contacts.dart';
import 'package:flutter/material.dart';

import '../widgets/category_selector.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}


class _HomeScreenState extends State<HomeScreen> {
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
        toolbarHeight: 95.0,
        backgroundColor: Colors.red,
        actions: [
          IconButton(
            icon: Icon(
              Icons.search,
            ),
            iconSize: 30.0,
            color: Colors.white,
            onPressed: () {},
          )
        ],
      ),
      body: Column(children: [
        CategorySelector(),
        Expanded(
          child: Container(
            decoration: BoxDecoration(
                color: Color(0xFFFEF8E8),
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30.0),
                    topRight: Radius.circular(30.0))),
            child: Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  FavoriteContacts(),
                  FavoriteContacts_Users(),
                  RecentChats(),
                ],
              ),
            ),
          ),
        ),

      ]),
    );
  }
}




