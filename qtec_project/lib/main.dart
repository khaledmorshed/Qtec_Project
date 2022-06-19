
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qtech_project/provider/product_provider.dart';

import 'screens/home_screen.dart';
import 'screens/product_details_screen.dart';
import 'widgets/product_item_widget.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) => ProductProvider(),),
    ],
      child: MyApp(),
  ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Qtec Project',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomeScreen(),
      // routes: {
      //   ProductDetailsScreen.path: (context) => ProductDetailsScreen(),
      // },
    );
  }
}
