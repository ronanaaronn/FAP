import 'package:ausome_fap/singPages/play_music.dart';
import 'package:ausome_fap/singpage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() => runApp(Mary());

Map<Duration, String> lyrics = {
  Duration(seconds: 0): "Mary had a little lamb,\n"
      "little lamb, little lamb.\n"
      "Mary had a little lamb,\n"
      "its fleece was white as snow.\n",
  Duration(seconds: 19): "And everywhere that Mary went,\n"
      "Mary went, Mary went;\n"
      "And everywhere that Mary went,\n"
      "the lamb was sure to go.\n",
  Duration(seconds: 33): "It followed her to school one day,\n"
      "school one day, school one day;\n"
      "It followed her to school one day,\n"
      "that was against the rule.\n",
  Duration(seconds: 47): "It made the children laugh and play,\n"
      "laugh and play, laugh and play;\n"
      "It made the children laugh and play\n"
      "to see a lamb at school.\n",
};

class Mary extends StatefulWidget {
  @override
  _MaryState createState() => _MaryState();
}

class _MaryState extends State<Mary> {
  PlayMusic pm = PlayMusic(audioName: "lamb.mp3", lyrics: lyrics);

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
                        'Mary had a little lamb!',
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
"Mary had a little lamb,\n"
"little lamb, little lamb.\n"
"Mary had a little lamb,\n"
"its fleece was white as snow.\n"

"And everywhere that Mary went,\n"
"Mary went, Mary went;\n"
"And everywhere that Mary went,\n"
"the lamb was sure to go.\n"

"It followed her to school one day,\n"
"school one day, school one day;\n"
"It followed her to school one day,\n"
"that was against the rule.\n"

"It made the children laugh and play,\n"
"laugh and play, laugh and play;\n"
"It made the children laugh and play\n"
"to see a lamb at school.\n"
*/
