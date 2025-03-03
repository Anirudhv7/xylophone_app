import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

//Main function of the App
void main() => runApp(XylophoneApp());

//Statless Widget is benig created 
class XylophoneApp extends StatelessWidget {
  const XylophoneApp({super.key});

//Function to play sound
//This function creates an audio player and plays the corresponding sound file 
  void  playSound( int soundNum) {
    final player = AudioPlayer();
    //Asset Source is used to play the locally stored audio files from the 'assets' folder
    player.play(AssetSource('note$soundNum.wav'));
  }

// Function to build a key of the xylophone
// Returns an Expanded widget containing a GestureDetector and a colored Container
  Expanded buildKey ({required Color color, required int soundNum}) {
       return Expanded(
        //A gesture Button is created to take all the button inputs
                child: GestureDetector(
                  // When the key is tapped, play the corresponding sound
                  onTap: () {
                    playSound(soundNum);
                  },
                  child: Container(
                    color: color,
                  ),
                ),
              );
  }

  @override
  Widget build(BuildContext context) {
    //Material App is being crated
    return MaterialApp(
      home: Scaffold(
        //Back gorund color is set to 'black'
        backgroundColor: Colors.black,
        body: SafeArea(
          // Column widget to arrange the xylophone keys vertically
          child: Column(
            // Stretch the keys across the width of the screen
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
           // Building 7 keys with different colors and sounds
           // Each key is created using the buildKey function
           buildKey(color:Colors.red, soundNum:1),
           buildKey(color:Colors.orange, soundNum:2),
           buildKey(color:Colors.yellow, soundNum:3),
           buildKey(color:Colors.green, soundNum:4),
           buildKey(color:Colors.blue, soundNum:5),
           buildKey(color:Colors.indigo, soundNum:6),
           buildKey(color:Colors.purple, soundNum:7),
            ],
          ),
        ),
      ),
    );
  }
}
