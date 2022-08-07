// ignore_for_file: unnecessary_new, deprecated_member_use, non_constant_identifier_names

import 'dart:core';
import 'dart:math';

import 'package:todo/customdialod.dart';
import 'package:todo/gamebutton.dart';
import 'package:flutter/material.dart';
import 'gamebutton.dart';

// ignore: camel_case_types
class newhomepage extends StatefulWidget {
  const newhomepage({Key? key}) : super(key: key);

  @override
  State<newhomepage> createState() => _newhomepageState();
}

// ignore: camel_case_types
class _newhomepageState extends State<newhomepage> {
  late List<gamebutton> buttonsList;
  // ignore: prefer_typing_uninitialized_variables
  var player1;
  // ignore: prefer_typing_uninitialized_variables
  var player2;
  // ignore: prefer_typing_uninitialized_variables
  var activeplayer;
  
 

   @override
  void initState() {
    
    super.initState();
    buttonsList = doInit();
  }

  List<gamebutton> doInit() {
    player1 = [];
    player2 = [];
    activeplayer = 1;

    var gamebuttons = <gamebutton>[
      new gamebutton(id: 1),
      new gamebutton(id: 3),
      new gamebutton(id: 4),
      new gamebutton(id: 5),
      new gamebutton(id: 6),
      new gamebutton(id: 7),
      new gamebutton(id: 8),
      new gamebutton(id: 9),
    ];
    return gamebuttons;
  }

  void reset() {
    if (Navigator.canPop(context)) Navigator.pop(context);
    setState(() {
      buttonsList = doInit();
    });
  }
  
  void autoplay() {
        
      var emptycells = []; 
     var list= List.generate(9, (i) => i + 1);
   
 
    
    for (var cellId in list) {
      if (!(player1.contains(cellId) || player2.contains(cellId))) {
        emptycells.add(cellId);
      }
    }

    var r = new Random();
    var randomIndex = r.nextInt(emptycells.length - 1);
    var cellId = emptycells[randomIndex];
    int i = buttonsList.indexWhere((p) => p.id == cellId);
    playGame(buttonsList[i]);
  }


  int checkWinner() {
    var winner = -1;
    if (player1.contains(1) && player1.contains(2) && player1.contains(3)) {
      winner = 1;
    }
    if (player2.contains(1) && player2.contains(2) && player2.contains(3)) {
      winner = 2;
    }
    if (player1.contains(4) && player1.contains(5) && player1.contains(6)) {
      winner = 1;
    }
    if (player2.contains(4) && player2.contains(5) && player2.contains(6)) {
      winner = 2;
    }
    if (player1.contains(7) && player1.contains(8) && player1.contains(9)) {
      winner = 1;
    }
    if (player2.contains(7) && player2.contains(8) && player2.contains(9)) {
      winner = 2;
    }
    if (player1.contains(1) && player1.contains(5) && player1.contains(9)) {
      winner = 1;
    }
    if (player2.contains(1) && player2.contains(5) && player2.contains(9)) {
      winner = 2;
    }
    if (player1.contains(4) && player1.contains(5) && player1.contains(6)) {
      winner = 1;
    }
    if (player2.contains(4) && player2.contains(5) && player2.contains(6)) {
      winner = 2;
    }
    if (player1.contains(3) && player1.contains(5) && player1.contains(7)) {
      winner = 1;
    }
    if (player2.contains(3) && player2.contains(5) && player2.contains(7)) {
      winner = 2;
    }
    if (player1.contains(1) && player1.contains(4) && player1.contains(7)) {
      winner = 1;
    }
    if (player2.contains(1) && player2.contains(4) && player2.contains(7)) {
      winner = 2;
    }
    if (player1.contains(2) && player1.contains(5) && player1.contains(8)) {
      winner = 1;
    }
    if (player2.contains(2) && player2.contains(5) && player2.contains(8)) {
      winner = 2;
    }
    if (player1.contains(3) && player1.contains(6) && player1.contains(9)) {
      winner = 1;
    }
    if (player2.contains(3) && player2.contains(6) && player2.contains(9)) {
      winner = 2;
    }
    if (winner != -1) {
      if (winner == 1) {
        showDialog(
            context: context,
            builder: (_) =>
                Customdialog("Congratulations, You won!!", "Press the Reset button to Start Again", reset));
      } else {
        showDialog(
            context: context,
            builder: (_) =>
                Customdialog("Oops!! Computer won..", "Press the Reset button to Start Again", reset));
      }
    }
    return winner;
  }

  void playGame(gamebutton gb) {
    setState(() {
      if (activeplayer == 1) {
        gb.text = "X";
        // gb.img= Image(image: AssetImage('/images/pushti.png'),);
        gb.bg = Colors.red;
        activeplayer = 2;
        player1.add(gb.id);
      } else {
        gb.text = "0";
        //  gb.img= Image(image: AssetImage('/images/jay.png'),);
        gb.bg = Colors.blue;
        activeplayer = 1;
        player2.add(gb.id);
      }
      gb.enabled = false;
      int winner = checkWinner();
      if (winner == -1) {
        if (buttonsList.every((p) => p.text != " ")) {
          showDialog(
              context: context,
              builder: (_) => new Customdialog(
                  "Game Tied!!!", "Press the reset button to reset", reset));
        } else {
          activeplayer == 2 ? autoplay() : null;
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    // var colors;
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.grey.shade800,
        title: const Center(
          child: Text('TIC TAC TOE'),
        ),
      ),
      // body: Center(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
              child: Center(
                child: GridView.builder(
                 shrinkWrap: true,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    childAspectRatio: 1.0,
                    crossAxisSpacing: 9.0,
                    mainAxisSpacing: 9.0,
                  ),
                  itemCount: buttonsList.length,
                  itemBuilder: (context, i) => new SizedBox(
                    width: 100.0,
                    height: 200.0,
                    child: RaisedButton(
                      padding: const EdgeInsets.all(10.0),
                      onPressed: buttonsList[i].enabled
                          ? () => playGame(buttonsList[i])
                          : null,
                      color: buttonsList[i].bg,
                      disabledColor: buttonsList[i].bg,
                      child: new Text(
                        buttonsList[i].text,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 30.0,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            RaisedButton(
              color: Colors.grey.shade800,
              padding: const EdgeInsets.all(20.0),
              onPressed: reset,
              child: const Text(
                'Reset',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                ),
              ),
            ),
          ],
        ),
      
    );
  }
}
