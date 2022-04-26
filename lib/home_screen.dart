import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:restaurantapp/signin_screen.dart';
import 'package:flutter/material.dart';
import 'Settings.dart';
import 'AppInfo.dart';
import 'dart:ui' as ui;
import 'searchResults.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.title,
          style: const TextStyle(
            fontSize: 25,
          ),
        ),
        leading: IconButton(
          icon: const Icon(
            Icons.restaurant,
            size: 40,
          ),
          tooltip: 'logo',
          onPressed: () {},
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.menu, size: 40),
            padding: const EdgeInsets.only(right: 7),
            tooltip: 'profile',
            onPressed: () {
              // To show profile page of current user from firebase**/
              //   Navigator.of(context).push(MaterialPageRoute(
              //       builder: (context) => const showProfile(user: createChatUser().getcurrentuser(),)));
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => const settings()));
            },
          )
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Greetings, foodies!',
              style: TextStyle(
                  fontSize: 40,
                  foreground: Paint()
                    ..shader = ui.Gradient.linear(
                      const Offset(0, 20),
                      const Offset(150, 20),
                      <Color>[
                        Colors.red,
                        Colors.orangeAccent,
                      ],
                    )),
            ),
            const SizedBox(height: 15.0),
            Text(
              'Find list of best restaurants around you',
              style: TextStyle(
                  fontSize: 20,
                  foreground: Paint()
                    ..shader = ui.Gradient.linear(
                      const Offset(0, 20),
                      const Offset(150, 20),
                      <Color>[
                        Colors.blue,
                        Colors.green,
                      ],
                    )),
            ),
            const SizedBox(height: 30.0),
            Container(
                constraints: const BoxConstraints.expand(
                  width: 360,
                  height: 80,
                ),
                decoration: const BoxDecoration(),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                  child: TextField(
                    key: const Key('filter'),
                    inputFormatters: [
                      FilteringTextInputFormatter.singleLineFormatter
                    ],
                    keyboardType: TextInputType.text,
                    onChanged: (value) {},
                    decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15.0),
                        borderSide: const BorderSide(),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15.0),
                        borderSide: const BorderSide(),
                      ),
                      prefixIcon: const Icon(Icons.search),
                      labelText: 'Enter zipcode, city, or category',
                    ),
                  ),
                )),
            const SizedBox(height: 15.0),
            ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const searchResults()));
                  //if search not found
                  // Navigator.of(context).push(MaterialPageRoute(
                  //    builder: (context) =>  FunPage()));
                },
                child: const Text("SEARCH")),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (() => Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => const AppInfo()))),
        tooltip: 'About us',
        child: const Icon(Icons.chat),
      ),
    );
  }
}
