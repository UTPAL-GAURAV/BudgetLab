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

  /// API to get country flag from country code.
  /// TODO: Make this work
  Future<String> getCountryFlag(String countryCode) async {
    final response = await http.get(Uri.parse('https://www.countryflags.io/$countryCode/flat/64.png'));
    if (response.statusCode == 200) {
      Map<String, dynamic> data = json.decode(response.body);
      return "";
    } else {
      return "";
    }
  }
}