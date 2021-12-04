
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() =>
    runApp(ParentsPage(

    ));

class ParentsPage  extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold (
      appBar: AppBar(
          leading: Image.asset('images/ausome.png'),
          backgroundColor: Colors.white,
          title: Row(
            children: <Widget>[
              Text('A',
                style: TextStyle(
                  color: Colors.red,
                  fontSize: 30,
                ),),
              Text('U',
                style: TextStyle(
                  color: Colors.green,
                  fontSize: 30,
                ),),
              Text('S',
                style: TextStyle(
                  color: Colors.yellow,
                  fontSize: 30,
                ),),
              Text('O',
                style: TextStyle(
                  color: Colors.deepPurple,
                  fontSize: 30,
                ),),
              Text('M',
                style: TextStyle(
                  color: Colors.pinkAccent,
                  fontSize: 30,
                ),),
              Text('E',
                style: TextStyle(
                  color: Colors.teal,
                  fontSize: 30,
                ),)
            ],
          )
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(child: Row(
            children: <Widget>[
              Expanded(
                child: Container(
                  color: Colors.amberAccent,
                  margin: EdgeInsets.all(15.0),


                ),
              ),
            ],
          ),
          )
        ],
      ),
    );
  }
}









