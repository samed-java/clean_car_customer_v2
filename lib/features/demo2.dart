import 'package:clean_car_customer_v2/components/custom_filter_button.dart';
import 'package:clean_car_customer_v2/constants/res/resources_export.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Demo2 extends StatefulWidget {
  const Demo2({Key? key}) : super(key: key);

  @override
  State<Demo2> createState() => _Demo2State();
}

class _Demo2State extends State<Demo2> {
  final focus = FocusNode();
  final TextEditingController searchController = TextEditingController();
  bool isTap = false;

  double containerWidth = 270.w;

  List<DropdownMenuItem<String>> items = [
    const DropdownMenuItem<String>(
      value: "One",
      child: Text("One"),
    ),
    const DropdownMenuItem<String>(
      value: "Two",
      child: Text("Two"),
    ),
    const DropdownMenuItem<String>(
      value: "Three",
      child: Text("Three"),
    ),
  ];
  String drowDownValue = "Two";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.mainBackgroundColor,
      appBar: AppBar(
        elevation: 0,
        title: Text(
          "Demo Page 2",
          style: getSemiBoldStyle(color: ColorManager.mainBlack, fontSize: 18),
        ),
        backgroundColor: ColorManager.mainBackgroundColor,
      ),
      body: Padding(
        padding: Paddings.horizontal16,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AnimatedContainer(
                  curve: Curves.bounceIn,
                  duration: const Duration(milliseconds: 100),
                  height: 40.h,
                  width: containerWidth,
                  child: TextField(
                    onTap: () {
                      setState(() {
                        containerWidth =
                            MediaQuery.of(context).size.width - 32.w;
                        isTap = true;
                      });
                    },
                    // onTapOutside: (event) async {
                    //   focus.unfocus();
                    //   setState(() {
                    //     containerWidth = 270.w;
                    //   });
                    //   await Future.delayed(const Duration(milliseconds: 100));
                    //   setState(() {
                    //     isTap = false;
                    //   });
                    // },
                    focusNode: focus,
                    controller: searchController,
                    cursorColor: ColorManager.thirdBlack,
                    decoration: InputDecoration(
                      hintText: "avtoyuma mərkəzi axtar",
                      prefixIconColor: ColorManager.fifthBlack,
                      prefixIcon: GestureDetector(
                        onTap: () async {
                          focus.unfocus();
                          setState(() {
                            containerWidth = 270.w;
                          });
                          await Future.delayed(
                              const Duration(milliseconds: 100));
                          setState(() {
                            isTap = false;
                          });
                        },
                        child: Icon(
                            isTap ? Icons.arrow_back_ios_new : Icons.search),
                      ),
                      contentPadding: Paddings.horizontal8,
                      filled: true,
                      fillColor: ColorManager.mainWhite,
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.all(
                          Radius.circular(6.r),
                        ),
                      ),
                    ),
                  ),
                ),
                if (!isTap) FilterButton(onPressed: () {})
              ],
            ),
            Gaps.h2,
            if (isTap)
              Expanded(
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: ColorManager.mainWhite,
                      borderRadius: BorderRadius.circular(6.r)),
                ),
              ),
            Gaps.h128,
            Container(
              height: 50.h,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(6.r)),
              child: Padding(
                padding: Paddings.horizontal16,
                child: DropdownButtonHideUnderline(
                  child: DropdownButton<String>(
                    // isDense: true,
                    underline: null,
                    borderRadius: BorderRadius.circular(6.r),
                    isExpanded: true,
                    value: drowDownValue,
                    icon: Image.asset(IconAssets.arrowDown),
                    items: items,
                    onChanged: (String? newValue) {
                      setState(() {
                        drowDownValue = newValue!;
                      });
                    },
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
