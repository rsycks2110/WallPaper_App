
import '../../model/wallpaper_model.dart';

abstract class HomeState{}

class HomeInitialState extends HomeState{}
class HomeLoadingState extends HomeState{}
class HomeLoadedState extends HomeState{

  List<PhotoModel> photos;
  HomeLoadedState({required this.photos});
}
class HomeErrorState extends HomeState{
  String errorMsg;
  HomeErrorState({required this.errorMsg});
}