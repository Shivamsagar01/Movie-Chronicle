import 'dart:convert';

import 'package:http/http.dart' as http;

import 'api_constants.dart';
class ApiClient {
  final http.Client _client;
  ApiClient (this._client);
  dynamic get(String path,String query) async {
    final response = await _client.get(
      Uri.parse(getPath(path,query)),
      // https://api.themoviedb.org/3/trending/movie/day?api_key=b44def3d1ae57e10273c5eac402b5d92
      headers: {
        'Constant-Type': 'application/json',
      },
    );
    if(response.statusCode==200){
      return json.decode(response.body);
    }else{
      throw Exception(response.reasonPhrase);
    }
  }

  String getPath(String path,String query) {
    if(query!='')
      {
        return '${ApiConstants.BASE_URL}$path?api_key=${ApiConstants.API_KEY}&query=$query';
      }
    return '${ApiConstants.BASE_URL}$path?api_key=${ApiConstants.API_KEY}';
  }
  }
