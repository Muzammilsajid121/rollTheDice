/* This is the final version of "Roll The Dice" game created by Muzammil Sajid. The rule of the game
is whenever both dices have same number, you will get 10 points. Remember you can onlyroll the 
                                   dice 10 times. */

import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import 'introScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "DiceProject",
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: IntroScreen(), //App will start from intro screen
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String dice1Image = "assets/dice1.png";
  String dice2Image = "assets/dice1.png";
  int rollsRemaining = 10;
  int score = 0;

  void rollDice() {
    if (rollsRemaining == 0) {
      return;
    }

    setState(() {
      int randomNumber = Random().nextInt(6) + 1;
      print(randomNumber);
      dice1Image = "assets/dice$randomNumber.png";

      randomNumber = Random().nextInt(6) + 1;
      print(randomNumber);
      dice2Image = "assets/dice$randomNumber.png";

      //10 marks if both dice have same numbers.

      if (dice1Image == "assets/dice1.png" &&
          dice2Image == "assets/dice1.png") {
        score += 10;
      } else if (dice1Image == "assets/dice6.png" &&
          dice2Image == "assets/dice6.png") {
        score += 10;
      } else if (dice1Image == "assets/dice4.png" &&
          dice2Image == "assets/dice4.png") {
        score += 10;
      } else if (dice1Image == "assets/dice5.png" &&
          dice2Image == "assets/dice5.png") {
        score += 10;
      } else if (dice1Image == "assets/dice2.png" &&
          dice2Image == "assets/dice2.png") {
        score += 10;
      } else if (dice1Image == "assets/dice3.png" &&
          dice2Image == "assets/dice3.png") {
        score += 10;
      }

      rollsRemaining--;
    });
  }

  // @override
  // void initState() {
  //   super.initState();
  //   Timer(
  //       Duration(seconds: 1),
  //       () => Navigator.pushReplacement(
  //           context, MaterialPageRoute(builder: (context) => HomeScreen())));
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: const Text("Dice Roll Game"),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Rolls remaining:",
                    style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    rollsRemaining.toString(),
                    style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Score:",
                    style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    score.toString(),
                    style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Image.asset(
                dice1Image,
                height: 120,
                width: 120,
              ),
              Image.asset(
                dice2Image,
                height: 120,
                width: 120,
              ),
            ],
          ),
          ElevatedButton(
            onPressed: rollsRemaining == 0 ? null : rollDice,
            child: Text(
              rollsRemaining == 0 ? "No rolls remaining" : "Roll Dice",
              style: const TextStyle(
                  fontSize: 20, color: Color.fromARGB(255, 254, 254, 254)),
            ),
          ),
          const SizedBox(height: 20),
          const Text(
            "RULE: When ever both dices have same numbers, you will get 10 points",
            style: TextStyle(
                fontSize: 18, fontWeight: FontWeight.bold, color: Colors.red),
          ),
        ],
      ),
    );
  }
}
