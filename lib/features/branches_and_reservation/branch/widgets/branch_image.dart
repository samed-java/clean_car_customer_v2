import 'package:clean_car_customer_v2/components/custom_dots.dart';
import 'package:clean_car_customer_v2/constants/res/resources_export.dart';
import 'package:flutter/material.dart';
import 'package:clean_car_customer_v2/features/home/data/model/res/branchs_res_model.dart'
    as model;

class BranchImage extends StatefulWidget {
  const BranchImage({
    super.key,
    required this.imgUrls,
  });

  final List<model.Image> imgUrls;

  @override
  State<BranchImage> createState() => _BranchImageState();
}

class _BranchImageState extends State<BranchImage> {
  int _currentPage = 0;
  final PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    final List<String> images = widget.imgUrls.isEmpty
        ? [
            "https://wavescarwash.co.uk/images/pageImages/Coventry4RebrandPhotos-23102069.jpeg",
            // Diğer yerel fotoğraflar buraya eklenebilir
          ]
        : widget.imgUrls.map((image) => image.image).toList();

    return Stack(
      children: [
        PageView(
          physics: const BouncingScrollPhysics(),
          controller: _pageController,
          onPageChanged: (int page) {
            setState(
              () {
                _currentPage = page;
              },
            );
          },
          // children: [
          //   buildImage(widget.imgUrls.isEmpty
          //       ? "https://wavescarwash.co.uk/images/pageImages/Coventry4RebrandPhotos-23102069.jpeg"
          //       : widget.imgUrls[0].image),
          //   buildImage(
          //       "https://wavescarwash.co.uk/images/pageImages/Coventry4RebrandPhotos-23102069.jpeg"),
          //   buildImage(
          //       "https://wavescarwash.co.uk/images/pageImages/Coventry4RebrandPhotos-23102069.jpeg"),
          //   buildImage(
          //       "https://wavescarwash.co.uk/images/pageImages/Coventry4RebrandPhotos-23102069.jpeg"),
          //   buildImage(
          //       "https://wavescarwash.co.uk/images/pageImages/Coventry4RebrandPhotos-23102069.jpeg"),
          //   buildImage(
          //       "https://wavescarwash.co.uk/images/pageImages/Coventry4RebrandPhotos-23102069.jpeg"),
          // ],
          children: images.map(buildImage).toList(),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: Paddings.all16,
            child: CustomDots(
              currentPage: _currentPage,
              number: widget.imgUrls.length,
              onColor: ColorManager.mainWhite,
              offColor: ColorManager.secondaryWhite,
            ),
          ),
        ),
      ],
    );
  }

  Widget buildImage(String imagePath) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(RadiusManager.radiusCircular6),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.all(RadiusManager.radiusCircular6),
        child: Stack(children: [
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            bottom: 0,
            child: Image.network(
              imagePath,
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  colors: [
                    ColorManager.mainBlack.withOpacity(0.7),
                    Colors.transparent,
                  ],
                ),
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
