import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

Future<dynamic> fetchCity() async {
  String url =
      "https://raw.githubusercontent.com/nshntarora/Indian-Cities-JSON/master/cities.json";

  var client = http.Client();
  var response = await client.get(Uri.parse(url));

  if (response.statusCode == 200) {
    return convert.jsonDecode(response.body);
  }

  return null;
}
