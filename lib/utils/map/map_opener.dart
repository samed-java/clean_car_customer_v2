import 'package:clean_car_customer_v2/constants/res/asset_manager.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:map_launcher/map_launcher.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class MapOpener {
  MapOpener._();

  static open(
      {required BuildContext context,
      required double lat,
      required double long}) async {
    // showBottomSheet(context: context, builder: (context){
    //
    //   return BottomSheet(onClosing: (){}, builder: (context) {
    //     return Container();
    //   });
    // })
    final availableMaps = await MapLauncher.installedMaps;
    final wazeAvailable =
        await MapLauncher.isMapAvailable(MapType.google) ?? false;

    print(availableMaps);

    // ignore: use_build_context_synchronously
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return BottomSheet(
          builder: (context) {
            return SafeArea(
              child: ClipRRect(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(16),
                    topRight: Radius.circular(16)),
                child: SingleChildScrollView(
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(16),
                            topRight: Radius.circular(16))),
                    width: 375.w,
                    child: Column(
                      children: [
                        SizedBox(
                          width: 375.w,
                          height: 40.h,
                          child: Center(
                            child: Container(
                              width: 40.w,
                              height: 5.h,
                              decoration: BoxDecoration(
                                  color: Colors.grey,
                                  borderRadius: BorderRadius.circular(16)),
                            ),
                          ),
                        ),
                        Wrap(
                          children: <Widget>[
                            for (var map in availableMaps)
                              ListTile(
                                onTap: () => map.showMarker(
                                  coords: Coords(lat, long),
                                  title: "",
                                ),
                                title: Text(map.mapName),
                                leading: SvgPicture.asset(
                                  map.icon,
                                  height: 30.0,
                                  width: 30.0,
                                ),
                              ),
                            // if (!wazeAvailable)
                            //   ListTile(
                            //     onTap: () async {
                            //       final wazeUrl =
                            //           "https://waze.com/ul?ll=$lat,$long&navigate=yes";
                            //       if (await canLaunchUrl(Uri.parse(wazeUrl))) {
                            //         await launchUrl(Uri.parse(wazeUrl));
                            //       } else {
                            //         print("Could not open Waze.");
                            //       }
                            //     },
                            //     title: Text("Waze"),
                            //     leading: SvgPicture.asset(
                            //       IconAssets.location,
                            //       height: 30.0,
                            //       width: 30.0,
                            //     ),
                            //   )
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
          onClosing: () {},
        );
      },
    );
  }
}
