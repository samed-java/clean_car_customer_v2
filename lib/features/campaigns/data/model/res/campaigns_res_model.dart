class CampaignResModel {
  List<CampaignResModelCampaign>? campaigns;

  CampaignResModel({
    this.campaigns,
  });

  factory CampaignResModel.fromJson(Map<String, dynamic> json) => CampaignResModel(
    campaigns: json["campaigns"] == null ? [] : List<CampaignResModelCampaign>.from(json["campaigns"]!.map((x) => CampaignResModelCampaign.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "campaigns": campaigns == null ? [] : List<dynamic>.from(campaigns!.map((x) => x.toJson())),
  };
}

class CampaignResModelCampaign {
  String? date;
  List<CampaignModel>? campaign;

  CampaignResModelCampaign({
    this.date,
    this.campaign,
  });

  factory CampaignResModelCampaign.fromJson(Map<String, dynamic> json) => CampaignResModelCampaign(
    date: json["date"],
    campaign: json["campaign"] == null ? [] : List<CampaignModel>.from(json["campaign"]!.map((x) => CampaignModel.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "date": date,
    "campaign": campaign == null ? [] : List<dynamic>.from(campaign!.map((x) => x.toJson())),
  };
}

class CampaignModel {
  int? id;
  String? title;
  String? description;
  String? endDate;

  CampaignModel({
    this.id,
    this.title,
    this.description,
    this.endDate,
  });

  factory CampaignModel.fromJson(Map<String, dynamic> json) => CampaignModel(
    id: json["id"],
    title: json["title"],
    description: json["description"],
    endDate: json["end_date"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
    "description": description,
    "end_date": endDate,
  };
}
