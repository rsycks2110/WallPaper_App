
import 'package:wallpaper_app_new/data/remote/url.dart';

import '../remote/api_helper.dart';



class WallPaperRepository{
  ApiHelper? apiHelper;
  WallPaperRepository({required this.apiHelper});

 Future<dynamic> getWallPaperRepository() async{
   try {
     return await apiHelper!.getApi(url: Urls.tredingWallPaperUrl);
   } catch(e){
     throw(e);
   }
  }


}