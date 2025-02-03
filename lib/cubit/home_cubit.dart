import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wallpaper_app_new/cubit/home_state.dart';
import 'package:wallpaper_app_new/data/repository/wallpaper_repository.dart';
import 'package:wallpaper_app_new/model/wallpaper_model.dart';

class HomeCubit extends Cubit<HomeState>{

  WallPaperRepository wallPaperRepository;
  HomeCubit({required this.wallPaperRepository}):super(HomeInitialState());

   void getWallPaperWidget()  async {
     emit(HomeLoadingState());

     var mData = await wallPaperRepository.getWallPaperRepository();

     var wallPaperModel = WallPaperModel.fromJson(mData);
     if(wallPaperModel!=null){
       emit(HomeLoadedState(photos: wallPaperModel.photos));
     }
     else{
       emit(HomeErrorState(errorMsg: "Error Occured"));
     }

   }
}