class BranchsResModel {
  List<Washing>? washings;
  List<Washing>? fullTimeWashings;
  List<BannerModel>? banners;

  BranchsResModel({
    this.washings,
    this.fullTimeWashings,
    this.banners,
  });

  factory BranchsResModel.fromJson(Map<String, dynamic> json) => BranchsResModel(
    washings: json["washings"] == null ? [] : List<Washing>.from(json["washings"]!.map((x) => Washing.fromJson(x))),
    fullTimeWashings: json["fullTimeWashings"] == null ? [] : List<Washing>.from(json["fullTimeWashings"]!.map((x) => Washing.fromJson(x))),
    banners: json["banners"] == null ? [] : List<BannerModel>.from(json["banners"]!.map((x) => BannerModel.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "washings": washings == null ? [] : List<dynamic>.from(washings!.map((x) => x.toJson())),
    "fullTimeWashings": fullTimeWashings == null ? [] : List<dynamic>.from(fullTimeWashings!.map((x) => x.toJson())),
    "banners": banners == null ? [] : List<dynamic>.from(banners!.map((x) => x.toJson())),
  };
}

class BannerModel {
  int? id;
  String? description;
  String? link;
  String? image;
  String? video;

  BannerModel({
    this.id,
    this.description,
    this.link,
    this.image,
    this.video,
  });

  factory BannerModel.fromJson(Map<String, dynamic> json) => BannerModel(
    id: json["id"],
    description: json["description"],
    link: json["link"],
    image: json["image"],
    video: json["video"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "description": description,
    "link": link,
    "image": image,
    "video": video,
  };
}

class Washing {
  int? id;
  int? status;
  String? title;
  String? phone;
  String? startHour;
  String? endHour;
  String? address;
  String? description;
  String? rating;
  String? lat;
  String? lon;
  double? distance;
  String? mainImage;
  List<ImageModel>? images;
  List<WashingService>? services;

  Washing({
    this.id,
    this.status,
    this.title,
    this.phone,
    this.startHour,
    this.endHour,
    this.address,
    this.description,
    this.rating,
    this.lat,
    this.lon,
    this.distance,
    this.mainImage,
    this.images,
    this.services,
  });

  factory Washing.fromJson(Map<String, dynamic> json) => Washing(
    id: json["id"],
    status: json["status"],
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
    images: json["images"] == null ? [] : List<ImageModel>.from(json["images"]!.map((x) => ImageModel.fromJson(x))),
    services: json["services"] == null ? [] : List<WashingService>.from(json["services"]!.map((x) => WashingService.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "status": status,
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
    "images": images == null ? [] : List<ImageModel>.from(images!.map((x) => x.toJson())),
    "services": services == null ? [] : List<WashingService>.from(services!.map((x) => x.toJson())),
  };
}

class ImageModel {
  int? id;
  String? image;

  ImageModel({
    this.id,
    this.image,
  });

  factory ImageModel.fromJson(Map<String, dynamic> json) => ImageModel(
    id: json["id"],
    image: json["image"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "image": image,
  };
}

class WashingService {
  String? banId;
  List<ServiceService>? services;

  WashingService({
    this.banId,
    this.services,
  });

  factory WashingService.fromJson(Map<String, dynamic> json) => WashingService(
    banId: json["ban_id"],
    services: json["services"] == null ? [] : List<ServiceService>.from(json["services"]!.map((x) => ServiceService.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "ban_id": banId,
    "services": services == null ? [] : List<dynamic>.from(services!.map((x) => x.toJson())),
  };
}

class ServiceService {
  int? id;
  String? title;
  String? price;

  ServiceService({
    this.id,
    this.title,
    this.price,
  });

  factory ServiceService.fromJson(Map<String, dynamic> json) => ServiceService(
    id: json["id"],
    title: json["title"]!,
    price: json["price"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
    "price": price,
  };
}


