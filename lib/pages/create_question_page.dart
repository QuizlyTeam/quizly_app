import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../widgets/header.dart';

class Question{
  late String question;
  late String correctAnswer;
  late List<String> incorrectAnswers;
  
  Question({
    required this.question,
    required this.correctAnswer,
    required this.incorrectAnswers
  });
}

class CreateQuestionForm extends StatefulWidget {
  const CreateQuestionForm({Key? key}) : super(key: key);

  @override
  State<CreateQuestionForm> createState() => _CreateQuestionForm();
}

class _CreateQuestionForm extends State<CreateQuestionForm> {
  String question = "";
  String correctAnswer = "";
  List<String> incorrectAnswers = ['','',''];

  @override
  Widget build(BuildContext context) {
    double x = MediaQuery.of(context).size.width / 411.42857142857144;
    double y = MediaQuery.of(context).size.height / 866.2857142857143;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.cyan,
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 20 * x, horizontal: 50 * y),
        child: Column(children: [
          SizedBox(
            height: 20 * y,
          ),
          TextFormField(
            decoration: InputDecoration(
                hintText: "Question",
                enabledBorder: UnderlineInputBorder(
                    borderSide:
                    BorderSide(width: 3, color: Colors.grey.shade500))),
            onChanged: (val) {
              setState(() {
                question = val;
              });
            },
          ),
          SizedBox(
            height: 20 * y,
          ),
          TextFormField(
            decoration: InputDecoration(
                hintText: "correctAnswer",
                enabledBorder: UnderlineInputBorder(
                    borderSide:
                    BorderSide(width: 3, color: Colors.grey.shade500))),
            onChanged: (val) {
              setState(() {
                correctAnswer = val;
              });
            },
          ),
          SizedBox(
            height: 20 * y,
          ),
          TextFormField(
            decoration: InputDecoration(
                hintText: "incorrectAnswer 1",
                enabledBorder: UnderlineInputBorder(
                    borderSide:
                    BorderSide(width: 3, color: Colors.grey.shade500))),
            onChanged: (val) {
              setState(() {
                incorrectAnswers[0] = val;
              });
            },
          ),
          SizedBox(
            height: 20 * y,
          ),
          TextFormField(
            decoration: InputDecoration(
                hintText: "incorrectAnswer 2",
                enabledBorder: UnderlineInputBorder(
                    borderSide:
                    BorderSide(width: 3, color: Colors.grey.shade500))),
            onChanged: (val) {
              setState(() {
                incorrectAnswers[1] = val;
              });
            },
          ),
          SizedBox(
            height: 20 * y,
          ),
          TextFormField(
            decoration: InputDecoration(
                hintText: "incorrectAnswer 3",
                enabledBorder: UnderlineInputBorder(
                    borderSide:
                    BorderSide(width: 3, color: Colors.grey.shade500))),
            onChanged: (val) {
              setState(() {
                incorrectAnswers[2] = val;
              });
            },
          ),
          ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: Colors.cyan),
              onPressed: () {
                Get.back(result: Question(question: question, correctAnswer: correctAnswer, incorrectAnswers: incorrectAnswers));
              },
              child: const Text(
                "Confirm",
                style: TextStyle(color: Colors.white),
              ))
        ]),
      ),
    );
  }
}