import 'package:clean_car_customer_v2/constants/res/resources_export.dart';
import 'package:clean_car_customer_v2/features/branches_and_reservation/reservation/widgets/payment_card.dart';
import 'package:clean_car_customer_v2/utils/enum/payment_method.dart';
import 'package:flutter/material.dart';

class PaymentMethodWidget extends StatefulWidget {
  const PaymentMethodWidget({Key? key}) : super(key: key);

  @override
  State<PaymentMethodWidget> createState() => _PaymentMethodWidgetState();
}

class _PaymentMethodWidgetState extends State<PaymentMethodWidget> {
  PaymentMethod selectedPaymentMethod = PaymentMethod.cash;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        PaymentCard(
          isSelected: selectedPaymentMethod == PaymentMethod.cash,
          text: "Nağd",
          iconPath: IconAssets.cash,
          onPressed: () {
            setState(() {
              selectedPaymentMethod = PaymentMethod.cash;
            });
          },
        ),
        PaymentCard(
          isSelected: selectedPaymentMethod == PaymentMethod.card,
          text: "Kard",
          iconPath: IconAssets.card,
          onPressed: () {
            setState(() {
              selectedPaymentMethod = PaymentMethod.card;
            });
          },
        ),
      ],
    );
  }
}
