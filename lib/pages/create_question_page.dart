import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../classes/own_question.dart';

class CreateQuestionForm extends StatefulWidget {
  const CreateQuestionForm({Key? key}) : super(key: key);

  @override
  State<CreateQuestionForm> createState() => _CreateQuestionForm();
}

///This class creates a form used to create a question
class _CreateQuestionForm extends State<CreateQuestionForm> {
  ///Data received from previous page
  var argumentData = Get.arguments;

  ///Initial question data
  String question = "";
  String correctAnswer = "";
  List<String> incorrectAnswers = ['', '', ''];

  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    question = argumentData[0];
    correctAnswer = argumentData[1];
    incorrectAnswers = argumentData[2];
  }

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
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(children: [
              SizedBox(
                height: 20 * y,
              ),
              TextFormField(
                validator: (value) =>
                    RegExp(r'(.|\s)*\S(.|\s)*').hasMatch(value!)
                        ? null
                        : "Enter a valid question",
                initialValue: question,
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
                validator: (value) =>
                    RegExp(r'(.|\s)*\S(.|\s)*').hasMatch(value!)
                        ? null
                        : "Enter a valid answer",
                initialValue: correctAnswer,
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
                validator: (value) =>
                    RegExp(r'(.|\s)*\S(.|\s)*').hasMatch(value!)
                        ? null
                        : "Enter a valid answer",
                initialValue: incorrectAnswers[0],
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
                validator: (value) =>
                    RegExp(r'(.|\s)*\S(.|\s)*').hasMatch(value!)
                        ? null
                        : "Enter a valid answer",
                initialValue: incorrectAnswers[1],
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
                validator: (value) =>
                    RegExp(r'(.|\s)*\S(.|\s)*').hasMatch(value!)
                        ? null
                        : "Enter a valid answer",
                initialValue: incorrectAnswers[2],
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
                    if (_formKey.currentState!.validate()) {
                      Get.back(
                          result: OwnQuestion(
                        question: question,
                        correct_answer: correctAnswer,
                        inCorrectanswers: incorrectAnswers,
                      ));
                    }
                  },
                  child: const Text(
                    "Confirm",
                    style: TextStyle(color: Colors.white),
                  ))
            ]),
          ),
        ),
      ),
    );
  }
}
