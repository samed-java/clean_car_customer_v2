import 'package:clean_car_customer_v2/constants/res/asset_manager.dart';
import 'package:clean_car_customer_v2/features/branches_and_reservation/reservation/widgets/car_type_button.dart';
import 'package:clean_car_customer_v2/utils/enum/washing_types.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CarTypesWidgets extends StatefulWidget {
  const CarTypesWidgets({super.key});

  @override
  State<CarTypesWidgets> createState() => _CarTypesWidgetsState();
}

class _CarTypesWidgetsState extends State<CarTypesWidgets> {
  int selectedTypeIndex = -1;
  @override
  Widget build(BuildContext context) {
    List<WashingTypeModel> washingTypes = List.generate(
      WashingTypes.values.length,
      (index) => WashingTypeModel(
        type: WashingTypes.values[index],
        imagePath: getImagePathForType(WashingTypes.values[index])[0],
      ),
    );
    return SizedBox(
      height: 110.h,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: washingTypes.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.only(left: 16.w),
            child: CarTypeButton(
              onPressed: () {
                setState(() {
                  selectedTypeIndex = index;
                });
              },
              iconPath: washingTypes[index].imagePath,
              isSelected: selectedTypeIndex == index,
              header: getImagePathForType(WashingTypes.values[index])[1],
              subText: getImagePathForType(WashingTypes.values[index])[2],
            ),
          );
        },
      ),
    );
  }

  List<String> getImagePathForType(WashingTypes type) {
    switch (type) {
      case WashingTypes.premium:
        return [IconAssets.carPremium, "Premium", "yuma"];
      case WashingTypes.detailed:
        return [IconAssets.carDetailed, "Detallı", "yuma"];
      case WashingTypes.ceramic:
        return [IconAssets.carCeramic, "Keramik", "örtükləmə"];
      case WashingTypes.chemical:
        return [IconAssets.carChemical, "Kimyəvi", "təmizləmə"];
      case WashingTypes.engine:
        return [IconAssets.carEngine, "Mühərrik", "yuma"];
      case WashingTypes.inside:
        return [IconAssets.carInside, "İç", "yuma"];
      case WashingTypes.outside:
        return [IconAssets.carOutside, "Çöl", "yuma"];
      case WashingTypes.nano:
        return [IconAssets.carNano, "Nano", "yuma"];
      case WashingTypes.polishing:
        return [IconAssets.carPolishing, "Cilalama", "prosesi"];
      default:
        return [IconAssets.carAuto, "Avto", "yuma"];
    }
  }
}
