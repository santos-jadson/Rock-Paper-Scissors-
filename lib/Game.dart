import 'dart:math';

import 'package:flutter/material.dart';

class Game extends StatefulWidget {
  Game({Key key}) : super(key: key);

  @override
  _GameState createState() => _GameState();
}

class _GameState extends State<Game> {
  var _image = AssetImage('assets/padrao.png');
  var _options = ['rock', 'paper', 'scissors'];
  var _message = '';

  void _selectOption(String choice) {
    Random rand = new Random();

    var _computerChoice = _options[rand.nextInt(3)];
    var _winner = false;
    var _draw = false;

    setState(() {
      this._image = AssetImage('assets/'+_computerChoice+'.png');  
    });

    switch(choice){
      case 'rock':
        switch(_computerChoice) {
          case 'scissors':
            _winner = true;
            break;
          case 'rock': 
            _draw = true;
            break;
        }
        break;
      case 'paper':
        switch(_computerChoice) {
          case 'rock':
            _winner = true;
            break;
          case 'paper': 
            _draw = true;
            break;
        }
        break;
      case 'scissors':
        switch(_computerChoice) {
          case 'paper':
            _winner = true;
            break;
          case 'scissors': 
            _draw = true;
            break;
        }
        break;
    }

    _setMessage([_winner, _draw]);
  }

  void _setMessage(List<bool> results) {
    print(results);

    //check the _winner variable
    if(results.elementAt(0))
      setState(() {
        _message = 'You win';
      });
    //check if the user lose
    if(!results.elementAt(0) && !results.elementAt(1))
      setState(() {
        _message = 'You lose';
      });
    //check if it's a draw
    if(results.elementAt(1))
      setState(() {
        _message = "It's a draw";
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold (
      appBar: AppBar(
        title: Text("Rock Paper Scissors"),
      ),
      body: 
        Column (
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(top: 32, bottom: 16),
              child: 
                Text(
                  "App choice:",
                  textAlign: TextAlign.center,
                  style: TextStyle (
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
            ),
            Image(image: this._image),
        
            Padding(
              padding: EdgeInsets.only(top: 32, bottom: 32),
              child: 
                Text(
                  "Make a choice:",
                  textAlign: TextAlign.center,
                  style: TextStyle (
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
            ),
            Row (
              children: <Widget>[
                GestureDetector(
                  onTap: () => _selectOption("rock"),
                  child: Image.asset('assets/rock.png', width: 100),
                ),
                GestureDetector(
                  onTap: () => _selectOption("paper"),
                  child: Image.asset('assets/paper.png', width: 100),
                ),
                GestureDetector(
                  onTap: () => _selectOption("scissors"),
                  child: Image.asset('assets/scissors.png', width: 100),
                ),
              ],
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            ),
            Padding(
              padding: EdgeInsets.only(top: 32, bottom: 32),
              child: 
                Text(
                  _message,
                  textAlign: TextAlign.center,
                  style: TextStyle (
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
            ),
          ],
        ),
    );
  }
}