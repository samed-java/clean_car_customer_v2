enum PaymentMethod {
  cash,
  card,
}

class PaymentMethodModel {
  final PaymentMethod type;
  bool isSelected;
  String imagePath;

  PaymentMethodModel({
    required this.type,
    this.isSelected = false,
    required this.imagePath,
  });
}
