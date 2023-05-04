import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'classes.dart';

class ArtsPage extends StatefulWidget {
  @override
  _ArtsPageState createState() => _ArtsPageState();
}

class _ArtsPageState extends State<ArtsPage> {
  var counter = 0;
  bool isButtonPressed = false;
  List qList = [
    ArtsQuestions("1.Arts serve us for pleasure only.", false),
    ArtsQuestions(
        "2. A “giant” of the arts does not influence contemporary artists.",
        false),
    ArtsQuestions(
        "3. Michelangelo's painting The Last Judgment depicts Adam and Eve being expelled from the garden of Eden by an angel holding a sword.",
        false),
    ArtsQuestions(
        "4. Michelangelo was an Italian Renaissance artist who was so talented that he was given the nickname Il Divino.",
        true),
    ArtsQuestions(
        "5. Symbols are visual images or even colors within a work of art that viewers may recognize and associate with specific meanings",
        true),
  ];

  var score = 0;
  String? CountAnswers(int totalScore) {
    switch (totalScore) {
      case 5:
        return "An answer is correct";
      case 10:
        return "2 correct answers";
      case 15:
        return "3 correct answers";
      case 20:
        return "4 correct answers";
      case 25:
        return "5 correct answers";

      default:
        print("an unexpected answer");
    }
  }

  checkWin(bool userChoice, BuildContext context) {
    if (userChoice == qList[counter].isCorrect) {
      print("correct");

      score = score + 5;
      final snackbar = SnackBar(
        duration: Duration(milliseconds: 500),
        backgroundColor: Colors.green,
        content: Text("Correct!"),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackbar);
    } else {
      print("false");
      score = score + 0;
      final snackbar = SnackBar(
        duration: Duration(milliseconds: 500),
        backgroundColor: Colors.red,
        content: Text("Incorrect!"),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackbar);
    }
    setState(() {
      if (counter < 4) {
        counter = counter + 1;
      }
    });
  }

  reset() {
    setState(() {
      counter = 0;
      score = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        title: Text(
          'Quiz',
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      backgroundColor: Colors.white,
      body: Builder(
        builder: (BuildContext context) => Container(
          padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Expanded(
                flex: 4,
                child: AnimatedSwitcher(
                  duration: Duration(milliseconds: 800),
                  child: Container(
                    key: ValueKey(qList[counter]),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12.0),
                      border:
                          Border.all(color: Color.fromARGB(255, 54, 33, 243)),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          qList[counter].qText,
                          textAlign: TextAlign.center,
                          style: GoogleFonts.montserrat(
                            fontWeight: FontWeight.bold,
                            fontSize: 24,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: 24.0),
              Expanded(
                flex: 2,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12.0),
                    border: Border.all(color: Color.fromARGB(255, 54, 33, 243)),
                  ),
                  child: Center(
                    child: FittedBox(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Score: $score / 25",
                            style: TextStyle(
                              color: Colors.deepPurple,
                              fontSize: 24.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            CountAnswers(score) ?? "0 answers",
                            style: TextStyle(
                              color: Colors.deepPurple,
                              fontSize: 24.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      //
                    ),
                  ),
                ),
              ),
              SizedBox(height: 24.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Expanded(
                    child: AnimatedOpacity(
                      opacity: isButtonPressed ? 0.2 : 1.0,
                      duration: Duration(milliseconds: 500),
                      child: ElevatedButton(
                        onPressed: isButtonPressed
                            ? null
                            : () => checkWin(true, context),
                        child: Ink(
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                Colors.deepPurple,
                                Colors.indigo.shade500,
                                Colors.deepPurple,
                              ],
                              begin: Alignment.centerLeft,
                              end: Alignment.centerRight,
                            ),
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          child: Container(
                            constraints: BoxConstraints(
                                maxWidth: 300.0, minHeight: 50.0),
                            alignment: Alignment.center,
                            child: Text(
                              "TRUE",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 16.0),
                  Expanded(
                    child: AnimatedOpacity(
                      opacity: isButtonPressed ? 0.2 : 1.0,
                      duration: Duration(milliseconds: 500),
                      child: ElevatedButton(
                        onPressed: isButtonPressed
                            ? null
                            : () => checkWin(false, context),
                        child: Ink(
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                Colors.deepPurple,
                                Colors.indigo.shade500,
                                Colors.deepPurple,
                              ],
                              begin: Alignment.centerLeft,
                              end: Alignment.centerRight,
                            ),
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          child: Container(
                            constraints: BoxConstraints(
                                maxWidth: 300.0, minHeight: 50.0),
                            alignment: Alignment.center,
                            child: Text(
                              "FALSE",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 25.0),
            ],
          ),
        ),
      ),
    );
  }
}
