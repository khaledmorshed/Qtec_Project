import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:flutter_polygon/flutter_polygon.dart';
import 'package:qtech_project/global/constant_variable.dart';

import '../global/color_management.dart';

class ProductDetailsScreen extends StatefulWidget {
  const ProductDetailsScreen({Key? key}) : super(key: key);

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  final searchController = TextEditingController();
  final sliderItems = [
    "slider/0.jpg",
  ];

  @override
  Widget build(BuildContext context) {
    final heighM = MediaQuery.of(context).size.height;
    final widthM = MediaQuery.of(context).size.width;
    print("height = $heighM + width = $widthM");
    return Scaffold(
      backgroundColor: ColorManager.lightPink,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            automaticallyImplyLeading: true,
            leading: IconButton(onPressed: (){},icon: Icon(Icons.arrow_back, color: Colors.black,),),
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
                viewportFraction: 0.5,
                initialPage: 0,
                enableInfiniteScroll: true,
                autoPlay: false,
                enlargeCenterPage: true,
                scrollDirection: Axis.horizontal,
              ),
              items:[
                ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Image.asset(
                  sliderItems[0],
                  fit: BoxFit.fill,
                  ),
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
            child: bodySection(),
          ),
        ],
      ),
    );
  }

  bodySection() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("প্রিঞ্জেলস অনিওন  ", style: TextStyle(fontSize: 24,),),
          SizedBox(height: 15,),
          Row(
            children: [
              Text("ব্রান্ডঃ প্রিঞ্জেলস", style: TextStyle(fontSize: 14,),),
              SizedBox(width: 10,),
              Container(
                width: 10,
                height: 10,
                decoration: BoxDecoration(
                    color: Colors.red,
                  borderRadius: BorderRadius.circular(10)
                ),
              ),
              SizedBox(width: 10,),
              Text("ডিস্ট্রিবিউটরঃ মোঃ মোবারাক হোসেন",style: TextStyle(fontSize: 14,),),
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
                              Text("৳ 220", style: TextStyle(fontSize: 20,),),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("কিক্রয়মূল্যঃ",style: TextStyle(fontSize: 16,),),
                              Text("৳ 250", style: TextStyle(fontSize: 16,),),
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
                              Text("৳ 30", style: TextStyle(fontSize: 16,),),
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
          Text("$details", style: TextStyle(fontSize: 16),),
        ],
      ),
    );
  }
}
