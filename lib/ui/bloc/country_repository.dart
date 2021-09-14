import 'dart:collection';
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:practical/main.dart';
import 'package:practical/model/country_model.dart';

class CountryRepository {
  Future<List<CountryModel>> getCountries() async {
    List<CountryModel> counties = [];
    try {
      Response response =
          await dio.get("https://restcountries.eu/rest/v2/all/");

      if (response.statusCode == 200) {
        Map result = HashMap<String, dynamic>();
        result["data"] = response.data;
        print("data-->$result");

        GetCountryResponse res =
            GetCountryResponse.fromJson(jsonEncode(result));

        return res.countries;
      }
    } catch (exception) {
      print("exception-->$exception");
    }

    return [];
  }
}
