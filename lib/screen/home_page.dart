import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wallpaper_app_new/app_widget/app_widgets.dart';
import 'package:wallpaper_app_new/constants/app_constants.dart';
import 'package:wallpaper_app_new/cubit/home_cubit.dart';
import 'package:wallpaper_app_new/cubit/home_state.dart';
import 'package:wallpaper_app_new/utils/utils.dart';

class HomePage extends StatefulWidget {

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  void initState() {
    super.initState();
    BlocProvider.of<HomeCubit>(context).getWallPaperWidget();
  }
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        body: Center(
          child: Container(
            color: AppUtils.primaryColor,
            child: ListView(
              children: [
                Padding(
                  padding:  EdgeInsets.only(left: 16,right: 16),
                  child: SizedBox(
                    height: size.height/14,
                  ),
                ),
                Padding(
                  padding:  EdgeInsets.only(left: 16,right: 16),
                  child: TextField(
                    decoration: InputDecoration(
                        filled: true,
                        fillColor: AppUtils.secondaryColor,
                        hintText: "Search Wallpaper Here..",
                        suffixIcon: Icon(Icons.search_rounded),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: BorderSide(width: 0,color:Colors.transparent)),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: BorderSide(width: 0,color:Colors.transparent)),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: BorderSide(width: 0,color:Colors.transparent))),
                  ),
                ),
                SizedBox(
                  height: 16,
                ),
                //2
                Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                  Padding(
                    padding:  EdgeInsets.only(left: 16,right: 16),
                    child: Text(
                      "Best Of the month",
                      style: AppUtils.mTextStyle14(),
                    ),
                  )
                ]),
                SizedBox(
                  height: 16,
                ),
                //3

               SizedBox(height: 200,
               child: BlocBuilder<HomeCubit,HomeState>(builder: (context,state){

                 if(state is HomeLoadingState){
                   return CircularProgressIndicator();
                 }
                 else if(state is HomeErrorState){
                   throw(state.errorMsg);
                 }
                 else if(state is HomeLoadedState) {
                   return ListView.builder(itemBuilder: (context,index){
                     return Container(
                       height: 200,width: 150,
                       decoration: BoxDecoration(
                         image: DecorationImage(image: NetworkImage(state.photos[index].src.portrait))
                       ),
                     );
                   });
                     // ListView.builder(
                     //   itemCount:state.photos.length,
                     //   scrollDirection: Axis.horizontal,
                     //   itemBuilder: (context, index) {
                     //     return Padding(
                     //         padding: EdgeInsets.only(
                     //             left: 11, right: index == state.photos.length-1 ? 11 : 0),
                     //         child:WallPaperBgWidget(imageUrl: state.photos[index].src.portrait));
                     //   });
                 } else{
                   return Container(child: Text("No Image To Upload"),);
                 }

               }),),



                //4
                SizedBox(
                  height: 16,
                ),
                Padding(
                  padding:  EdgeInsets.only(left: 16,right: 16),
                  child: Text(
                    "The color tone",
                    style: AppUtils.mTextStyle14(),
                  ),
                ),
                SizedBox(
                  height: 16,
                ),
                Padding(
                  padding:  EdgeInsets.only(left: 16,right: 16),
                  child: SizedBox(
                    height: size.height/15,
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: AppConstants.mColor.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: EdgeInsets.only(
                                left: 11, right: index == AppConstants.mColor.length-1 ? 11 :0),
                            child: getColorToneWidget(
                                AppConstants.mColor[index]),
                          );
                          //   Padding(
                          //   padding:EdgeInsets.only(left: 11,right: index==8 ? 11:0),
                          //   child: Container(
                          //     height: 50,width: 50,
                          //     decoration: BoxDecoration(
                          //         borderRadius: BorderRadius.circular(5),
                          //         color: Colors.primaries[Random().nextInt(Colors.primaries.length-1)]
                          //     ),
                          //   ),
                          // );
                        }),
                  ),
                ),
                SizedBox(
                  height: 16,
                ),
                //5

                Padding(
                  padding:  EdgeInsets.only(left: 16,right: 16),
                  child: Text(
                    'Categories',
                    style: AppUtils.mTextStyle14(),
                  ),
                ),
                SizedBox(
                  height: 16,
                ),
                Padding(
                  padding:  EdgeInsets.only(left: 16,right: 16),
                  child: Container(
                    //height: 200,
                    child: GridView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisSpacing: 10,
                          mainAxisSpacing: 10,
                          childAspectRatio: 7 / 4,
                          crossAxisCount: 2,
                        ),
                        itemBuilder: (context, index) {

                          return getContainerWidget(
                              AppConstants.mCategory[index]["image"],
                              AppConstants.mCategory[index]["title"]);
                        },itemCount: AppConstants.mCategory.length,),
                  ),
                )
              ],
            ),
          ),
        ));
  }

  Widget getContainerWidget(String imgUrl, String title) {
    return Container(
      height: 50,
      width: 50, child:Center(child: Text(title,style: TextStyle(color: Colors.white))),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          image:
              DecorationImage(image: NetworkImage(imgUrl), fit: BoxFit.cover)),
    );
  }

  Widget getColorToneWidget(Color mColor) {
    return Container(
      height: 50,
      width: 50,
      decoration: BoxDecoration(
        color: mColor,
        borderRadius: BorderRadius.circular(5),
      ),
    );
  }
}
