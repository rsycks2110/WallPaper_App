import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as httpClient;

class ApiHelper{

 Future<dynamic> getApi({required String url}) async{
   var uri=Uri.parse(url) ;
  try {
    httpClient.Response res = await httpClient.get(uri,headers: {"Authorization":"sM95Ekb64WvbvjL7HlbnQ2rvxGpcWpgMHwABsdcSXVIMQpFIJaCgVKUm"});
    return returnDynamicData(res);
  } on SocketException catch(e){
   throw(e.toString());
  }

  }
  Future<dynamic> returnDynamicData(httpClient.Response response) async {
   switch(response.statusCode){
     case 200:
     {
       dynamic data= jsonDecode(response.body);
         return data;
       }
     default:
       throw("Error Occured With Status Code:${response.statusCode}");

     }
   }
  }


