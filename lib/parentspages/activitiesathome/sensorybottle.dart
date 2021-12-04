import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../activties_athomepage.dart';
import 'package:ausome_fap/parentspages/activitiesathome/video.dart';
import 'package:video_player/video_player.dart';

void main() => runApp(SensoryBottlePage());

class SensoryBottlePage extends StatelessWidget {
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
                  padding: EdgeInsets.all(5.0),
                  margin: EdgeInsets.all(5.0),
                  decoration: BoxDecoration(
                    color: Colors.blue.shade700,
                    borderRadius: BorderRadius.circular(10.0),
                    //margin: const EdgeInsets.all(10.0),
                  ),

                  // alignment: Alignment.topCenter,
                  child: SingleChildScrollView(
                    child: Column(
                      children: <Widget>[
                        Text(
                          'SENSORY BOTTLE',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 40,
                            color: Colors.black54,
                          ),
                        ),
                        SizedBox(
                            height: 50.0,
                            width: 500.0,
                            child: Divider(
                              color: Colors.blueGrey.shade500,
                              thickness: 5.0,
                            )),
                        Text(
                          'Fill an old plastic bottle with a mix of water, glitter and a few drops of food coloring to create an eye-catching toy for your kid.'
                          ' Drop in a few buttons or marbles and then seal the lid tightly using a hot glue gun. This activity is a really simple way to help your kid learn '
                          'to engage and stay focused.',
                          textAlign: TextAlign.justify,
                          style: TextStyle(
                            fontStyle: FontStyle.italic,
                            fontSize: 18,
                            color: Colors.black54,
                          ),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Video(
                            vpController: VideoPlayerController.asset(
                                'videos/bottle1.mp4')),
                        SizedBox(
                          height: 30,
                        ),
                        Image.network(
                          'https://i.pinimg.com/originals/20/b3/82/20b382fc556f5e32e2551e657b515563.jpg',
                          scale: 1,
                        ),
                        SizedBox(
                          height: 30,
                        ),
                      ],
                    ),
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
