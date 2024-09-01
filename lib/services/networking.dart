import 'dart:convert';
import 'package:http/http.dart' as http;

class NetworkHelper {
  NetworkHelper({required this.uri});
  Uri uri;

  Future getData() async {
    http.Response response = await http.get(uri);

    if (response.statusCode == 200) {
      var data = response.body;

      return jsonDecode(data);
    }
  }
}
