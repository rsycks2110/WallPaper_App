import 'package:wallpaper_app_new/model/wallpaper_model.dart';

abstract class SearchState {

}
class SearchInitialState extends SearchState{}
class SearchLoadingState extends SearchState{}
class SearchLoadedState extends SearchState{
  List<PhotoModel> listPhotos;
  int totalWallPaperCount;
  SearchLoadedState({required this.listPhotos,required this.totalWallPaperCount});
}
class SearchErrorState extends SearchState{
  String errorMsg;
  SearchErrorState({required this.errorMsg});
}
