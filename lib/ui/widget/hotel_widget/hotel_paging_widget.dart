import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hotel/ui/app/image_asset.dart';

class HotelPagingWidget extends StatelessWidget {
  final String hotelName;
  final String hotelAddress;
  final int rating;
  final String ratingName;
  const HotelPagingWidget({
    required this.hotelName,
    required this.hotelAddress,
    required this.rating,
    required this.ratingName,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    const ratingFillColor = Color.fromRGBO(255, 199, 0, 0.2);
    const ratingTextColor = Color.fromRGBO(255, 168, 0, 1);
    const edgeForElements = EdgeInsets.only(
      top: 2,
      left: 5,
    );
    const paddingTop = EdgeInsets.only(top: 5);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 149,
          height: 29,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: ratingFillColor,
          ),
          child: Row(
            children: [
              Padding(
                padding: edgeForElements,
                child: SvgPicture.string(
                  svgString,
                  width: 15,
                  height: 15,
                ),
              ),
              Padding(
                padding: edgeForElements,
                child: Text(
                  '$rating $ratingName',
                  style: const TextStyle(
                    fontSize: 16,
                    color: ratingTextColor,
                  ),
                ),
              )
            ],
          ),
        ),
        Padding(
          // Hotel name
          padding: paddingTop,
          child: Text(
            hotelName,
            style: const TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        Padding(
          // Hotel address
          padding: paddingTop,
          child: Text(
            hotelAddress,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: Color.fromRGBO(13, 114, 255, 1),
            ),
            maxLines: 3,
          ),
        ),
      ],
    );
  }
}
