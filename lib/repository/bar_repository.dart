import 'package:http/http.dart' as http;

class BarService {
  final baseUrl = "https://jsonplaceholder.typicode.com";
  Future<List<dynamic>> fetchBars() async {
    final respose = await http.get((Uri.parse("$baseUrl/posts")));
    if (respose.statusCode == 200) {
      return ["fetch", "data"];
    } else {
      return ["Data", "not", "fetched"];
    }
  }
}
