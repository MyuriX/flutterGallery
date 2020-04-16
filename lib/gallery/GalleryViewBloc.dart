import 'dart:async';

import 'package:fluttergallery/gallery/GalleryViewRepository.dart';
import 'package:fluttergallery/network/GalleryListResponse.dart';
import 'package:rxdart/rxdart.dart';

class GalleryViewBloc{
  GalleryViewBloc();
  int listCount;

  final _userRepository = GalleryViewRepository();
  final _userListController = StreamController<List<GalleryListResponse>>.broadcast();
  final _isLoadMore = BehaviorSubject<bool>();

  get userList => _userListController.stream;
  get loadMore => _isLoadMore.stream;

  Function(bool) get showProgressBar{
    _isLoadMore.sink.add;
  }

  getUsers() async{
    List<GalleryListResponse> userResponse = await _userRepository.getUserList();
    _userListController.sink.add(userResponse);
    print('Bloc::API sucess');
  }

  dispose(){
    _isLoadMore.close();
    _isLoadMore.drain();
    _userListController.close();

  }


}