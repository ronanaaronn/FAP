import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../activties_athomepage.dart';
import 'package:ausome_fap/parentspages/activitiesathome/video.dart';
import 'package:video_player/video_player.dart';

void main() => runApp(SortingSnacksPage());

class SortingSnacksPage extends StatelessWidget {
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
                    color: Colors.lightGreen.shade300,
                    borderRadius: BorderRadius.circular(10.0),
                    //margin: const EdgeInsets.all(10.0),
                  ),

                  // alignment: Alignment.topCenter,
                  child: SingleChildScrollView(
                    child: Column(
                      children: <Widget>[
                        Text(
                          'SORTING WITH SNACKS',
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
                          'This tactile activity for children with autism can be a fun way to engage your kids during their study time.'
                          ' Give your child a food that is easy to sort, like chewy snacks or small crackers. Multicolored snacks are ideal, '
                          'but you can also use food that comes in different shapes, textures, or sizes.First, ask them to sort the food by color, shape, or another characteristic. '
                          'Then, use the snacks to teach your child basic math skills like counting, adding, or subtraction. Once they’ve grasped the concept you want to teach,'
                          ' reward your kids by letting them eat the snack.',
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
                                'videos/snack1.mp4')),
                        SizedBox(
                          height: 30,
                        ),
                        Image.network(
                          'https://i.pinimg.com/originals/e5/8a/2f/e58a2f973dfb11b7416d166469808582.jpg',
                          scale: 2,
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
