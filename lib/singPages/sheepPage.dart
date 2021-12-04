import 'package:ausome_fap/singPages/play_music.dart';
import 'package:ausome_fap/singpage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() => runApp(BaaBaa());

Map<Duration, String> lyrics = {
  Duration(seconds: 0): "Baa baa black sheep have you any wool?\n"
      "Yes sir, yes sir three bags full\n"
      "One for the master\n",
  Duration(seconds: 29): "One for the dame\n"
      "And one for the little boy\n"
      "Who lives down the lane\n",
  Duration(seconds: 39): "Baa baa black sheep have you any wool?\n"
      "Yes sir, yes sir three bags full\n"
      "One for the master\n",
  Duration(seconds: 50): "One for the dame\n"
      "And one for the little boy\n"
      "Who lives down the lane\n",
  Duration(minutes: 1, seconds: 0): "Baa baa black sheep have you any wool?\n"
      "Yes sir, yes sir three bags full\n"
      "One for the master\n",
  Duration(minutes: 1, seconds: 12): "One for the dame\n"
      "And one for the little boy\n"
      "Who lives down the lane\n",
};

class BaaBaa extends StatefulWidget {
  @override
  _BaaBaaState createState() => _BaaBaaState();
}

class _BaaBaaState extends State<BaaBaa> {
  PlayMusic pm = PlayMusic(audioName: "blacksheep.mp3", lyrics: lyrics);

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
                        'Baa Baa Black Sheep!',
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
"Baa baa black sheep have you any wool?\n"
"Yes sir, yes sir three bags full\n"
"One for the master\n"

"One for the dame\n"
"And one for the little boy\n"
"Who lives down the lane\n"
*/
