import "package:flutter/material.dart";
import "package:testyourknowldge/pages/questions.dart";

class Question extends StatefulWidget {
  const Question({
    super.key,
    required this.data,
    required this.index,
    required this.selected_ans
    });
  final index;
  final data;
  final selected_ans;
  @override
  State<StatefulWidget> createState() {
    return _QuestionState();
  }
}



class _QuestionState extends State<Question>{
  int selected = -1;

  @override
  void initState() {
    super.initState();
    selected = widget.selected_ans;
  }

  @override
  void didUpdateWidget(covariant Question oldWidget) {
    super.didUpdateWidget(oldWidget);
    setState(() {
      selected = widget.selected_ans;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: EdgeInsets.all(8),
        margin: EdgeInsets.symmetric(horizontal: 4),
        child: Column(
          children: [
            Text(widget.data['description'],
            style: TextStyle(
              fontSize: 20
            ),),
            Container(
              alignment: Alignment.centerRight,
              child: Text('+4 \t -1',style:
                TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey
                ),),
            ),
            SizedBox(
              height: 20,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: WidgetStateProperty.all<Color>(
                    selected == 0 ? Colors.purpleAccent : Colors.white,
                  ),
                  foregroundColor: WidgetStateProperty.all<Color>(
                    selected == 0 ? Colors.white : Colors.black,
                  ),
                ),onPressed: (){
                  selectedans[widget.index]= 0;

                  setState(() {
                    selected= 0;
                  });
                }, child: Text(widget.data['options'][0]['description'])),
                ElevatedButton(style: ButtonStyle(
                  backgroundColor: WidgetStateProperty.all<Color>(
                    selected == 1 ? Colors.purpleAccent : Colors.white,
                  ),
                  foregroundColor: WidgetStateProperty.all<Color>(
                    selected == 1 ? Colors.white : Colors.black,
                  ),
                ),onPressed: (){
                  selectedans[widget.index]= 1;

                  setState(() {
                    selected= 1;
                  });
                },child: Text(widget.data['options'][1]['description'])),
                ElevatedButton(style: ButtonStyle(
                  backgroundColor: WidgetStateProperty.all<Color>(
                    selected == 2 ? Colors.purpleAccent : Colors.white,
                  ),
                  foregroundColor: WidgetStateProperty.all<Color>(
                    selected == 2 ? Colors.white : Colors.black,
                  ),
                ),onPressed: (){
                  selectedans[widget.index]= 2;

                  setState(() {
                    selected= 2;
                  });
                },child: Text(widget.data['options'][2]['description'])),
                ElevatedButton(style: ButtonStyle(
                  backgroundColor: WidgetStateProperty.all<Color>(
                    selected == 3 ? Colors.purpleAccent : Colors.white,
                  ),
                  foregroundColor: WidgetStateProperty.all<Color>(
                    selected == 3 ? Colors.white : Colors.black,
                  ),
                ),onPressed: (){
                  selectedans[widget.index]= 3;

                  setState(() {
                    selected= 3;
                  });
                },child: Text(widget.data['options'][3]['description']))

              ],
            )

          ],
        ),
      )
    );
  }
}