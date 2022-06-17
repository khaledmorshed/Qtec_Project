import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qtech_project/global/color_management.dart';
import 'package:qtech_project/widgets/product_item_widget.dart';
import '../provider/product_provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  late ProductProvider _productProvider;
  final searchController = TextEditingController();
  bool _isInit = true;

  @override
  void didChangeDependencies() {
    if (_isInit) {
      _productProvider = Provider.of<ProductProvider>(context);
      _productProvider.getCurrentWeatherData();
      _isInit = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    final heighM = MediaQuery.of(context).size.height;
    final widthM = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: ColorManager.lightPink,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: true,
            floating: true,
            expandedHeight: MediaQuery.of(context).size.height * 0.12,
            title: Transform(
              // you can forcefully translate values left side using Transform
              transform: Matrix4.translationValues(-20.0, 0.0, 0.0),
            ),
            flexibleSpace: FlexibleSpaceBar(
              background: Container(
                color: ColorManager.lightPink,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  //crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    SizedBox(
                      height: 48,
                      width: 343.01,
                      child: TextField(
                        controller: searchController,
                        decoration: const InputDecoration(
                          //isCollapsed: true,
                          //isDense: true,
                          contentPadding:
                          EdgeInsets.only(top: 0, bottom: 0),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(15),
                            ),
                            borderSide: BorderSide.none,
                          ),
                          suffixIcon:  Align(
                            widthFactor: 0.5,
                            //heightFactor: 5.0,
                            child: Icon(
                              Icons.search,
                            ),
                          ),
                          filled: true,
                          fillColor: Colors.white,
                          hintText: "lays",
                          hintStyle: TextStyle(
                            //fontFamily: 'Lexend Deca ',
                            //color: Color(0xFF95A1AC),
                            fontSize: 14,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          const SliverToBoxAdapter(
            child: SizedBox(
              height: 20,
            ),
          ),

          SliverGrid(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 10,
              //crossAxisSpacing: 10,
               childAspectRatio: (3/4),
            ),
            delegate: SliverChildBuilderDelegate((context, index) {
                return  ProductItemWidget();
              },
              childCount: 100,
            ),
          ),
      ],
      ),
    );
  }
}
