import 'package:ausome_fap/kids_homepage.dart';
import 'package:ausome_fap/parentspages/parentsHomePage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: "Ausome",
    home: Ausome(),
  ));
}

class Ausome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData.light().copyWith(
        primaryColor: Color(0xFFb2ebf2),
        scaffoldBackgroundColor: Color(0xFFb2ebf2),
      ),
      home: Scaffold(
        body: SafeArea(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: new Container(
                    child: new Image.asset(
                      'images/autism.png',
                      height: 270.0,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              'A',
                              style: TextStyle(
                                color: Colors.red,
                                fontSize: 50,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              'U',
                              style: TextStyle(
                                color: Colors.green,
                                fontSize: 50,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              'S',
                              style: TextStyle(
                                color: Colors.yellow.shade800,
                                fontSize: 50,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              'O',
                              style: TextStyle(
                                color: Colors.deepPurple,
                                fontSize: 50,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              'M',
                              style: TextStyle(
                                color: Colors.pinkAccent,
                                fontSize: 50,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              'E',
                              style: TextStyle(
                                color: Colors.teal,
                                fontSize: 50,
                                fontWeight: FontWeight.bold,
                              ),
                            )
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.all(11.0),
                          child: Text(
                            'App specially designed for kids with special needs',
                            style: TextStyle(
                              color: Colors.teal,
                              fontSize: 15,
                              fontStyle: FontStyle.italic,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(50.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        child: Text("PARENTS".toUpperCase(),
                            style: TextStyle(fontSize: 40)),
                        style: ElevatedButton.styleFrom(
                          //padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                          primary: Colors.redAccent,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50)),
                          fixedSize: const Size(250, 70),
                          //foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                          //backgroundColor: MaterialStateProperty.all<Color>(Colors.redAccent),
                        ),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ParentsHomePage()));
                        },
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: ElevatedButton(
                          child: Text("KIDS".toUpperCase(),
                              style: TextStyle(fontSize: 40)),
                          style: ElevatedButton.styleFrom(
                            //padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                            primary: Colors.redAccent,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(50)),
                            fixedSize: const Size(250, 70),
                            //foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                            //backgroundColor: MaterialStateProperty.all<Color>(Colors.redAccent),
                          ),
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => KidsPage()));
                          },
                        ),
                      )
                    ],
                  ),
                )
              ]),
        ),
      ),
    );
  }
}
