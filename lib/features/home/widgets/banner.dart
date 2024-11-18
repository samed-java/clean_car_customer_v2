import 'package:clean_car_customer_v2/constants/res/color_manager.dart';
import 'package:clean_car_customer_v2/constants/res/radius_manager.dart';
import 'package:clean_car_customer_v2/constants/res/resources_export.dart';
import 'package:clean_car_customer_v2/utils/sheets/sheets.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_bounce/flutter_bounce.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:url_launcher/url_launcher_string.dart';

import '../data/model/res/branchs_res_model.dart';

class BannerWidget extends StatefulWidget {
  final List<BannerModel> banners;

  BannerWidget({Key? key, required this.banners}) : super(key: key);

  @override
  State<BannerWidget> createState() => _BannerWidgetState();
}

class _BannerWidgetState extends State<BannerWidget> {
  int activeIndex = 0;

  final CarouselSliderController _controller = CarouselSliderController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider(
          carouselController: _controller,
          options: CarouselOptions(
              height: 200,
              autoPlay: true,
              enlargeCenterPage: true,
              enableInfiniteScroll: true,
              autoPlayInterval: Duration(seconds: 3),
              autoPlayAnimationDuration: Duration(milliseconds: 800),
              viewportFraction: 0.9,
              onPageChanged: (index, reason) {
                setState(() {
                  activeIndex = index;
                });
              }),
          items: widget.banners.map((banner) {
            return Builder(
              builder: (BuildContext context) {
                return Bounce(
                  duration: DurationConstant.ms100,
                  onPressed: () {
                    Sheets.showExtraDetailSheet(
                        title: "Reklam",
                        content: banner.description!,
                        actionText: "Linke kecid edin",
                        actionIcon: SvgPicture.asset(IconAssets.web),
                        mediaType: MediaType.networkVideo,
                        mediaSource: banner.video,
                        action: () {
                          if (banner.link != null) {
                            launchUrlString(banner.link!);
                          }
                        });
                  },
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.all(RadiusManager.radiusCircular10),
                    ),
                    clipBehavior: Clip.antiAlias,
                    child: Image.network(
                      banner.image!,
                      fit: BoxFit.cover,
                      width: double.infinity,
                    ),
                  ),
                );
              },
            );
          }).toList(),
        ),
        const SizedBox(height: 16),
        buildIndicator(),
      ],
    );
  }

  Widget buildIndicator() => AnimatedSmoothIndicator(
        activeIndex: activeIndex,
        count: widget.banners.length,
        effect: ExpandingDotsEffect(
          expansionFactor: 2,
          dotHeight: 6,
          dotWidth: 6,
          activeDotColor: ColorManager.fifthBlack,
          dotColor: ColorManager.mainBlack.withOpacity(.1),
        ),
        onDotClicked: (index) {
          _controller.animateToPage(index);
        },
      );
}
