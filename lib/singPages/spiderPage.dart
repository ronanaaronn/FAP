import 'package:ausome_fap/singPages/play_music.dart';
import 'package:ausome_fap/singpage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() => runApp(Spider());

Map<Duration, String> lyrics = {
  Duration(seconds: 0): "The itsy bitsy spider went up the water spout\n\n"
      "Down came the rain and washed the spider out\n",
  Duration(seconds: 10): "Out came the sun and dried up all the rain\n\n"
      "And the itsy bitsy spider went up the spout again\n",
  Duration(seconds: 19): "The itsy bitsy spider went up the water spout\n\n"
      "Down came the rain and washed the spider out\n",
  Duration(seconds: 27): "Out came the sun and dried up all the rain\n\n"
      "And the itsy bitsy spider went up the spout again\n",
  Duration(seconds: 35): "The itsy bitsy spider went up the water spout\n\n"
      "Down came the rain and washed the spider out\n",
  Duration(seconds: 46): "Out came the sun and dried up all the rain\n\n"
      "And the itsy bitsy spider went up the spout again\n",
  Duration(seconds: 55): "The itsy bitsy spider went up the water spout\n\n"
      "Down came the rain and washed the spider out\n",
  Duration(minutes: 1, seconds: 3):
      "Out came the sun and dried up all the rain\n\n"
          "And the itsy bitsy spider went up the spout again\n",
  Duration(minutes: 1, seconds: 14):
      "The itsy bitsy spider went up the water spout\n\n"
          "Down came the rain and washed the spider out\n",
  Duration(minutes: 1, seconds: 22):
      "Out came the sun and dried up all the rain\n\n"
          "And the itsy bitsy spider went up the spout again\n",
};

class Spider extends StatefulWidget {
  @override
  _SpiderState createState() => _SpiderState();
}

class _SpiderState extends State<Spider> {
  PlayMusic pm = PlayMusic(audioName: "spider.mp3", lyrics: lyrics);

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
                        'The itsy bitsy spider!',
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
"The itsy bitsy spider went up the water spout\n"
 "Down came the rain and washed the spider out\n"
"Out came the sun and dried up all the rain\n"
"And the itsy bitsy spider went up the spout again\n"
 */
