import 'package:http/http.dart' as http;

class ProductApi{

  //Get all Product
  static Future<http.Response> getProduct() async {
    Uri url = Uri.parse('http://10.0.2.2:3000/products');
    return await http.get(url);
  }

  // GET categoryId 
  static Future<http.Response> getProductsByCategoryId(int categoryId) async {
    Uri url = Uri.parse('http://10.0.2.2:3000/products?categoryId=$categoryId');
    return await http.get(url);
  }
}