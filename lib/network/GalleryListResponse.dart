
class GalleryListResponse {
  List<Photos> temp;

  GalleryListResponse({this.temp});

  GalleryListResponse.fromJson(dynamic json) {
    temp = new List<Photos>();
    json.forEach((v) {
      temp.add(new Photos.fromJson(v));
    });
  }
}

class Photos {
  String avatar_url;
  int id;

  Photos({this.avatar_url,this.id});

  Photos.fromJson(Map<String, dynamic> json) {
    avatar_url = json['avatar_url'];
    id = json['id'];

  }
}
