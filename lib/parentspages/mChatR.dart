import 'package:ausome_fap/parentspages/parentsHomePage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ausome_fap/parentspages/m_chat_r_model/test_brain.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

void main() => runApp(MCR());

class MCR extends StatefulWidget {
  @override
  _MCRState createState() => _MCRState();
}

class _MCRState extends State<MCR> {
  TestBrain tb = TestBrain();
  bool hideTest = true;
  int totalRiskResponse = 0;

  var alertStyle = AlertStyle(
    animationType: AnimationType.fromTop,
    isCloseButton: false,
    isOverlayTapDismiss: false,
    descStyle: TextStyle(fontWeight: FontWeight.w300),
    descTextAlign: TextAlign.justify,
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

  void checkAnswer(bool userPickedAnswer) {
    bool ASDRisk = tb.getASDRisk();
    setState(() {
      if (tb.isFinished()) {
        Alert(
          style: alertStyle,
          context: context,
          title: tb.getRisk(totalRiskResponse).toUpperCase(),
          desc: "MCHAT-R risk score: $totalRiskResponse\n" +
              tb.getInterpretation(totalRiskResponse),
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
                    MaterialPageRoute(builder: (context) => ParentsHomePage()));
              },
              width: 150,
              color: Color(0xFF51B59F),
              radius: BorderRadius.circular(50),
            )
          ],
        ).show();
      } else {
        if (userPickedAnswer == ASDRisk) {
          totalRiskResponse++;
        }
        tb.nextQuestion();
      }
    });
  }

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
                    color: Color(0xFFFFF2AF),
                    borderRadius: BorderRadius.circular(10.0),
                    //margin: const EdgeInsets.all(10.0),
                  ),
                  // alignment: Alignment.topCenter,
                  child: Column(
                    //mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        flex: 1,
                        child: Padding(
                          padding: const EdgeInsets.only(top: 15),
                          child: Text(
                            'M-CHAT-R',
                            style: TextStyle(
                              fontSize: 40.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 6,
                        child: Container(
                          decoration: BoxDecoration(
                            color: Color(0xFFFFC887),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          padding: EdgeInsets.all(10),
                          // margin: EdgeInsets.symmetric(
                          //     horizontal: 0.0, vertical: 0.0),
                          margin: EdgeInsets.only(top: 15),
                          child: Center(
                            child: Visibility(
                              visible: hideTest,
                              child: AutoSizeText(
                                'The Modified Checklist for Autism in Toddlers, Revised (M-CHAT-R) is a screener that will ask a series of 20'
                                ' questions about your child’s behavior. It\'s intended for toddlers between 16 and 30 months of age. The results'
                                ' will let you know if a further evaluation may be needed. You can use the results of the screener to discuss any concerns that you may'
                                ' have with your child’s healthcare provider.',
                                textAlign: TextAlign.justify,
                                style: TextStyle(
                                  fontSize: 23,
                                ),
                              ),
                              replacement: AutoSizeText(
                                (tb.getQuestionNumer() + 1).toString() +
                                    '. ' +
                                    tb.getQuestionText(),
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                  fontSize: 25,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: Visibility(
                          visible: hideTest,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 27.0),
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                primary: Color(0xFF5CE1E6),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(50),
                                ),
                                fixedSize: const Size(180, 0),
                              ),
                              onPressed: () {
                                setState(() {
                                  hideTest = false;
                                });
                              },
                              child: Text(
                                'BEGIN',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 35,
                                ),
                              ),
                            ),
                          ),
                          replacement: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  primary: Color(0xFF5CE1E6),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(50),
                                  ),
                                  fixedSize: const Size(130, 60),
                                ),
                                onPressed: () {
                                  checkAnswer(true);
                                },
                                child: Text(
                                  'YES',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 35,
                                  ),
                                ),
                              ),
                              ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  primary: Color(0xFF5CE1E6),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(50),
                                  ),
                                  fixedSize: const Size(130, 60),
                                ),
                                onPressed: () {
                                  checkAnswer(false);
                                },
                                child: Text(
                                  'NO',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 35,
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
