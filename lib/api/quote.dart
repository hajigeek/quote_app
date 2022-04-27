import 'dart:convert';

import 'package:http/http.dart';

class Quotes {
  List<String> text;
  List<String> author;
  List data;

  Future<void> getQuotes() async {
    Response response = await get(Uri.parse('https://type.fit/api/quotes'));
    //converting data to json
    data = jsonDecode(response.body);
  }

  List ReadQuotes() {
    return data;
  }
}
