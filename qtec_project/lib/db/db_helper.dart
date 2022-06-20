import 'dart:convert';

import 'package:http/http.dart';


import '../model/product_model.dart';
class DbHelper{

  static Future<ProductModel> getData([String fetchingData = 'rice', int customOffset = 0]) async{
    final url = 'https://panel.supplyline.network/api/product/search-suggestions/?limit=10&offset=$customOffset&search=$fetchingData';
    try{
      final  response = await get(Uri.parse(url));
      final map = json.decode(utf8.decode(response.bodyBytes));
      if(response.statusCode == 200){
        final productModel = ProductModel.fromJson(map);
        return productModel;
      }else{
        return ProductModel.fromJson(map);
      }
      //return null;
    }catch(error){
      throw error;
    }
  }
}