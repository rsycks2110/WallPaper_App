
import 'package:wallpaper_app_new/data/remote/url.dart';

import '../remote/api_helper.dart';



class WallPaperRepository{
  ApiHelper? apiHelper;
  WallPaperRepository({required this.apiHelper});

 Future<dynamic> getWallPaperRepository() async{
   try {
     return await apiHelper!.getApi(url: Urls.tredingWallPaperUrl);
   } catch(e){
     throw(e.toString());
   }
  }
  Future<dynamic> getSearchWallPaperRepository({required String mQuery,String mColor="",int mPage=1}) async{
    try {
      return await apiHelper!.getApi(url: "${Urls.searchWallPaperUrl}?query=$mQuery&color=$mColor&page=$mPage");
    } catch(e){
      throw(e.toString());
    }
  }


}