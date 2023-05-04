import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:quizzapp2/Backend/Database.dart';
import 'package:quizzapp2/Models/UserEnAttente.dart';
import 'package:quizzapp2/WaitingScreen.dart';
import 'package:quizzapp2/category.dart';

class UserRegistration extends StatefulWidget {
  const UserRegistration({Key? key}) : super(key: key);

  @override
  _UserRegistrationState createState() => _UserRegistrationState();
}

class _UserRegistrationState extends State<UserRegistration> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _quizController = TextEditingController();
  final DatabaseService databaseService = DatabaseService();
  void pushNavToDash({required BuildContext context}) {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => WaitingS()));
  }

  @override
  void dispose() {
    _nameController.dispose();
    _quizController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Quiz App'),
      ),
      body: Form(
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              controller: _nameController,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your name';
                }
                return null;
              },
              decoration: InputDecoration(
                labelText: 'Your Name',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16),
            TextFormField(
              controller: _quizController,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter the quiz name';
                }
                return null;
              },
              decoration: InputDecoration(
                labelText: 'Quiz Name',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 32),
            ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  // TODO: Handle form submission
                  UserEnAttente userEnAttente = UserEnAttente(
                    name: _nameController.text,
                    quizName: _quizController.text,
                  );

                  databaseService.addUsersEnAttenteToDb(userEnAttente)
                    ..then((value) => value
                        ? pushNavToDash(context: context)
                        : print("FAIL"));
                } else {
                  print("not Validated"); // there was an error adding the data
                }
              },
              child: Text('Start Quiz'),
            ),
          ],
        ),
      ),
    );
  }
}
