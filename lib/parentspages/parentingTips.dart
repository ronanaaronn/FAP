import 'package:ausome_fap/parentspages/parentsHomePage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() => runApp(ParentingTips());

class ParentingTips extends StatelessWidget {
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
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ParentsHomePage()));
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
                  margin: EdgeInsets.fromLTRB(10.0, 40.0, 10.0, 40.0),
                  decoration: BoxDecoration(
                    color: Colors.orangeAccent.shade100,
                    borderRadius: BorderRadius.circular(10.0),
                    //margin: const EdgeInsets.all(10.0),
                  ),
                  // alignment: Alignment.topCenter,
                  child: SingleChildScrollView(
                    child: Column(
                      children: <Widget>[
                        Text(
                          'PARENTING TIPS!',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 30,
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Text(
                          "Signs that may indicate a developmental challenge include:\n"
                          "• An unusual insistence on routine\n"
                          "• A preference for being alone or aloofness\n"
                          "• A resistance to being held or touched\n"
                          "• Spinning objects or unusual sensory interests in objects (e.g. peering at objects, sniffing or licking non-food items, watching objects fall)\n"
                          "• Engaging in repetitious motor movements or activities (e.g. running in circles, flapping hands, lining up objects)\n"
                          "• Repeating words or phrases\n"
                          "• Laughing, crying or showing distress in situations where one would not usually see or predict such a reaction\n"
                          "• No apparent response to verbal instructions despite normal results to hearing tests\n"
                          "• A strong sensitivity to sensory stimuli (sounds, lights, tactile sensations, commotion)\n",
                          style: TextStyle(
                            fontStyle: FontStyle.italic,
                            fontSize: 20,
                          ),
                        ),
                        Text(
                          "'Autism Symptoms Checklist - Autism Treatment Center of America'\n",
                        )
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

// ElevatedButton.icon(
// onPressed: (){Navigator.push(context,MaterialPageRoute(builder:(context) => ParentsHomePage()));},
// icon: Icon(Icons.attractions, color: Colors.greenAccent ),
// label: Text('Sample Button'),
// margin: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 10.0),
//)
