
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wallpaper_app_new/model/wallpaper_model.dart';
import 'package:wallpaper_app_new/screen/detailed_wallpaper_page.dart';
import 'package:wallpaper_app_new/utils/utils.dart';

import '../app_widget/app_widgets.dart';
import '../cubit/serch_wallpaper_cubit/search_cubit.dart';
import '../cubit/serch_wallpaper_cubit/search_state.dart';

class SearchedWallPaperWidget extends StatefulWidget{

  String mQuery;
  String mColor;
  SearchedWallPaperWidget({required this.mQuery,this.mColor=""});

  @override
  State<StatefulWidget> createState() {
   return SearchedWallPaperWidgetState();
  }
}
class SearchedWallPaperWidgetState extends State<SearchedWallPaperWidget>{

  int totalWallPapers=0;
  List<PhotoModel> allWallPapers=[];
  int pageCount=1;
  int totalNoPage=1;
   ScrollController? scrollController;

  @override
  void initState() {
    super.initState();
    scrollController=ScrollController();
   BlocProvider.of<SearchCubit>(context).getSearchWallPaper(query: widget.mQuery,color: widget.mColor,page: pageCount);
    scrollController!.addListener((){
      if(scrollController!.position.pixels==scrollController!.position.maxScrollExtent){
        totalNoPage=totalWallPapers~/15 +1;
        if(totalNoPage>pageCount){
          pageCount++;
          BlocProvider.of<SearchCubit>(context).getSearchWallPaper(query: widget.mQuery,color: widget.mColor,page: pageCount);
        }
        else{
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Center(child: Text("Reached End Of List",style: AppUtils.mTextStyle14(),))));
        }

      }
    });

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppUtils.primaryColor,
   body:  BlocListener<SearchCubit,SearchState>(
       listener: (context,state)
    {
      if (state is SearchLoadingState) {
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(pageCount==1 ?"Loading...":"Next Page Loading...")));
      }
      else if (state is SearchErrorState) {
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.errorMsg)));
      }
      else  if (state is SearchLoadedState) {
        totalWallPapers = state.totalWallPaperCount;
        allWallPapers.addAll(state.listPhotos);
        setState(() {

        });
      }
    },
     child: Padding(
   padding:  EdgeInsets.symmetric(horizontal: 16),
      child: ListView(
        controller: scrollController,
        //  crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 30,),
          Text(widget.mQuery,style:AppUtils.mTextStyle25(mFontWeight: FontWeight.bold),),
          SizedBox(height: 16,),
          Text("$totalWallPapers WallPaper Available",style: AppUtils.mTextStyle14(),),
          SizedBox(height: 16,),
          Container(
            child: GridView.builder(
              shrinkWrap: true,
              physics:NeverScrollableScrollPhysics(),
              itemCount:allWallPapers.length,
              itemBuilder: (context, index) {
                return InkWell(onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context){
                    return DetailedWallPaperPage(photoModel: allWallPapers[index].src!);
                  }));
                },
                    child: Padding(
                      padding:  EdgeInsets.only(bottom: index==allWallPapers.length-1 ? 8:0),
                      child: WallPaperBgWidget(imageUrl: allWallPapers[index].src!.portrait!),
                    ));

              }, gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,crossAxisSpacing: 10,mainAxisSpacing: 10

            ),


            ),
          ),
          // Container(
          //   height: 200,
          //   child: ListView.builder(
          //     shrinkWrap: true,
          //     physics: NeverScrollableScrollPhysics(),
          //     scrollDirection: Axis.horizontal,
          //       itemCount: state.listPhotos.length,
          //       itemBuilder: (context,index){
          //     return  Container(
          //       height: 100,width: 100,
          //       decoration: BoxDecoration(
          //           image: DecorationImage(image: NetworkImage(state.listPhotos[index].src!.portrait!))
          //       ),
          //     );
          //   }),
          // )

        ],
      ),
    ),
   )
    );
  }
}