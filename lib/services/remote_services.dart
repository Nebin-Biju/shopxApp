import 'package:http/http.dart' as http;
import 'package:shopxapp/model/model.dart';
class RemoteServices{
  static var client = http.Client();
  
  static Future<List<ProductsModel>?> fetchProducts() async {
    var response = await client.get(Uri.parse('https://fakestoreapi.com/products'));
    if(response.statusCode==200){
      var jsonString  = response.body;
      return productsModelFromJson(jsonString);
    }else{
      return null;
    }
  }
}