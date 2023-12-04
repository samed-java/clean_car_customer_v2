enum WashingTypes {
  premium,
  detailed,
  auto,
  outside,
  inside,
  chemical,
  engine,
  nano,
  ceramic,
  polishing,
}

class WashingTypeModel {
  final WashingTypes type;
  bool isSelected;
  String imagePath;

  WashingTypeModel({
    required this.type,
    this.isSelected = false,
    required this.imagePath,
  });
}
