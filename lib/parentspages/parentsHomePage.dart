import 'package:ausome_fap/main.dart';
import 'package:ausome_fap/parentspages/mChatR.dart';
import 'package:ausome_fap/parentspages/parentingTips.dart';
import 'package:ausome_fap/parentspages/professionalPage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'activties_athomepage.dart';


void main() =>
    runApp(ParentsHomePage());
class ParentsHomePage extends StatelessWidget {
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
                          MaterialPageRoute(builder: (context) => Ausome())
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
                  padding:EdgeInsets.all(20.0),
                  margin: EdgeInsets.fromLTRB(10.0, 40.0, 10.0, 40.0),
                  decoration: BoxDecoration(
                    color: Colors.orangeAccent.shade100,
                    borderRadius: BorderRadius.circular(10.0),
                    //margin: const EdgeInsets.all(10.0),
                  ),
                  // alignment: Alignment.topCenter,
                  child: Column(
                    children: <Widget> [
                      Text(
                        'WELCOME PARENTS!',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 30,
                        ),
                      ),
                      Text(
                        'Here are some helpful activities that you and your child can do'
                            'while staying at home. These fun-filled activities will increase '
                            'their skills.',
                        style: TextStyle(
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                       Row(
                          children: <Widget>[
                            Expanded(
                                child: TextButton(
                                  onPressed: (){
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(builder: (context) => MCR())
                                    );
                                  },
                                  child: Image.asset('images/mchatlogo.png')
                                )
                            ),
                            Expanded(
                              child: TextButton(
                                onPressed: (){
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(builder: (context) => ActivitiesPage())
                                  );
                                },
                                child: Image.asset('images/actlogo.png')
                              )
                            ),
                          ],
                       ),
                       Row(
                        children: <Widget>[
                          Expanded(
                              child: TextButton(
                                  onPressed: (){
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(builder: (context) => ParentingTips())
                                    );
                                  },
                                  child: Image.asset('images/parentlogo.png')
                              )
                          ),
                          Expanded(
                              child: TextButton(
                                  onPressed: (){
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(builder: (context) => ProPage())
                                    );
                                  },
                                  child: Image.asset('images/prologo.png')
                              )
                          ),
                        ],
                      ),
                       Container(
                        margin: EdgeInsets.fromLTRB(0.0, 35.0, 0.0, 0.0),
                        child: Text(
                          'Learn about the developers!',
                          style: TextStyle(
                            color:Colors.teal ,
                            fontWeight: FontWeight.bold,
                            fontSize: 10,
                          ),
                        ),
                      )
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




// ElevatedButton.icon(
// onPressed: (){Navigator.push(context,MaterialPageRoute(builder:(context) => ParentsHomePage()));},
// icon: Icon(Icons.attractions, color: Colors.greenAccent ),
// label: Text('Sample Button'),
// margin: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 10.0),
//)