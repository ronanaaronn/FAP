import 'package:ausome_fap/singPages/play_music.dart';
import 'package:ausome_fap/singpage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() => runApp(JJ());

Map<Duration, String> lyrics = {
  Duration(seconds: 0): "Jack and Jill went up the hill,\n"
      "To fetch a pail of water.\n"
      "Jack fell down and broke his crown,\n"
      "And Jill came tumbling after.\n",
  Duration(seconds: 28): "Up got Jack and home did trot,\n"
      "As fast as he could caper,\n"
      "And went to bed to mend his head\n"
      "With vinegar and brown paper.\n",
  Duration(seconds: 47): "Jack and Jill went up the hill,\n"
      "To fetch a pail of water.\n"
      "Jack fell down and broke his crown,\n"
      "And Jill came tumbling after.\n",
  Duration(minutes: 1, seconds: 5): "Up got Jack and home did trot,\n"
      "As fast as he could caper,\n"
      "And went to bed to mend his head\n"
      "With vinegar and brown paper.\n",
};

class JJ extends StatefulWidget {
  @override
  _JJState createState() => _JJState();
}

class _JJState extends State<JJ> {
  PlayMusic pm = PlayMusic(audioName: "jj.mp3", lyrics: lyrics);

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
                        'Jack and Jill!',
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
"Jack and Jill went up the hill,\n"
"To fetch a pail of water.\n"
"Jack fell down and broke his crown,\n"
"And Jill came tumbling after.\n"

"Up got Jack and home did trot,\n"
"As fast as he could caper,\n"
"And went to bed to mend his head\n"
"With vinegar and brown paper.\n"

"Jack and Jill went up the hill,\n"
"To fetch a pail of water.\n"
"Jack fell down and broke his crown,\n"
"And Jill came tumbling after.\n"

"Up got Jack and home did trot,\n"
"As fast as he could caper,\n"
"And went to bed to mend his head\n"
"With vinegar and brown paper.\n"
 */
