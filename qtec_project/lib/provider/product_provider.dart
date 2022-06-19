import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:qtech_project/db/db_helper.dart';
import 'package:qtech_project/model/product_model.dart';

class ProductProvider with ChangeNotifier{
  ProductModel? _productModel;

 ProductModel? get productModel => _productModel;
  Future<void> getData() async{
    _productModel = await DbHelper.getData();
    notifyListeners();
  }
}