class BranchsResModel {
  List<Washing> washings;

  BranchsResModel({
    required this.washings,
  });

  factory BranchsResModel.fromJson(Map<String, dynamic> json) =>
      BranchsResModel(
        washings: List<Washing>.from(
            json["washings"].map((x) => Washing.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "washings": List<dynamic>.from(washings.map((x) => x.toJson())),
      };
}

class Washing {
  int id;
  String title;
  dynamic phone;
  String startHour;
  String endHour;
  String address;
  String? description;
  String rating;
  String lat;
  String lon;
  dynamic distance;
  String? mainImage;
  List<Image> images;
  dynamic services;

  Washing({
    required this.id,
    required this.title,
    required this.phone,
    required this.startHour,
    required this.endHour,
    required this.address,
    required this.description,
    required this.rating,
    required this.lat,
    required this.lon,
    required this.distance,
    required this.mainImage,
    required this.images,
    required this.services,
  });

  factory Washing.fromJson(Map<String, dynamic> json) => Washing(
        id: json["id"],
        title: json["title"],
        phone: json["phone"],
        startHour: json["start_hour"],
        endHour: json["end_hour"],
        address: json["address"],
        description: json["description"],
        rating: json["rating"],
        lat: json["lat"],
        lon: json["lon"],
        distance: json["distance"],
        mainImage: json["main_image"],
        images: List<Image>.from(json["images"].map((x) => Image.fromJson(x))),
        services: json["services"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "phone": phone,
        "start_hour": startHour,
        "end_hour": endHour,
        "address": address,
        "description": description,
        "rating": rating,
        "lat": lat,
        "lon": lon,
        "distance": distance,
        "main_image": mainImage,
        "images": List<dynamic>.from(images.map((x) => x.toJson())),
        "services": services,
      };
}

class Image {
  int id;
  String image;

  Image({
    required this.id,
    required this.image,
  });

  factory Image.fromJson(Map<String, dynamic> json) => Image(
        id: json["id"],
        image: json["image"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "image": image,
      };
}

class ServicesClass {
  List<Sedan> sedan;
  List<Sedan>? jeep;

  ServicesClass({
    required this.sedan,
    this.jeep,
  });

  factory ServicesClass.fromJson(Map<String, dynamic> json) => ServicesClass(
        sedan: List<Sedan>.from(json["Sedan"].map((x) => Sedan.fromJson(x))),
        jeep: json["Jeep"] == null
            ? []
            : List<Sedan>.from(json["Jeep"]!.map((x) => Sedan.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "Sedan": List<dynamic>.from(sedan.map((x) => x.toJson())),
        "Jeep": jeep == null
            ? []
            : List<dynamic>.from(jeep!.map((x) => x.toJson())),
      };
}

class Sedan {
  String title;
  String price;

  Sedan({
    required this.title,
    required this.price,
  });

  factory Sedan.fromJson(Map<String, dynamic> json) => Sedan(
        title: json["title"],
        price: json["price"],
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "price": price,
      };
}
