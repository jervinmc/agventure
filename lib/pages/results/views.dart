import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_rx/src/rx_typedefs/rx_typedefs.dart';
import 'package:confetti/confetti.dart';

class Results extends StatefulWidget {
  dynamic args = Get.arguments;

  @override
  _ResultsState createState() => _ResultsState(this.args);
}

class _ResultsState extends State<Results> {
  late ConfettiController _controllerCenter;

  var _args;
  _ResultsState(this._args);
  @override
  void initState() {
    _controllerCenter =
        ConfettiController(duration: const Duration(seconds: 2));
    _controllerCenter.play();
    super.initState();
  }

  @override
  void dispose() {
    _controllerCenter.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text('Results'),
        backgroundColor: Color(0xff06611F),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _args[0]>5? ConfettiWidget(
              confettiController: _controllerCenter,
              blastDirectionality: BlastDirectionality.explosive,
              particleDrag: 0.05,
              emissionFrequency: 0.05,
              numberOfParticles: 10,
              gravity: 0.05,
              shouldLoop: false,
              colors: const [
                Colors.green,
                Colors.blue,
                Colors.pink,
                Colors.orange,
                Colors.purple
              ], // manually specify the colors to be used
            ) : Text(''),
            Text('${_args[0]}/10',style: TextStyle(fontSize: 30.0),),
            Container(
              padding: EdgeInsets.all(20),
              child:_args[0]>5?  Text(
                  "Congratulations!",
                  style:
                      TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold)) : Text(
                  "Better luck next time!",
                  style:
                      TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold)),
            ),
            Options(() {
              Get.toNamed('/profile');
            }, 'View Profile'),
            Options(() {
              Get.toNamed('/starting');
            }, 'Go Home'),
          ],
        ),
      ),
    );
  }
}

class Options extends StatelessWidget {
  Callback func;
  String answer;
  Options(this.func, this.answer);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 20, right: 20, top: 10),
      width: 250,
      child: ElevatedButton(
          style: ButtonStyle(
              backgroundColor:
                  MaterialStateProperty.all<Color>(Color(0xff06611F)),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(18.0),
              ))),
          child: Text(answer),
          onPressed: func),
    );
  }
}
