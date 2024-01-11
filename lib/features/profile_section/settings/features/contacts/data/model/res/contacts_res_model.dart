class ContactsResModel {
  List<Contact> contacts;

  ContactsResModel({
    required this.contacts,
  });

  factory ContactsResModel.fromJson(Map<String, dynamic> json) => ContactsResModel(
    contacts: List<Contact>.from(json["contacts"].map((x) => Contact.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "contacts": List<dynamic>.from(contacts.map((x) => x.toJson())),
  };
}

class Contact {
  String icon;
  String title;
  String text;
  String link;

  Contact({
    required this.icon,
    required this.title,
    required this.text,
    required this.link,
  });

  factory Contact.fromJson(Map<String, dynamic> json) => Contact(
    icon: json["icon"],
    title: json["title"],
    text: json["text"],
    link: json["link"],
  );

  Map<String, dynamic> toJson() => {
    "icon": icon,
    "title": title,
    "text": text,
    "link": link,
  };
}
