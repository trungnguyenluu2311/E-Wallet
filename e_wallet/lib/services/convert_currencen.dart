import 'package:http/http.dart' as http;
import 'dart:convert';

class ConvertRepo{
  static final ConvertRepo _convertRepo = ConvertRepo._internal();

  factory ConvertRepo(){
    return _convertRepo;
  }

  ConvertRepo._internal();

  Future<double> convert({required String fromCurr, required String toCurr, required double value}) async{
    final response = await http.get(
        'https://free.currconv.com/api/v7/convert?q=${fromCurr}_${toCurr}&compact=ultra&apiKey=6fbb855fe3e53b9762e2'
    );
    if(response.statusCode==200){
      Map<String,dynamic> jsonResponse = json.decode(response.body);

      final rate = jsonResponse['${fromCurr}_${toCurr}'].toDouble();
      return rate*value;
    }else {
      throw Exception('Fail to load result');
    }
  }
}