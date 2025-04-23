import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;

class SearchService {
  static const url = "https://nominatim.openstreetmap.org";

  List resultSearch = [];

  Future searchAddress(String address) async {
    String formatAddress = address.replaceAll(' ', '+');

    var result = await http.get(Uri.parse('$url/search?q=$formatAddress&format=json&limit=15'));

    if (result.statusCode == 200) {
      resultSearch = json.decode(result.body);
      log(resultSearch.toString());
      return resultSearch;
    }
  }
}
