import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:testyourknowldge/models/quests.dart';
import 'package:testyourknowldge/pages/results.dart';
import 'package:testyourknowldge/widget/question.dart';

class Questions extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _QuestionsState();
  }
}

List<dynamic>? questions;
List<int> selectedans = List.filled(10, -1);
List sequence = [];

class _QuestionsState extends State<Questions> {
  bool isLoading = true;
  late Widget Content;
  Random random = Random();
  int index = 0;
  String btn_text = 'Next';
  Widget prevbtn = SizedBox.shrink();

  void update(val) {
    selectedans[index] = val;
  }

  void populate_seq() {
    var temp;
    for (var i = 0; i < 10; i++) {
      do {
        temp = random.nextInt(10);
      } while (sequence.contains(temp));
      sequence.add(temp);
    }
  }

  void submit() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Submit Test?'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('Are you sure you want to submit the test?'),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Results(sequence: sequence),
                        ),
                      );
                    },
                    child: Text('Submit'),
                  ),
                  OutlinedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text('Cancel'),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  void next() {
    if (index < 9) {
      index++;
      setState(() {
        Content = Question(
          data: questions?[sequence[index]],
          index: index,
          selected_ans: selectedans[index],
        );
      });
    } else {
      submit();
    }
  }

  void prev() {
    if (index > 0) {
      index--;
      setState(() {
        Content = Question(
          data: questions?[sequence[index]],
          index: index,
          selected_ans: selectedans[index],
        );
      });
    }
  }

  Future<void> populate_question() async {
    populate_seq();
    try {
      questions = await questionformat();
      setState(() {
        isLoading = false;
        Content = Question(
          data: questions?[sequence[0]],
          index: index,
          selected_ans: selectedans[index],
        );
      });
    } catch (e) {
      print('Error: $e');
      setState(() {
        isLoading = false;
        Content = Center(
          child: Text(
            'An error occurred. Please check your internet connection and restart.',
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.red, fontSize: 16),
          ),
        );
      });
    }
  }

  @override
  void initState() {
    super.initState();
    populate_question();
  }

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return Scaffold(
        backgroundColor: Colors.purple,
        body: Center(
          child: CircularProgressIndicator(
            color: Colors.white,
          ),
        ),
      );
    }
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        automaticallyImplyLeading: false,
        title: Row(
          children: [
            Icon(Icons.timer, color: Colors.white),
            SizedBox(width: 8),
            Text(
              "Time Remaining",
              style: TextStyle(fontSize: 18, color: Colors.white),
            ),
            Spacer(),
            ElevatedButton(
              onPressed: () {
                submit();
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: Text('Submit'),
            )
          ],
        ),
      ),
      backgroundColor: Colors.purple,
      body: Column(
        children: [
          Expanded(
            flex: 1,
            child: Center(
              child: Text(
                "Question ${index + 1} of 10",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Expanded(
            flex: 6,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 8,
                      offset: Offset(0, 4),
                    )
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Content,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  onPressed: index > 0 ? prev : null,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: index > 0 ? Colors.white : Colors.grey,
                    foregroundColor: Colors.purple,
                  ),
                  child: Text('Previous'),
                ),
                ElevatedButton(
                  onPressed: next,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    foregroundColor: Colors.purple,
                  ),
                  child: Text(index < 9 ? 'Next' : 'Submit'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
