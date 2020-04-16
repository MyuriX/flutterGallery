import 'package:fluttergallery/gallery/GalleryViewDao.dart';
import 'package:fluttergallery/network/GalleryListResponse.dart';

class GalleryViewRepository{
  final galleryViewDao = new GalleryViewDao();

  Future<List<GalleryListResponse>> getUserList() =>
      galleryViewDao.fetchUserList();
}