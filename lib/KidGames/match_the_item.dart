import 'package:ausome_fap/KidGames/match_the_item_model/match_brain.dart';
import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

import '../kids_homepage.dart';

void main() => runApp(MaterialApp(home: ItemMatch()));

class ItemMatch extends StatefulWidget {
  const ItemMatch({Key? key}) : super(key: key);

  @override
  _ItemMatchState createState() => _ItemMatchState();
}

class _ItemMatchState extends State<ItemMatch> {
  MatchBrain mb = MatchBrain();
  bool displayGame = false;
  double show = 1;
  int totalCorrectAns = 0;
  String isCorrect = '';
  String message = '';

  var alertStyle = AlertStyle(
    animationType: AnimationType.fromTop,
    isCloseButton: false,
    isOverlayTapDismiss: false,
    descStyle: TextStyle(fontWeight: FontWeight.w300),
    descTextAlign: TextAlign.center,
    animationDuration: Duration(milliseconds: 400),
    // alertBorder: RoundedRectangleBorder(
    //   borderRadius: BorderRadius.circular(50.0),
    //   side: BorderSide(
    //     color: Colors.grey,
    //   ),
    // ),
    titleStyle: TextStyle(
        color: Colors.black, fontWeight: FontWeight.bold, fontSize: 35),
    alertAlignment: Alignment.center,
    backgroundColor: Colors.orangeAccent.shade100,
  );
  void checkAnswer() {
    setState(() {
      if (mb.isFinished()) {
        Alert(
          style: alertStyle,
          context: context,
          title: 'Good Job!',
          desc: "Score: $totalCorrectAns",
          buttons: [
            DialogButton(
              height: 50,
              child: Text(
                "GO BACK",
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => KidsPage()));
              },
              width: 150,
              color: Color(0xFF51B59F),
              radius: BorderRadius.circular(50),
            )
          ],
        ).show();
        // Alert(
        //   style: alertStyle,
        //   context: context,
        //   title: tb.getRisk(totalRiskResponse).toUpperCase(),
        //   desc: "MCHAT-R risk score: $totalRiskResponse\n" +
        //       tb.getInterpretation(totalRiskResponse),
        //   buttons: [
        //     DialogButton(
        //       height: 50,
        //       child: Text(
        //         "GO BACK",
        //         textAlign: TextAlign.center,
        //         style: TextStyle(
        //             color: Colors.white,
        //             fontSize: 20,
        //             fontWeight: FontWeight.bold),
        //       ),
        //       onPressed: () {
        //         Navigator.push(context,
        //             MaterialPageRoute(builder: (context) => ParentsHomePage()));
        //       },
        //       width: 150,
        //       color: Color(0xFF51B59F),
        //       radius: BorderRadius.circular(50),
        //     )
        //   ],
        // ).show();
      } else {
        Alert(
          style: alertStyle,
          context: context,
          title: message,
          desc: "CORRECT ANSWER:\n" + mb.getAnswer(),
          image: Image.asset('matchingitems/$isCorrect'),
          buttons: [
            DialogButton(
              height: 50,
              child: Text(
                "CONTINUE",
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
              onPressed: () {
                setState(() {
                  mb.nextQuestion();
                  show = 1;
                  Navigator.pop(context);
                });
              },
              width: 150,
              color: Color(0xFF51B59F),
              radius: BorderRadius.circular(50),
            )
          ],
        ).show();
      }
    });
  }

  // void showAnswer() {
  //   setState(() {
  //     Alert(
  //       style: alertStyle,
  //       context: context,
  //       title: 'saddddddddd',
  //       desc: "MCHAT-R risk score:",
  //       buttons: [
  //         DialogButton(
  //           height: 50,
  //           child: Text(
  //             "GO BACK",
  //             textAlign: TextAlign.center,
  //             style: TextStyle(
  //                 color: Colors.white,
  //                 fontSize: 20,
  //                 fontWeight: FontWeight.bold),
  //           ),
  //           onPressed: () {
  //             setState(() {
  //               mb.nextQuestion();
  //               show = 1;
  //               Navigator.pop(context);
  //             });
  //           },
  //           width: 150,
  //           color: Color(0xFF51B59F),
  //           radius: BorderRadius.circular(50),
  //         )
  //       ],
  //     ).show();
  //   });
  // }

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
                child: Visibility(
                  visible: !displayGame,
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
                          'Let\'s Match!',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 30,
                          ),
                        ),
                        Text(
                          'In this game, you have to match the items\n'
                          "These fun-filled activities will increase the child's skills",
                          style: TextStyle(
                            fontStyle: FontStyle.italic,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(9.0),
                          child: Container(
                            margin: EdgeInsets.fromLTRB(0.0, 365.0, 0.0, 0.0),
                            child: ElevatedButton(
                              child: Text("START!".toUpperCase(),
                                  style: TextStyle(fontSize: 20)),
                              style: ElevatedButton.styleFrom(
                                //padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                                primary: Colors.red.shade300,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10)),
                                fixedSize: const Size(3000, 70),
                                //foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                                //backgroundColor: MaterialStateProperty.all<Color>(Colors.redAccent),
                              ),
                              onPressed: () {
                                setState(() {
                                  displayGame = true;
                                });
                                //Navigator.push(
                                //,
                                //MaterialPageRoute(builder: (context) => EmotionCardPage())
                                //);
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  replacement: Container(
                    color: Colors.orange.shade200,
                    child: Column(
                      children: [
                        Expanded(
                          child: Draggable(
                            data: mb.getAnswer(),
                            feedback: Container(
                              margin: EdgeInsets.all(20),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                              ),
                              width: 300,
                              height: 260,
                              child: Padding(
                                padding: const EdgeInsets.all(18.0),
                                child: Image.asset(
                                  'matchingitems/' + mb.getImage(),
                                  fit: BoxFit.scaleDown,
                                ),
                              ),
                            ),
                            child: Container(
                              margin: EdgeInsets.all(20),
                              decoration: BoxDecoration(
                                color: Color(0xFFFFF2AF),
                                borderRadius: BorderRadius.circular(30),
                              ),
                              width: 300,
                              child: Padding(
                                padding: const EdgeInsets.all(18.0),
                                child: Opacity(
                                  opacity: show,
                                  child: Image.asset(
                                    'matchingitems/' + mb.getImage(),
                                    fit: BoxFit.scaleDown,
                                  ),
                                ),
                              ),
                            ),
                            childWhenDragging: Container(
                              margin: EdgeInsets.all(20),
                              decoration: BoxDecoration(
                                color: Color(0xFFFFF2AF),
                                borderRadius: BorderRadius.circular(30),
                              ),
                              width: 300,
                            ),
                            onDragCompleted: () {
                              checkAnswer();
                            },
                          ),
                        ),
                        Expanded(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Expanded(
                                child: DragTarget(
                                  builder: (BuildContext context,
                                      List<Object?> candidateData,
                                      List<dynamic> rejectedData) {
                                    return Card(
                                      margin:
                                          EdgeInsets.fromLTRB(5, 30, 10, 30),
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(30),
                                          side: BorderSide(
                                            color: Colors.grey.withOpacity(0.2),
                                            width: 2,
                                          )),
                                      color: Color(0xFFFFF2AF),
                                      child: SizedBox(
                                        height: double.infinity,
                                        child: Center(
                                          child: Text(
                                            mb.getChoice1(),
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 35,
                                            ),
                                            textAlign: TextAlign.center,
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                  onWillAccept: (data) {
                                    return true;
                                  },
                                  onAccept: (data) {
                                    // if (data == mb.getChoice1()) {
                                    //   print("Corret");
                                    // } else {
                                    //   print("incorrect");
                                    // }
                                    setState(() {
                                      isCorrect = (data == mb.getChoice1())
                                          ? 'correct.png'
                                          : 'incorrect.png';
                                      totalCorrectAns =
                                          (data == mb.getChoice1())
                                              ? totalCorrectAns + 1
                                              : totalCorrectAns;
                                      message = (data == mb.getChoice1())
                                          ? "Great Job!"
                                          : "Oops! Try again!";
                                      show = 0;
                                    });
                                  },
                                ),
                              ),
                              Expanded(
                                child: DragTarget(
                                  builder: (BuildContext context,
                                      List<Object?> candidateData,
                                      List<dynamic> rejectedData) {
                                    return Card(
                                      margin:
                                          EdgeInsets.fromLTRB(10, 30, 5, 30),
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(30),
                                          side: BorderSide(
                                            color: Colors.grey.withOpacity(0.2),
                                            width: 2,
                                          )),
                                      color: Color(0xFFFFF2AF),
                                      child: SizedBox(
                                        height: double.infinity,
                                        child: Center(
                                          child: Text(
                                            mb.getChoice2(),
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 35,
                                            ),
                                            textAlign: TextAlign.center,
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                  onWillAccept: (data) {
                                    return true;
                                  },
                                  onAccept: (data) {
                                    setState(() {
                                      isCorrect = (data == mb.getChoice2())
                                          ? 'correct.png'
                                          : 'incorrect.png';
                                      totalCorrectAns =
                                          (data == mb.getChoice2())
                                              ? totalCorrectAns + 1
                                              : totalCorrectAns;
                                      message = (data == mb.getChoice2())
                                          ? "Great Job!"
                                          : "Oops! Try again!";
                                      show = 0;
                                    });
                                  },
                                ),
                              ),
                            ],
                          ),
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

/*
Container(
                              margin: EdgeInsets.all(20),
                              decoration: BoxDecoration(
                                color: Colors.yellow,
                                borderRadius: BorderRadius.circular(30),
                              ),
                              child: Image.network(
                                'https://www.freepnglogos.com/uploads/table-png/download-wooden-table-png-image-0.png',

                                //height: 250,
                              ),
                            ),
 */
