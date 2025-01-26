import 'dart:convert';
import 'package:http/http.dart' as http;


 datarertrieval() async{
  final response = await http.get(Uri.parse('https://api.jsonserve.com/Uw5CrX'));
  if(response.statusCode==200){
    final data = jsonDecode(response.body) as Map<String, dynamic>;
    return data['questions'];
  }
}