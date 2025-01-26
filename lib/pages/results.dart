import 'package:flutter/material.dart';
import 'package:testyourknowldge/pages/home.dart';
import 'package:testyourknowldge/pages/questions.dart';

class Results extends StatefulWidget {
  const Results({
    super.key,
    required this.sequence,
  });
  final List sequence;

  @override
  State<StatefulWidget> createState() {
    return _ResultsState();
  }
}

class _ResultsState extends State<Results> {
  String correctans(options) {
    String ans = 'None';
    for (var option in options) {
      if (option['is_correct']) {
        ans = option['description'];
      }
    }
    return ans;
  }

  int count = 0;
  int correct = 0;
  int unattempted = 0;

  void Marks_calc() {
    for (var i = 0; i < widget.sequence.length; i++) {
      final questionIndex = widget.sequence[i];
      final question = questions?[questionIndex];
      final selectedAnswerIndex = selectedans[i];

      if (selectedAnswerIndex != -1) {
        final selectedOption = question['options'][selectedAnswerIndex];

        if (selectedOption['is_correct']) {
          count += 4;
          correct++;
        } else {
          count -= 1;
        }
      } else {
        unattempted++;
      }
    }

    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    Marks_calc();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.purple,
        title: Row(
          children: [
            Text(
              "Results",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            Expanded(child: SizedBox()),
            ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: Colors.orange),
              onPressed: () {
                sequence = [];
                selectedans = List.filled(10, -1);
                questions = null;
                Navigator.pushReplacement(
                    context, MaterialPageRoute(builder: (context) => Homepage()));
              },
              child: Text(
                'Home',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            )
          ],
        ),
      ),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(16.0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 3,
                  blurRadius: 5,
                  offset: Offset(0, 3),
                ),
              ],
            ),
            margin: EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Total Marks: $count',
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  'Correct Answers: $correct',
                  style: TextStyle(fontSize: 18, color: Colors.green),
                ),
                Text(
                  'Unattempted: $unattempted',
                  style: TextStyle(fontSize: 18, color: Colors.orange),
                ),
              ],
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: widget.sequence.length,
                itemBuilder: (context, index) {
                  final questionIndex = widget.sequence[index];
                  final question = questions?[questionIndex];
                  final answer = correctans(question['options']);
                  final selectedAnswerIndex = selectedans[index];

                  String selectedAnswer = 'No answer selected';
                  if (selectedAnswerIndex != -1 &&
                      selectedAnswerIndex < question['options'].length) {
                    selectedAnswer = question['options'][selectedAnswerIndex]
                    ['description'];
                  }

                  return Card(
                    margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    color: selectedAnswerIndex != -1 &&
                        question['options'][selectedAnswerIndex]
                        ['is_correct']
                        ? Colors.lightGreen
                        : Colors.redAccent,
                    child: ListTile(
                      title: Text(
                        'Q${index + 1}  ${question['description']}',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 8),
                          Text(
                            "Correct Answer: $answer",
                            style:
                            TextStyle(fontSize: 16, color: Colors.black54),
                          ),
                          SizedBox(height: 4),
                          Text(
                            "Your Answer: $selectedAnswer",
                            style:
                            TextStyle(fontSize: 16, color: Colors.black54),
                          ),
                        ],
                      ),
                      onTap: () {
                        showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              scrollable: true,
                              title: Text(
                                'Detailed Solution',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 20),
                              ),
                              content: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    question['detailed_solution'],
                                    style: TextStyle(fontSize: 16),
                                  ),
                                  SizedBox(height: 16),
                                  Center(
                                    child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                          backgroundColor: Colors.purple),
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      child: Text(
                                        'OK',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                        );
                      },
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
