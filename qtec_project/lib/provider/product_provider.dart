import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:qtech_project/model/product_model.dart';

class ProductProvider with ChangeNotifier{
 ProductModel? productModel;
  void getCurrentWeatherData() async{
    final url = 'https://panel.supplyline.network/api/product/search-suggestions/?limit=10&offset=10&search=rice';
    try{
      final  response = await get(Uri.parse(url));
      if(response.statusCode == 200){
        //so we have convert the json value into map
        final map = json.decode(response.body);
        productModel = ProductModel.fromJson(map);
        //print("1 +${map}+ AAAAAAAAAAAAAAAAAAAaAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAaa");
        //print("Currrent data : ${productModel!.data}");
        notifyListeners();
      }
    }catch(error){
      throw error;
    }
  }
}