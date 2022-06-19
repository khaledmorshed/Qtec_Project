import 'package:flutter/material.dart';
import 'package:qtech_project/screens/product_details_screen.dart';
import '../global/color_management.dart';
import '../global/constant_variable.dart';
import '../model/product_model.dart';

class ProductItemWidget extends StatefulWidget {
  Result result;
  int index;
  ProductItemWidget(this.result, this.index);

  @override
  State<ProductItemWidget> createState() => _ProductItemWidgetState();
}

class _ProductItemWidgetState extends State<ProductItemWidget> {

  @override
  Widget build(BuildContext context) {
    bool _checkingStock = widget.result.stock! <= 0 ? true : false;
    final heightThreeSection = MediaQuery.of(context).size.height / 3.57;
    final widthTwoSection = MediaQuery.of(context).size.width / 2;
    return InkWell(
      onTap: (){
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => ProductDetailsScreen(widget.result)),
        );
      },
      child: Container(
        color: ColorManager.lightPink,
        margin: widget.index.isEven ? const EdgeInsets.only(left: 8) : const EdgeInsets.only(right: 8),
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
                          Center(
                            child: Image.network(
                                "${widget.result.image}",
                                width: widthTwoSection * 0.45,
                                height: widthTwoSection * 0.45,
                                fit: BoxFit.fitHeight),
                          ),
                          Positioned(
                            top: 2,
                            left: widthTwoSection / 2.1,
                            child: Visibility(
                              visible: _checkingStock,
                              child: Container(
                                height: widthTwoSection * 0.13,
                                width: widthTwoSection * 0.33,
                                decoration: BoxDecoration(
                                  color: ColorManager.stockColor,
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                child: Center(child: Text("স্টকে নেই",style: TextStyle(fontSize: 14, color: ColorManager.stockTextColor),)),
                            ), )
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 5, right: 5),
                      child: Text("${widget.result.productName}",style: TextStyle(fontSize: 14),maxLines: 2,),
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
                  heroTag: widget.index,
                  onPressed: () {},
                  child: Icon(Icons.add,),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
  
  
  Widget buyingSellling(BuildContext context){
    return Padding(
      padding: const EdgeInsets.only(left: 5.0, right: 5),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("$buying: $takaSymbol${widget.result.charge!.currentCharge}", style: TextStyle(fontSize: 12),),
              Text.rich(TextSpan(
                //text: 'This ',
                children: <TextSpan>[
                  new TextSpan(
                    text: '$takaSymbol 22.00',
                    style: new TextStyle(
                      color: Colors.black,
                      decoration: TextDecoration.lineThrough,
                      fontSize: 12,
                    ),
                  ),
                  // new TextSpan(
                  //   text: ' \3.99',
                  // ),
                ],
              ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("$selling:$takaSymbol${widget.result.charge!.sellingPrice}", style: TextStyle(fontSize: 12),),
              // const SizedBox(width: 2,),
              Text("$profit:$takaSymbol${widget.result.charge!.profit}", style: TextStyle(fontSize: 12),),
            ],
          )
        ],
      ),
    );
  }
}