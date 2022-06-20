import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qtech_project/global/color_management.dart';
import 'package:qtech_project/widgets/product_item_widget.dart';
import '../global/constant_variable.dart';
import '../provider/product_provider.dart';
int customOffset = 0;
class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  late ProductProvider _productProvider;
  final _formKey = GlobalKey<FormState>();
  final searchController = TextEditingController();
  //final RefreshController refreshController = RefreshController(initialRefresh: false);
  bool _isInit = true;
  String holdSearchText = '';

  @override
  void didChangeDependencies() async{
    if (_isInit){
      _productProvider = Provider.of<ProductProvider>(context);
      _productProvider.result.clear();
      customOffset = 0;
       await _productProvider.getData('rice', 0);
      _isInit = false;
    }
  }

  @override
  Widget build(BuildContext context) {

    final heighM = MediaQuery.of(context).size.height;
    final widthM = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: ColorManager.lightPink,
      body:
      CustomScrollView(
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
                      child: TextFormField(
                        key: _formKey,
                        onChanged: (value){
                          if(value == ''){
                            _productProvider.result.clear();
                            customOffset = 0;
                            _productProvider.getData('rice', 0);
                          }
                        },
                        controller: searchController,
                        decoration:  InputDecoration(
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
                            child: IconButton(
                              onPressed: ()async{
                                _formKey.currentState?.save();
                                if(searchController.text.trim() != ''){
                                  _productProvider.result.clear();
                                  customOffset = 0;
                                  _productProvider.getData(searchController.text.trim(), 0);
                                }
                                if(searchController.text.trim() == ''){
                                  _productProvider.result.clear();
                                  customOffset = 0;
                                  _productProvider.getData('rice', 0);
                                }

                              }, icon: Icon(
                              Icons.search,
                            ),
                            ),
                          ),
                          filled: true,
                          fillColor: Colors.white,
                          hintText: "    search products",
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
              crossAxisSpacing: 8,
               childAspectRatio: (3/4),
            ),

            delegate: SliverChildBuilderDelegate((context, index) {
              //for pagination condition
              if(_productProvider.result.length == index+1 && customOffset < countLeng! ){
                customOffset = customOffset + 10;
                _productProvider.getData('rice', customOffset);
              }
              return  _productProvider.result.length != null ?
             ProductItemWidget(_productProvider.result[index], index):
                Center(child: CircularProgressIndicator(),);
              },
              childCount: _productProvider.result.length,
            ),
          ),
      ],
      ),
    );
  }
}
