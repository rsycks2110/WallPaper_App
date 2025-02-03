
class AppExceptions implements Exception{

  String title;
  String msg;

  AppExceptions({required this.title,required this.msg});

  toMsg(){
  return "$title:$msg";
  }
}
class NetworkExceptions extends AppExceptions{
  NetworkExceptions({required String errorMsg}):super(title: "",msg:errorMsg);
}
class ServerExceptions extends AppExceptions{
  ServerExceptions({required String errorMsg}):super(title: "",msg: errorMsg);
}
class BadRequestException extends AppExceptions{
  BadRequestException({required String errorMsg}):super(title:"",msg: errorMsg);
}
