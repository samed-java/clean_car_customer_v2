import 'package:clean_car_customer_v2/constants/res/color_manager.dart';
import 'package:clean_car_customer_v2/constants/res/radius_manager.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class BannerWidget extends StatefulWidget {

  BannerWidget({Key? key}):super(key: key);

  @override
  State<BannerWidget> createState() => _BannerWidgetState();
}

class _BannerWidgetState extends State<BannerWidget> {
  final List<String> imageUrls = [
  'https://via.placeholder.com/400x300.png?text=Placeholder+1',
  'https://via.placeholder.com/400x300.png?text=Placeholder+2',
'https://via.placeholder.com/400x300.png?text=Placeholder+3'
  ];

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
            onPageChanged: (index,reason){
              setState(() {
                activeIndex = index;
              });
            }
          ),
          items: imageUrls.map((url) {
            return Builder(
              builder: (BuildContext context) {
                return Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(RadiusManager.radiusCircular10),
                  ),
                  clipBehavior: Clip.antiAlias,
                  child: Image.network(
                    url,
                    fit: BoxFit.cover,
                    width: double.infinity,
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
    count: imageUrls.length,
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