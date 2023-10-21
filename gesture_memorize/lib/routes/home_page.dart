import 'package:flutter/material.dart';
import 'package:gesture_memorize/Components/bottom_navigation.dart';
import 'package:gesture_memorize/global.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  static String routeName = '/homePage';
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  reload() {
    setState(() {
      
    });
  }
  onFunction1Pressed() {
    if (recording) {
      actions.add({
        "name": "function1",
        "time": 3,
      });
      gestures.gestures.last.add({
        "name": "function1",
        "time": 3,
      });
    } else if (playing) {
      actions.removeAt(0);
    }
    Navigator.of(context).pushNamed(
      '/function1Page',
    );
  }

  onFunction2Pressed() {
    if (recording) {
      gestures.gestures.last.add({
        "name": "function2",
        "time": 3,
      });
      actions.add({
        "name": "function2",
        "time": 3,
      });
    } else if (playing) {
      actions.removeAt(0);
    }
    Navigator.of(context).pushNamed('/function2Page');
  }

  onNotesPagePressed() {
    if (recording) {
      gestures.gestures.last.add({
        "name": "NotesPage",
        "time": 3,
      });
      actions.add({
        "name": "NotesPage",
        "time": 3,
      });
    } else if (playing) {
      actions.removeAt(0);
    }
    print("press");
    Navigator.of(context).pushNamed('/NotesPage');
  }

  @override
  Widget build(BuildContext context) {
    if (playing && actions.isNotEmpty) {
      Future.delayed(Duration(seconds: actions[0]["time"]), () {
        if (actions[0]["name"] == "ReturnHome") {
          onReturnHomePressed(context);
        } else if (actions[0]["name"] == "function1") {
          onFunction1Pressed();
        } else if (actions[0]["name"] == "function2") {
          onFunction2Pressed();
        }
        //NOTE - add any gestures here if needed
        else if (actions[0]["name"] == "NotesPage") {
          onNotesPagePressed();
        }
      });
    }

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            IconButton(
              onPressed: () {
                onNotesPagePressed();
              },
              icon: const Icon(
                Icons.accessibility,
                size: 100,
              ),
            ),
            const SizedBox(height: 100),
            IconButton(
              onPressed: () {
                onFunction2Pressed();
              },
              icon: const Icon(
                Icons.accessibility,
                size: 100,
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar:  BottomNavigation(reload: reload),
    );
  }
}

// 