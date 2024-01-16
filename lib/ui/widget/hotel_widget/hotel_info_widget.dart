import 'package:flutter/material.dart';
import 'package:hotel/ui/utils/utils.dart';
import 'package:hotel/ui/widget/hotel_widget/carousel_widget.dart';
import 'package:hotel/ui/widget/hotel_widget/hotel_model.dart';
import 'package:hotel/ui/widget/hotel_widget/hotel_paging_widget.dart';
import 'package:provider/provider.dart';

class HotelInfoWidget extends StatelessWidget {
  const HotelInfoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final model = context.read<HotelModel>();
    final hotel = model.hotel;
    if (hotel == null) return const SizedBox.shrink();
    return Container(
      decoration: BoxDecoration(
        color: Colors.white.withAlpha(205),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CarouselWidget(hotel.imageUrls),
            const SizedBox(height: 10),
            HotelPagingWidget(
              hotelName: hotel.name ?? '',
              hotelAddress: hotel.adress,
              rating: hotel.rating,
              ratingName: hotel.ratingName ?? '',
            ),
            const _HotepPrice()
          ],
        ),
      ),
    );
  }
}

class _HotepPrice extends StatelessWidget {
  const _HotepPrice();

  @override
  Widget build(BuildContext context) {
    const paddingTop = EdgeInsets.only(top: 5);
    final model = context.read<HotelModel>();
    final hotel = model.hotel;
    if (hotel == null) return const SizedBox.shrink();
    return Row(
      children: [
        Expanded(
          child: Padding(
            // Hotel price
            padding: paddingTop,
            child: Text(
              priceFormatterHotel(hotel.minimalPrice),
              style: const TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w600,
              ),
              maxLines: 3,
            ),
          ),
        ),
        Expanded(
          child: Padding(
            // Hotel price
            padding: paddingTop,
            child: Text(
              hotel.priceForIt ?? '',
              style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: Color.fromRGBO(130, 135, 150, 1)),
              maxLines: 3,
            ),
          ),
        ),
      ],
    );
  }
}
