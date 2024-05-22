import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:practica_webservices/models/response_api.dart';
class RickmortyDbApi {
  Future <ResponseApi> getTopRated() async{
    final response = await http.get(Uri.parse('https://rickandmortyapi.com/api/character'));
    print("resultado ${response.body}");

    if(response.statusCode == 200){
      return ResponseApi.fromJson(jsonDecode(response.body));
    } else{
      print("status code == ${response.statusCode}");
      throw Exception("Failed to load characters");
    }

  }
}