import 'dart:ui';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wallpaper_app_new/cubit/serch_wallpaper_cubit/search_state.dart';
import 'package:wallpaper_app_new/data/repository/wallpaper_repository.dart';
import 'package:wallpaper_app_new/model/wallpaper_model.dart';

class SearchCubit extends Cubit<SearchState>{

WallPaperRepository wallPaperRepository;

  SearchCubit({required this.wallPaperRepository}):super(SearchInitialState());

   void getSearchWallPaper( {required String query,String color="",int page=1}) async {
     emit(SearchLoadingState());

     var mData = await wallPaperRepository.getSearchWallPaperRepository(
         mQuery: query,
         mColor: color,
         mPage: page
     );

     WallPaperModel wallPaperModel = WallPaperModel.fromJson(mData);
     try {
       if (wallPaperModel!=null) {
         emit(SearchLoadedState(listPhotos: wallPaperModel.photos!,totalWallPaperCount: wallPaperModel.total_results!));
       }
     } catch (e) {
       emit(SearchErrorState(errorMsg: e.toString()));
     }
   }

   }

