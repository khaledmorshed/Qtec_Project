import 'dart:convert';

import 'package:http/http.dart';

import '../model/product_model.dart';

class DbHelper{
  static Future<ProductModel> getData() async{
    final url = 'https://panel.supplyline.network/api/product/search-suggestions/?limit=10&offset=10&search=rice';
    try{
      final  response = await get(Uri.parse(url));
      final map = json.decode(utf8.decode(response.bodyBytes));
      if(response.statusCode == 200){
         return ProductModel.fromJson(map);
      }else{
        return ProductModel.fromJson(map);
      }
      //return null;
    }catch(error){
      throw error;
    }
  }
}