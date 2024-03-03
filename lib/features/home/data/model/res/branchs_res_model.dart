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
  double? distance;
  String? mainImage;
  List<Image> images;
  List<WashingService>? services;

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
        distance: json["distance"]?.toDouble(),
        mainImage: json["main_image"],
        images: List<Image>.from(json["images"].map((x) => Image.fromJson(x))),
        services: json["services"] != null
            ? List<WashingService>.from(
                json["services"].map((x) => WashingService.fromJson(x)))
            : [],
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
        "services": services?.map((x) => x.toJson()).toList(),
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

class WashingService {
  String? ban;
  List<ServiceService> services;

  WashingService({
    required this.ban,
    required this.services,
  });

  factory WashingService.fromJson(Map<String, dynamic> json) => WashingService(
        ban: json["ban"],
        services: List<ServiceService>.from(
            json["services"].map((x) => ServiceService.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "ban": ban,
        "services": List<dynamic>.from(services.map((x) => x.toJson())),
      };
}

class ServiceService {
  String title;
  String price;

  ServiceService({
    required this.title,
    required this.price,
  });

  factory ServiceService.fromJson(Map<String, dynamic> json) => ServiceService(
        title: json["title"],
        price: json["price"],
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "price": price,
      };
}
