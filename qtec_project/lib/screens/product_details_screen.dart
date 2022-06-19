import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:flutter_polygon/flutter_polygon.dart';
import 'package:qtech_project/global/constant_variable.dart';
import 'package:qtech_project/model/product_model.dart';

import '../global/color_management.dart';

class ProductDetailsScreen extends StatefulWidget {
  static final String path = "/ProductDetailsScreen";
  Result? result;
  //int? index;

  ProductDetailsScreen(this.result);

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  final searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final heighM = MediaQuery.of(context).size.height;
    final widthM = MediaQuery.of(context).size.width;
    final replaceText = widget.result!.description!
                        .replaceAll("$replace1", "")
                        .replaceAll("$replace2", " ")
                        .replaceAll("$replace3", " ")
                        .replaceAll("$replace4", "")
                        .replaceAll("$replace5", "")
                        .replaceAll("$replace6", "")
                        .replaceAll("$replace7", " ")
                        .replaceAll("$replace8", " ")
                        .replaceAll("$replace9", " ")
                        .replaceAll("$replace10", " ")
                        .replaceAll("$replace11", "")
                        .replaceAll("$replace12", "")
                        .replaceAll("$replace13", "")
                        .replaceAll("$replace14", "")
                        .replaceAll("$replace15", "")
                        .replaceAll("$replace16", "")
                        .replaceAll("$replace17", "")
                        .replaceAll("$replace18", "")

                                                    ;
    return Scaffold(
      backgroundColor: ColorManager.lightPink,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            automaticallyImplyLeading: true,
            leading: IconButton(onPressed: (){
              Navigator.pop(context);
            },icon: Icon(Icons.arrow_back, color: Colors.black,),),
            pinned: true,
            floating: true,
            expandedHeight: MediaQuery.of(context).size.height * 0.13,
            title: Transform(
              transform: Matrix4.translationValues(-20.0, 0.0, 0.0),
              child: Text("প্রোডাক্ট ডিটেইল", style: TextStyle(color: Colors.black),),
            ),
            flexibleSpace: FlexibleSpaceBar(
              background: Container(
                color: ColorManager.lightPink,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    SizedBox(
                      height: 40,
                      width: widthM - 30,
                      child: TextField(
                        controller: searchController,
                        decoration: const InputDecoration(
                          contentPadding:
                          EdgeInsets.only(top: 0, bottom: 0),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(60),
                            ),
                            borderSide: BorderSide.none,
                          ),
                          suffixIcon: Align(
                            widthFactor: 0.5,
                            //heightFactor: 5.0,
                            child: Icon(
                              Icons.search,
                            ),
                          ),
                          filled: true,
                          fillColor: Colors.white,
                          hintText: "    কাঙ্ক্ষিত পণ্যটি খুঁজুন",
                          hintStyle: TextStyle(
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
          SliverToBoxAdapter(
            child: CarouselSlider(
              options: CarouselOptions(
                height: MediaQuery.of(context).size.height * .28,
                aspectRatio: 16 / 9,
                viewportFraction: 0.59,
                initialPage: 0,
                enableInfiniteScroll: true,
                autoPlay: false,
                enlargeCenterPage: true,
                scrollDirection: Axis.horizontal,
              ),
              items:[
                ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Image.network("${widget.result!.image}"),
                ),
              ],
            ),
          ),
          const SliverToBoxAdapter(
            child: SizedBox(
              height: 20,
            ),
          ),
          SliverToBoxAdapter(
            child: bodySection(replaceText),
          ),
        ],
      ),
    );
  }

  bodySection(replaceText) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("${widget.result!.productName}", style: TextStyle(fontSize: 24,),maxLines: 2,),
          SizedBox(height: 15,),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
           crossAxisAlignment: CrossAxisAlignment.start,
           // mainAxisSize: MainAxisSize.min,
            children: [
              Text("ব্রান্ডঃ ${widget.result!.brand!.name}", style: TextStyle(fontSize: 14,),maxLines: 1,),
              SizedBox(width: 5,),
              Container(
                width: 10,
                height: 10,
                decoration: BoxDecoration(
                    color: Colors.red,
                  borderRadius: BorderRadius.circular(10)
                ),
              ),
              SizedBox(width: 5,),
              Flexible(child: Text("ডিস্ট্রিবিউটরঃ ${widget.result!.seller}",style: TextStyle(fontSize: 14,),maxLines: 2,overflow: TextOverflow.ellipsis,)),
            ],
          ),
          SizedBox(height: 20,),
          Container(
            height: MediaQuery.of(context).size.height * 0.308,
            color: ColorManager.lightPink,
            child: Stack(
              children:[
                Align(
                  alignment: Alignment.topCenter,
                  child: Container(
                    width: double.infinity,
                    height: MediaQuery.of(context).size.height * 0.163,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15)
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("ক্রয়মূল্যঃ",style: TextStyle(fontSize: 20,),),
                              Text("৳${widget.result!.charge!.currentCharge}", style: TextStyle(fontSize: 20,),),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("কিক্রয়মূল্যঃ",style: TextStyle(fontSize: 16,),),
                              Text("৳${widget.result!.charge!.sellingPrice}", style: TextStyle(fontSize: 16,),),
                            ],
                          ),
                          Divider(
                            color: Colors.black,
                            thickness: 1,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("লাভঃ",style: TextStyle(fontSize: 16,),),
                              Text("৳${widget.result!.charge!.profit}", style: TextStyle(fontSize: 16,),),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: MediaQuery.of(context).size.height * 0.139,
                    //left: 150,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                    children:[
                      Text("বিস্তারিত", style: TextStyle(fontSize: 20, color: Colors.black, fontWeight: FontWeight.bold),),
                      SizedBox(width: MediaQuery.of(context).size.width * 0.106,),
                      SizedBox(
                        width: MediaQuery.of(context).size.height * 0.168,
                        height: MediaQuery.of(context).size.height * 0.168,
                        child: ClipPolygon(
                          sides: 6,
                          borderRadius: 4.0,     // Defaults to 0.0 degrees
                          rotate: 180.0,          // Defaults to 0.0 degrees
                          boxShadows: [
                            PolygonBoxShadow(color: Colors.black, elevation: 2.0),
                            PolygonBoxShadow(color: Colors.black, elevation: 2.0)
                          ],
                          child: Container(
                              color: ColorManager.polygonColor,
                              child: Center(child: Text("এটি কিনুন",style: TextStyle(color: Colors.white),
                              ),),),
                        ),
                      ),
                  ],
                ),
                  ),
              ],
            ),
          ),
          SizedBox(height: 10,),
          Text("${replaceText}", style: TextStyle(fontSize: 16),textAlign: TextAlign.start,),
        ],
      ),
    );
  }
}
