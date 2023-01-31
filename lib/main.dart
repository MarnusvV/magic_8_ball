import 'package:flutter/material.dart';
import 'dart:math';
import 'package:shake/shake.dart';

void main() => runApp(
      MaterialApp(
        home: Scaffold(
          backgroundColor: Colors.blueGrey,
          appBar: AppBar(
            backgroundColor: Colors.grey,
            title: Text('Magic 8 Ball'),
          ),
          body: magicBall(),
        ),
      ),
    );

class magicBall extends StatefulWidget {
  @override
  State<magicBall> createState() => _magicBallState();
}

class _magicBallState extends State<magicBall> {
  int randomBall = 1;

  @override
  void initState() {
    super.initState();
    ShakeDetector.autoStart(
        onPhoneShake: () {
          setState(() {
            randomBall = Random().nextInt(5) + 1;
          });
        },
        minimumShakeCount: 1,
        shakeSlopTimeMS: 50,
        shakeCountResetTime: 300,
        shakeThresholdGravity: 2.0);
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        children: [
          Expanded(
            child: TextButton(
              child: Image.asset('images/ball$randomBall.png'),
              onPressed: () {
                setState(() {
                  randomBall = Random().nextInt(5) + 1;
                });
              },
            ),
          ),
        ],
      ),
    );
  }
}
