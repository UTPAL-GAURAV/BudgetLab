import 'dart:convert';
import 'package:http/http.dart' as http;

import '../enums_manager.dart';

class ExternalApiService {
  /// API to get gender from name.
  Future<Gender> getGenderFromName(String name) async {
    final response = await http.get(Uri.parse('https://api.genderize.io/?name=$name'));
    if (response.statusCode == 200) {
      Map<String, dynamic> data = json.decode(response.body);
      return data['gender'].toString().toLowerCase()=="male"? Gender.male: Gender.female;
    } else {
      return Gender.neutral;
    }
  }
}