import 'dart:convert';

class PhotoModel{
  String? alt;
  String? avg_color;
  int? height;
  int? id;
  bool? liked;
  String? photographer;
  int? photographer_id;
  String? photographer_url;
  SrcModel? src;
  String? url;
  int? width;
  PhotoModel({
    required this.alt,
    required this.avg_color,
    required this.height,
    required this.id,
    required this.liked,
    required this.photographer,
    required this.photographer_id,
    required this.photographer_url,
  required this.width,
    required this.src,
    required this.url});

factory PhotoModel.fromJson(Map<String,dynamic> json){

  return PhotoModel(alt: json["alt"], avg_color: json["avg_color"], height:json[" height"], id: json["id"],
      liked: json["liked"], photographer: json["photographer"], photographer_id: json["photographer_id"],
      photographer_url: json["photographer_url"], width: json["width"], src: SrcModel.fromJson(json["src"]), url: json["url"]);
}
  Map<String,dynamic> toJson() {
    return {
      "alt": alt,
      "avg_color": avg_color,
      " height":height,
      "id":id,
      "liked":liked,
      "photographer":photographer,
      "photographer_id":photographer_id,
       "photographer_url":photographer_url,
      "width":width,
      "src":src,
      "url":url
    };
  }
}
class SrcModel{
  String? landscape;
  String? large;
  String? large2x;
  String? medium;
  String? original;
  String? portrait;
  String? small;
  String? tiny;

  SrcModel({required this.large, required this.landscape,required this.large2x,required this.medium,required this.original,
    required this.portrait,required this.small, required this.tiny});

  factory SrcModel.fromJson(Map<String,dynamic> json){
    return SrcModel(
        large: json["large"],
        landscape: json["landscape"],
        large2x: json["large2x"],
        medium: json["medium"],
        original: json["original"],
        portrait: json["portrait"],
        small: json["small"],
        tiny: json["tiny"]);
  }

}

class WallPaperModel{

  String? next_page;
  int? page;
  int? per_page;
  List<PhotoModel>? photos;
  int? total_results;

  WallPaperModel({required this.next_page,required this.page,required this.per_page,required this.photos,required this.total_results});

  factory WallPaperModel.fromJson(Map<String,dynamic> json){

    List<PhotoModel> mPhoto=[];

    for(Map<String,dynamic> eachPhoto in json["photos"] ){
      mPhoto.add(PhotoModel.fromJson(eachPhoto));
    }
    return WallPaperModel(
        next_page: json["next_page"],
        page: json["page"],
        per_page: json["per_page"],
        photos: mPhoto,
        total_results: json["total_results"]);
  }

  Map<String,dynamic> toJson(){
    return{
      "next_page":next_page,
      "page":page,
      "per_page":per_page,
      "photos":photos,
      "total_results":total_results
    };
  }

}
























