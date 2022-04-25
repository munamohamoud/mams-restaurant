import 'package:flutter/material.dart';
import 'package:restaurant/main.dart';
import 'package:emoji_alert/emoji_alert.dart';
import 'package:emoji_alert/arrays.dart';

class settings extends StatefulWidget {
  const settings({Key? key}) : super(key: key);

  @override
  State<settings> createState() => _settingState();
}

class _settingState extends State<settings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Settings", style: TextStyle(fontSize: 20,),),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, size: 25),
          tooltip: 'go back',
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => const MyHomePage(title: "Finders")));
          },
        ),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            const SizedBox(height: 40.0),
            ElevatedButton(
                onPressed: () {
                  displayAlert(context);
                },
                child: const Text("See what's new")),
            const SizedBox(height: 20.0),
            ElevatedButton(
                onPressed: () {
                  //signUpPage Navigator
                },
                child: const Text("SignUp")), 
                const SizedBox(height: 20.0),
            ElevatedButton(
                onPressed: () {
                  //signUpPage Navigator
                },
                child: const Text("Trending")),          
          ],
        ),
      ),
    );
  }

   displayAlert(context) {
    EmojiAlert(
      cancelable: true,
        description: Column(
      children: const [
        Text("Please sign up.."),
        Text("Add restaurants to your favorites"),
         Text("And leave reviews on restaurants"),
      ],
    ),
    animationType: ANIMATION_TYPE.TRANSITION,).displayAlert(context);
  }
}
