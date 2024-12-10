class NotificationsResModel {
  List<NotificationsResModelNotification>? notifications;

  NotificationsResModel({
    this.notifications,
  });

  factory NotificationsResModel.fromJson(Map<String, dynamic> json) => NotificationsResModel(
    notifications: json["notifications"] == null ? [] : List<NotificationsResModelNotification>.from(json["notifications"]!.map((x) => NotificationsResModelNotification.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "notifications": notifications == null ? [] : List<dynamic>.from(notifications!.map((x) => x.toJson())),
  };
}

class NotificationsResModelNotification {
  String? date;
  List<NotificationModel>? notifications;

  NotificationsResModelNotification({
    this.date,
    this.notifications,
  });

  factory NotificationsResModelNotification.fromJson(Map<String, dynamic> json) => NotificationsResModelNotification(
    date: json["date"],
    notifications: json["notifications"] == null ? [] : List<NotificationModel>.from(json["notifications"]!.map((x) => NotificationModel.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "date": date,
    "notifications": notifications == null ? [] : List<dynamic>.from(notifications!.map((x) => x.toJson())),
  };
}

class NotificationModel {
  int? id;
  String? title;
  String? description;
  DateTime? createdAt;
  bool isRead;

  NotificationModel({
    this.id,
    this.title,
    this.description,
    this.createdAt,
    this.isRead = false
  });

  factory NotificationModel.fromJson(Map<String, dynamic> json) => NotificationModel(
    id: json["id"],
    title: json["title"],
    description: json["description"],
    isRead: json["is_read"],
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
    "description": description,
    "is_read": isRead,
    "created_at": createdAt?.toIso8601String(),
  };
}
