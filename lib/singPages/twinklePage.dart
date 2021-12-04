import 'package:ausome_fap/singPages/play_music.dart';
import 'package:ausome_fap/singpage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() => runApp(TwinklePage());

Map<Duration, String> lyrics = {
  Duration(seconds: 0): "Twinkle, twinkle, little star,\n"
      "How I wonder what you are!\n"
      "Up above the world so high,\n"
      "Like a diamond in the sky.\n",
  Duration(seconds: 29): "Twinkle, twinkle, little star,\n"
      "How I wonder what you are!\n"
      "When the blazing sun is gone,\n"
      "When he nothing shines upon,\n",
  Duration(seconds: 47): "Then you show your little light,\n"
      "Twinkle, twinkle, all the night.\n"
      "Twinkle, twinkle, little star,\n"
      "How I wonder what you are!\n",
  Duration(minutes: 1, seconds: 6): "Then the traveller in the dark,\n"
      "Thanks you for your tiny spark,\n"
      "He could not see which way to go,\n"
      "If you did not twinkle so.\n",
  Duration(minutes: 1, seconds: 25): "Twinkle, twinkle, little star,\n"
      "How I wonder what you are!\n"
      "In the dark blue sky you keep,\n"
      "And often through my curtains peep,\n",
  Duration(minutes: 1, seconds: 45): "For you never shut your eye,\n"
      "Till the sun is in the sky.\n"
      "Twinkle, twinkle, little star,\n"
      "How I wonder what you are!,\n",
};

class TwinklePage extends StatefulWidget {
  @override
  _TwinklePageState createState() => _TwinklePageState();
}

class _TwinklePageState extends State<TwinklePage> {
  PlayMusic pm = PlayMusic(audioName: "twinkle.mp3", lyrics: lyrics);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
            leading: Image.asset('images/autism.png'),
            backgroundColor: Colors.tealAccent,
            title: Row(
              children: <Widget>[
                Text(
                  'A',
                  style: TextStyle(
                    color: Colors.red,
                    fontSize: 30,
                  ),
                ),
                Text(
                  'U',
                  style: TextStyle(
                    color: Colors.green,
                    fontSize: 30,
                  ),
                ),
                Text(
                  'S',
                  style: TextStyle(
                    color: Colors.yellow,
                    fontSize: 30,
                  ),
                ),
                Text(
                  'O',
                  style: TextStyle(
                    color: Colors.deepPurple,
                    fontSize: 30,
                  ),
                ),
                Text(
                  'M',
                  style: TextStyle(
                    color: Colors.pinkAccent,
                    fontSize: 30,
                  ),
                ),
                Text(
                  'E',
                  style: TextStyle(
                    color: Colors.teal,
                    fontSize: 30,
                  ),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(143.0, 0.0, 0.0, 0.0),
                  child: IconButton(
                    icon: Icon(
                      Icons.arrow_back_sharp,
                      color: Colors.black,
                    ),
                    iconSize: 40,
                    onPressed: () {
                      pm.stopAudio();
                      Navigator.pop(context);
                    },
                  ),
                ),
              ],
            )),
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Expanded(
                child: Container(
                  padding: EdgeInsets.all(20.0),
                  margin: EdgeInsets.all(20.0),
                  decoration: BoxDecoration(
                    color: Colors.orange.shade200,
                    borderRadius: BorderRadius.circular(10.0),
                    //margin: const EdgeInsets.all(10.0),
                  ),

                  // alignment: Alignment.topCenter,
                  child: Column(
                    children: <Widget>[
                      Text(
                        'Twinkle Twinkle Little Star!',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 25,
                        ),
                      ),
                      SizedBox(
                        height: 50,
                      ),
                      Expanded(
                        child: Text(
                          pm.showLyrics!,
                          style: TextStyle(
                            fontStyle: FontStyle.italic,
                            fontSize: 33,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(9.0),
                        child: Container(
                          margin: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
                          child: Visibility(
                            visible: pm.playButton,
                            child: ElevatedButton(
                              child: Text("PLAY".toUpperCase(),
                                  style: TextStyle(fontSize: 20)),
                              style: ElevatedButton.styleFrom(
                                //padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                                primary: Colors.green.shade900,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10)),
                                fixedSize: const Size(3000, 70),
                                //foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                                //backgroundColor: MaterialStateProperty.all<Color>(Colors.redAccent),
                              ),
                              onPressed: () {
                                setState(() {
                                  pm.playButton = false;
                                  pm.playAudio();
                                  pm.audioPlayer.onAudioPositionChanged
                                      .listen((Duration p) {
                                    setState(() {
                                      pm.position = p;
                                      pm.updateLyrics();
                                    });
                                  });
                                  pm.audioPlayer.onPlayerCompletion
                                      .listen((event) {
                                    setState(() {
                                      pm.reset();
                                    });
                                  });
                                });
                              },
                            ),
                            replacement: ElevatedButton(
                              child: Text("PAUSE".toUpperCase(),
                                  style: TextStyle(fontSize: 20)),
                              style: ElevatedButton.styleFrom(
                                //padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                                primary: Colors.green.shade900,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10)),
                                fixedSize: const Size(3000, 70),
                                //foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                                //backgroundColor: MaterialStateProperty.all<Color>(Colors.redAccent),
                              ),
                              onPressed: () {
                                setState(() {
                                  pm.pauseAudio();
                                  pm.playButton = true;
                                });
                              },
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/*
"Twinkle, twinkle, little star,\n"
"How I wonder what you are!\n"
"Up above the world so high,\n"
"Like a diamond in the sky.\n"
"Twinkle, twinkle, little star,\n"
"How I wonder what you are!\n"
"When the blazing sun is gone,\n"
"When he nothing shines upon,\n"
"Then you show your little light,\n"
"Twinkle, twinkle, all the night.\n"
"Twinkle, twinkle, little star,\n"
"How I wonder what you are!\n"
"Then the traveller in the dark,\n"
"Thanks you for your tiny spark,\n"
"He could not see which way to go,\n"
"If you did not twinkle so.\n"
"Twinkle, twinkle, little star,\n"
"How I wonder what you are!\n"
"In the dark blue sky you keep,\n"
"And often through my curtains peep,\n"
"For you never shut your eye,\n"
"Till the sun is in the sky.\n"
"Twinkle, twinkle, little star,\n"
"How I wonder what you are!,\n",
*/
