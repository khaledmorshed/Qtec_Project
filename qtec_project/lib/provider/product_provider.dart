import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:qtech_project/db/db_helper.dart';
import 'package:qtech_project/model/product_model.dart';
import '../global/constant_variable.dart';

class ProductProvider with ChangeNotifier{
  ProductModel? _productModel;
  List<Result> _result2 = [];
  ProductModel? get productModel => _productModel;
  List<Result> get result => _result2;
  Future<void> getData([String fetchingData = 'rice', int customOffset = 0, bool isRefresh = false]) async{
     List<Result> _result1 = [];
    _productModel = await DbHelper.getData(fetchingData, customOffset).then((value){
      _result1 = List.generate(value.data!.products!.results!.length, (index) => Result.fromJson(value.data!.products!.results![index].toJson()));
       _result2.addAll(_result1);
      countLeng = value.data!.products!.count;
      notifyListeners();
    });
  }
}