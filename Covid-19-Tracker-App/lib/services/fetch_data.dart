import 'dart:async';
import 'dart:convert';

import 'package:covid_tracker/models/world_state_model.dart';
import 'package:covid_tracker/services/app_url.dart';
import 'package:http/http.dart' as http;

class FetchData{

  Future<WorldStateModel> fetchWorldState() async{
    final response = await http.get(Uri.parse(AppUrl.worldStateApi));
    if(response.statusCode == 200){
      final data = jsonDecode(response.body);
      // print('Status: ${response.statusCode}');
      return WorldStateModel.fromJson(data);
    } else{
      throw Exception('Error.!');
    }
  }

  Future<List<dynamic>> fetchCountriesList() async{
    final response = await http.get(Uri.parse(AppUrl.countriesList));
    if(response.statusCode == 200){
      final data = jsonDecode(response.body);
      // print('Status: ${response.statusCode}');
      return data;
    } else{
      throw Exception('Error.!');
    }
  }
}