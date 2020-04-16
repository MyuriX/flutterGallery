
import 'package:dio/dio.dart';
import 'package:fluttergallery/network/BaseDio.dart';
import 'package:fluttergallery/network/GalleryListResponse.dart';

class GalleryViewDao with BaseDio{

  Future<List<GalleryListResponse>> fetchUserList() async{
    Dio dio = await getBaseDio();
    GalleryListResponse galleryResponse = GalleryListResponse();
    List<GalleryListResponse> list = [];

    Response<List> response = await dio.get("users") ;
    if(response.statusCode == 200){
      print('Api call${response.data.runtimeType}');
      print("DAO:::API sucess");
      for(int i =0;i<response.data.length;i++){
        galleryResponse = GalleryListResponse.fromJson(response.data);
        list.add(galleryResponse);
      }
    }else{
      print('Failed to load');
    }
    return list;
  }

}