import 'package:http/http.dart' as http;


class CategoryApi {
  static Future<http.Response> getCategories() async {
    Uri url = Uri.parse('http://10.0.2.2:3000/categories');
    return await http.get(url);
  }
}