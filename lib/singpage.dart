import 'package:ausome_fap/kids_homepage.dart';
import 'package:ausome_fap/singPages/Jack%20And%20Jill.dart';
import 'package:ausome_fap/singPages/Mary.dart';
import 'package:ausome_fap/singPages/sheepPage.dart';
import 'package:ausome_fap/singPages/spiderPage.dart';
import 'package:ausome_fap/singPages/twinklePage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


void main() =>
    runApp(SingPage());
class SingPage extends StatelessWidget {
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
                Text('A',
                  style: TextStyle(
                    color: Colors.red,
                    fontSize: 30,
                  ),
                ),
                Text('U',
                  style: TextStyle(
                    color: Colors.green,
                    fontSize: 30,
                  ),
                ),
                Text('S',
                  style: TextStyle(
                    color: Colors.yellow,
                    fontSize: 30,
                  ),
                ),
                Text('O',
                  style: TextStyle(
                    color: Colors.deepPurple,
                    fontSize: 30,
                  ),
                ),
                Text('M',
                  style: TextStyle(
                    color: Colors.pinkAccent,
                    fontSize: 30,
                  ),
                ),
                Text('E',
                  style: TextStyle(
                    color: Colors.teal,
                    fontSize: 30,
                  ),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(143.0, 0.0, 0.0, 0.0),
                  child: IconButton(
                    icon: Icon(Icons.arrow_back_sharp,
                      color: Colors.black,
                    ),
                    iconSize: 40,
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => KidsPage())
                      );
                    },
                  ),
                ),
              ],
            )
        ),
        body:SafeArea(
          child:Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Expanded(
                child: Container(
                  padding: EdgeInsets.all(20.0),
                  margin: EdgeInsets.all(20.0),
                  decoration: BoxDecoration(
                    color: Colors.yellowAccent,
                    borderRadius: BorderRadius.circular(10.0),
                    //margin: const EdgeInsets.all(10.0),
                  ),



                  // alignment: Alignment.topCenter,
                  child: Column(
                    children: <Widget> [
                      Text(
                        'LETS SING!',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 30,
                        ),
                      ),
                      Text(
                        'Here are some of the music that are fun for children'
                            'while staying at home. These fun-filled activities will increase '
                            'their skills.',
                        style: TextStyle(
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(9.0),
                        child: ElevatedButton(
                          child: Text(
                              "TWINKLE TWINKLE LITTLE STAR".toUpperCase(),
                              style: TextStyle(fontSize: 20)
                          ),
                          style: ElevatedButton.styleFrom(
                            //padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                            primary: Colors.red.shade300,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                            fixedSize: const Size(3000, 70),
                            //foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                            //backgroundColor: MaterialStateProperty.all<Color>(Colors.redAccent),

                          ),
                          onPressed: (){
                            Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => TwinklePage())
                            );
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(9.0),
                        child: ElevatedButton(
                          child: Text(
                              "BAA BAA BLACK SHEEP".toUpperCase(),
                              style: TextStyle(fontSize: 20)
                          ),
                          style: ElevatedButton.styleFrom(
                            //padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                            primary: Colors.lightGreen.shade300,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                            fixedSize: const Size(3000, 70),
                            //foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                            //backgroundColor: MaterialStateProperty.all<Color>(Colors.redAccent),

                          ),
                          onPressed: (){
                            Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => BaaBaa())
                            );
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(9.0),
                        child: ElevatedButton(
                          child: Text(
                              "THE ITSY BITSY SPIDER".toUpperCase(),
                              style: TextStyle(fontSize: 20)
                          ),
                          style: ElevatedButton.styleFrom(
                            //padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                            primary: Colors.purple.shade300,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                            fixedSize: const Size(3000, 70),
                            //foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                            //backgroundColor: MaterialStateProperty.all<Color>(Colors.redAccent),

                          ),
                          onPressed: (){
                            Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => Spider())
                            );
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(9.0),
                        child: ElevatedButton(
                          child: Text(
                              "JACK AND JILL".toUpperCase(),
                              style: TextStyle(fontSize: 20)
                          ),
                          style: ElevatedButton.styleFrom(
                            //padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                            primary: Colors.orange.shade300,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                            fixedSize: const Size(3000, 70),
                            //foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                            //backgroundColor: MaterialStateProperty.all<Color>(Colors.redAccent),

                          ),
                          onPressed: (){
                            Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => JJ())
                            );
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(9.0),
                        child: ElevatedButton(
                          child: Text(
                              "MARY HAD A LITTLE LAMB".toUpperCase(),
                              style: TextStyle(fontSize: 20)
                          ),
                          style: ElevatedButton.styleFrom(
                            //padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                            primary: Colors.blue.shade700,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                            fixedSize: const Size(3000, 70),
                            //foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                            //backgroundColor: MaterialStateProperty.all<Color>(Colors.redAccent),

                          ),
                          onPressed: (){
                            Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => Mary())
                            );
                          },
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