
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gallery_saver/gallery_saver.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:wallpaper/wallpaper.dart';
import 'package:wallpaper_app_new/model/wallpaper_model.dart';

class DetailedWallPaperPage extends StatelessWidget{

  SrcModel photoModel;
  DetailedWallPaperPage({required this.photoModel});

  @override
  Widget build(BuildContext context) {
  return Scaffold(
 body: Stack(
   children:[
     Container(
     height: double.infinity,
     width: double.infinity,
     child: Image.network(photoModel.portrait!,fit: BoxFit.cover,),
   ),
     Positioned(
       bottom: 0,
       top: MediaQuery.of(context).size.width,
       child: Padding(
         padding:  EdgeInsets.symmetric(vertical: 15),
         child: Container(
           width: MediaQuery.of(context).size.width,
           height: MediaQuery.of(context).size.height,
           child: Row(
             mainAxisAlignment: MainAxisAlignment.center,
             children: [
             getActionBtn(onTap: (){}, title:"Info", icon: Icons.info_outline),
               SizedBox(width: 25,),
               getActionBtn(onTap: (){
                 saveWallPaper(context);
               }, title:"Save", icon: Icons.download),
               SizedBox(width: 25,),
               getActionBtn(onTap: (){
                 applyWallPaperOnHomePage(context);
               }, title:"Apply", icon: Icons.format_paint,bgColor:Colors.blueAccent ),
             ],
           ),
         ),
       ),
     )
 ]),
  );
  }
  Widget getActionBtn({required VoidCallback  onTap,required String title,required IconData icon,Color? bgColor}){
    return Column(
      children: [
        Container(
          height: 50,
          width: 50,
          decoration: BoxDecoration(
            color: bgColor!=null ? Colors.blueAccent:Colors.white,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Center(
              child: Icon(icon,)),
        ),
        SizedBox(height: 2,),
        Text(title,style: TextStyle(color: Colors.white.withOpacity(0.4)),)
      ],
    );
  }
  saveWallPaper(BuildContext context){
   GallerySaver.saveImage(photoModel.portrait!).then((value){
     return ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Saved Into Gallery")));
   });
  }
  applyWallPaperOnHomePage(BuildContext context){
    Wallpaper.imageDownloadProgress(photoModel.portrait!).listen((event){
      print(event);
      },onDone: (){
      Wallpaper.homeScreen().then((value)=>ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("WallPaper Applied On Home Screen"))));
      },
    onError: (e){
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Error Occured While Downloading: ${e.toString()}")));
    }
    );

  }

}