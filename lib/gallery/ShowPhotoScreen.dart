import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:fluttergallery/network/GalleryListResponse.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';

class DetailScreen extends StatelessWidget {
  final GalleryListResponse galleryListResponse;

  // In the constructor, require a Todo.
  DetailScreen({Key key, this.galleryListResponse}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        child: PhotoViewGallery.builder(
          scrollPhysics: const BouncingScrollPhysics(),
          builder: (BuildContext context, int index) {
            return PhotoViewGalleryPageOptions(
              imageProvider: NetworkImage(galleryListResponse.temp[index].avatar_url),
              initialScale: PhotoViewComputedScale.contained * 0.8,
              heroAttributes: HeroAttributes(tag: galleryListResponse.temp[index].id),
            );
          },
          itemCount: galleryListResponse.temp.length,
          loadingBuilder: (context, event) => Center(
            child: Container(
              width: 20.0,
              height: 20.0,
              child: CircularProgressIndicator(
                value: event == null
                    ? 0
                    : event.cumulativeBytesLoaded / event.expectedTotalBytes,
              ),
            ),
          ),
        )
    );






//    return new Scaffold(
//        appBar: AppBar(
//          title: Text("ExampleHorizontal"),
//        ),
//        body: Swiper(
//          itemBuilder: (BuildContext context, int index) {
//            return new Image.network(galleryListResponse.temp[index].avatar_url,
//              fit: BoxFit.fill,
//            );
//          },
//
////          indicatorLayout: PageIndicatorLayout.COLOR,
//          autoplay: true,
//          itemCount: galleryListResponse.temp.length,
//          pagination: new SwiperPagination(),
//          control: new SwiperControl(),
//        ));
//    return Scaffold(
//      appBar: AppBar(
//        title: Text('Flutter Gallery'),
//      ),
//      body: Padding(
//        padding: EdgeInsets.all(16.0),
//        child: Image(image: NetworkImage(galleryListResponse.avatar_url),),
//      ),
//    );
  }
}

HeroAttributes({int tag}) {
}