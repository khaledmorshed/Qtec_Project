import 'package:flutter/material.dart';
import '../global/color_management.dart';
import '../global/constant_variable.dart';

class ProductItemWidget extends StatefulWidget {
  const ProductItemWidget({Key? key}) : super(key: key);

  @override
  State<ProductItemWidget> createState() => _ProductItemWidgetState();
}

class _ProductItemWidgetState extends State<ProductItemWidget> {

  @override
  Widget build(BuildContext context) {
    final heightThreeSection = MediaQuery.of(context).size.height / 3.57;
    final widthTwoSection = MediaQuery.of(context).size.width / 2;
    //print("width = ${widthTwoSection}  + height = ${widthTwoSection * 0.18}");
    return Container(
      color: ColorManager.lightPink,
      margin: const EdgeInsets.only(left: 10, right: 10),
      child: Stack(
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: Container(
              width: widthTwoSection,
              height: heightThreeSection * 1.05,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                children: [
                  Container(
                    //margin: EdgeInsets.only(top: 10, bottom: 10),
                    width: widthTwoSection,
                    height: widthTwoSection * 0.65,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),

                    child: Stack(
                      children: [
                        Center(child: Image.asset(
                            "assets/images/potato_chips_PNG79 2.png",
                            width: widthTwoSection * 0.46,
                            height: widthTwoSection * 0.46,
                            fit: BoxFit.cover)),
                        Positioned(
                          top: 5,
                          left: widthTwoSection / 2,
                          child: Container(
                            height: widthTwoSection * 0.13,
                            width: widthTwoSection * 0.33,
                            decoration: BoxDecoration(
                              color: ColorManager.stockColor,
                              borderRadius: BorderRadius.circular(5),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 5, right: 5),
                    child: Text("লেস ক্লাসিক ফ্যামিলি সাইজ চিপস্ চিপস্",style: TextStyle(fontSize: 14),),
                  ),
                  SizedBox(height: 6,),
                  buyingSellling(context),
                ],
              ),
            ),
          ),
          Positioned(
            top: widthTwoSection * 1.06,
            left: widthTwoSection * .33,
            child: SizedBox(
              height: 40,
              width: 40,
              child: FloatingActionButton(
                onPressed: () {},
                child: Icon(Icons.add,),
              ),
            ),
          ),
        ],
      ),
    );
  }
  
  
  Widget buyingSellling(BuildContext context){
    return Padding(
      padding: const EdgeInsets.only(left: 5.0, right: 5),
      child: Column(
        children: [
          Row(
            children: [
              Text("$buying: $takaSymbol 20 .00", style: TextStyle(fontSize: 12),),
              const SizedBox(width: 10,),
              Text("$takaSymbol 22.00", style: TextStyle(fontSize: 12),),
            ],
          ),
          Row(
            children: [
              Text("$selling: $takaSymbol 25.", style: TextStyle(fontSize: 12),),
              const SizedBox(width: 10,),
              Text("$profit: $takaSymbol 5.00", style: TextStyle(fontSize: 12),),
            ],
          )
        ],
      ),
    );
  }
}