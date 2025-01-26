import 'package:testyourknowldge/data/data.dart';

questionformat() async{
  final List questions= await datarertrieval();
  for (var i= 0 ; i< questions.length ; i++){
    questions[i]['isvisited']= false;
  }

  return  questions;
}