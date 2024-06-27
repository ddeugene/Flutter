import 'package:dio/dio.dart';

class ApiConnect{
  Future<void> getCharactersList() async{
    final response = await Dio().get('https://rickandmortyapi.com/api/character');
    print(response.toString());
  }
}