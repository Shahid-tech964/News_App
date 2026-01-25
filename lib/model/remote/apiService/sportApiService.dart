import 'package:http/http.dart' as http;

class Sportapiservice {
  Future<http.Response> response() async {
    String url =
       "https://newsapi.org/v2/top-headlines?country=us&category=sports&apiKey=ed5c331151a14883aa53146b3d542d0f";

    final response = await http.get(Uri.parse(url));
    return response;
  }
}
