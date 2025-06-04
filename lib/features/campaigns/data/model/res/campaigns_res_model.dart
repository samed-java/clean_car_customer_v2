// To parse this JSON data, do
//
//     final campaignResModel = campaignResModelFromJson(jsonString);

import 'dart:convert';

CampaignResModel campaignResModelFromJson(String str) =>
    CampaignResModel.fromJson(json.decode(str));

String campaignResModelToJson(CampaignResModel data) =>
    json.encode(data.toJson());

class CampaignResModel {
  List<Campaign>? campaigns;

  CampaignResModel({
    this.campaigns,
  });

  factory CampaignResModel.fromJson(Map<String, dynamic> json) =>
      CampaignResModel(
        campaigns: json["campaigns"] == null
            ? []
            : List<Campaign>.from(
                json["campaigns"]!.map((x) => Campaign.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "campaigns": campaigns == null
            ? []
            : List<dynamic>.from(campaigns!.map((x) => x.toJson())),
      };
}

class Campaign {
  int? id;
  String? title;
  String? shortTitle;
  String? description;
  DateTime? endDate;
  List<CampaignService>? services;
  List<CampaignWashing>? washings;

  Campaign({
    this.id,
    this.title,
    this.shortTitle,
    this.description,
    this.endDate,
    this.services,
    this.washings,
  });

  factory Campaign.fromJson(Map<String, dynamic> json) => Campaign(
        id: json["id"],
        title: json["title"],
        shortTitle: json["short_title"],
        description: json["description"],
        endDate:
            json["end_date"] == null ? null : DateTime.parse(json["end_date"]),
        services: json["services"] == null
            ? []
            : List<CampaignService>.from(
                json["services"]!.map((x) => CampaignService.fromJson(x))),
        washings: json["washings"] == null
            ? []
            : List<CampaignWashing>.from(
                json["washings"]!.map((x) => CampaignWashing.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "short_title": shortTitle,
        "description": description,
        "end_date":
            "${endDate!.year.toString().padLeft(4, '0')}-${endDate!.month.toString().padLeft(2, '0')}-${endDate!.day.toString().padLeft(2, '0')}",
        "services": services == null
            ? []
            : List<dynamic>.from(services!.map((x) => x.toJson())),
        "washings": washings == null
            ? []
            : List<dynamic>.from(washings!.map((x) => x.toJson())),
      };
}

class CampaignService {
  int? id;
  String? title;
  String? price;
  String? discountedPrice;
  CampaignService({
    this.id,
    this.title,
    this.price,
    this.discountedPrice,
  });

  factory CampaignService.fromJson(Map<String, dynamic> json) =>
      CampaignService(
          id: json["id"],
          title: json["title"],
          price: json["price"],
          discountedPrice: json["discounted_price"]);

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "price": price,
        "discounted_price": discountedPrice,
      };
}

class CampaignWashing {
  int? id;
  String? title;
  String? description;
  String? lat;
  String? lon;
  String? address;

  CampaignWashing({
    this.id,
    this.title,
    this.description,
    this.lat,
    this.lon,
    this.address,
  });

  factory CampaignWashing.fromJson(Map<String, dynamic> json) =>
      CampaignWashing(
        id: json["id"],
        title: json["title"],
        description: json["description"],
        lat: json["lat"],
        lon: json["lon"],
        address: json["address"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "description": description,
        "lat": lat,
        "lon": lon,
        "address": address,
      };
}
