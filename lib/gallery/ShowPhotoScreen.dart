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
              )
            ),
          ),
        )
    );
  }
}

HeroAttributes({int tag}) {
}