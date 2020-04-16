import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttergallery/gallery/GalleryViewBloc.dart';
import 'package:fluttergallery/gallery/ShowPhotoScreen.dart';
import 'package:fluttergallery/network/GalleryListResponse.dart';
import 'package:fluttergallery/widgets/ErrorMessageWidget.dart';
import 'package:fluttergallery/widgets/LoadingWidget.dart';
import 'package:fluttergallery/widgets/NoDataWidget.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';

class GalleryViewScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return GalletViewScreenState();
  }
}

class GalletViewScreenState extends State<GalleryViewScreen> {
  final galleryviewBloc = GalleryViewBloc();
   var textURL = String;


  @override
  void initState() {
    super.initState();
    galleryviewBloc.getUsers();
  }

  @override
  void dispose() {
    galleryviewBloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('Flutter Gallery'),
        ),
        body: getUserList(),
      ),
    );
  }

  Widget getUserList() {
    return StreamBuilder(
      stream: galleryviewBloc.userList,
      builder: (context, AsyncSnapshot<List<GalleryListResponse>> snapshot) {
        print('Has error: ${snapshot.hasError}');
        print('Has data: ${snapshot.hasData}');
        print('Snapshot Data: ${snapshot.data}');
        print('Connection State: ${snapshot.connectionState}');

        if (snapshot.hasData) {
          print('Inside hasData');
          if (snapshot.data == null || snapshot.data.length == 0) {
            print('Inside no Data');
            return _buildNoDataWidget();
          } else {
            return _userListWidget(snapshot);
          }
        } else if (snapshot.hasError) {
          print('Inside hasError');
          return _buildErrorWidget(snapshot.error);
        } else {
          print('Inside progressbar');
          return _buildLoadingWidget();
        }
      },
    );
  }

  Widget _userListWidget(AsyncSnapshot<List<GalleryListResponse>> snapshot) {
    return GridView.count(crossAxisCount: 2,
        children: List.generate(snapshot.data.length, (index) {
          return  new GestureDetector(
            child: FadeInImage(image: NetworkImage(snapshot.data[index].temp[index].avatar_url), placeholder: AssetImage('assets/images/photo_gallery_icon'),),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DetailScreen(galleryListResponse:snapshot.data[index] ),
                ),
              );
            },
          );
        }));
  }

  Widget _buildNoDataWidget() {
    return NoDataWidget();
  }

  Widget _buildLoadingWidget() {
    return LoadingWidget();
  }

  Widget _buildErrorWidget(Object error) {
    return ErrorMessageWidget(error: error);
  }
}

