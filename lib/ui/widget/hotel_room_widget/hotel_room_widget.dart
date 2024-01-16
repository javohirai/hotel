import 'package:flutter/material.dart';
import 'package:hotel/domain/navigation/main_navigation.dart';
import 'package:hotel/domain/entity/hotel_room.dart';
import 'package:hotel/ui/app/image_asset.dart';
import 'package:hotel/ui/widget/hotel_room_widget/hotel_room_model.dart';
import 'package:hotel/ui/widget/hotel_widget/carousel_widget.dart';
import 'package:hotel/ui/widget/hotel_widget/choise_chip_widget.dart';
import 'package:hotel/ui/utils/utils.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class HotelRoomWidget extends StatelessWidget {
  const HotelRoomWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final model = context.watch<HotelRoomModel>();
    final hotel = model.hotel;
    List<HotelRoom> rooms = model.hotelRooms;
    Widget body = ListView.builder(
      itemCount: rooms.length,
      itemBuilder: (context, index) {
        return _HotelRoom(index);
      },
    );
    if (rooms.isEmpty) {
      body = const Center(
        child: CircularProgressIndicator(),
      );
    }
    return Scaffold(
      appBar: AppBar(
          title: Center(
        child: Text(hotel.name ?? ''),
      )),
      body: body,
    );
  }
}

class _HotelRoom extends StatelessWidget {
  final int index;
  const _HotelRoom(this.index);

  @override
  Widget build(BuildContext context) {
    final model = context.read<HotelRoomModel>();
    final hotelRoom = model.hotelRooms[index];
    const paddingTop = EdgeInsets.only(top: 5);
    return Container(
      padding: const EdgeInsets.only(
        bottom: 10,
      ),
      decoration: BoxDecoration(
        color: Colors.white.withAlpha(205),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CarouselWidget(hotelRoom.imageUrls),
            const SizedBox(height: 10),
            Padding(
              padding: paddingTop,
              child: Text(
                hotelRoom.name,
                style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            ChoiceChipsWidget(hotelRoom.peculiarities),
            const SizedBox(height: 5),
            _HotelRoomAbout(hotelRoom: hotelRoom),
            const SizedBox(height: 5),
            _HotepRoomPrice(hotelRoom: hotelRoom),
            const SizedBox(height: 10),
            Container(
              padding: const EdgeInsets.only(right: 10, bottom: 10),
              width: double.infinity,
              child: ElevatedButton(
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                        const Color.fromRGBO(13, 114, 255, 1))),
                onPressed: () {
                  Navigator.of(context).pushNamed(
                    MainNavigationRoutes.reservationRoute,
                  );
                },
                child: const Text(
                  'Выбрать номер',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 5),
          ],
        ),
      ),
    );
  }
}

class _HotelRoomAbout extends StatelessWidget {
  final HotelRoom hotelRoom;
  const _HotelRoomAbout({
    required this.hotelRoom,
  });

  @override
  Widget build(BuildContext context) {
    const ratingFillColor = Color.fromRGBO(13, 114, 255, 0.1);
    const ratingTextColor = Color.fromRGBO(13, 114, 255, 1);
    const edgeForElements = EdgeInsets.only(
      top: 1,
      left: 5,
    );
    return Container(
      width: 192,
      height: 29,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: ratingFillColor,
      ),
      child: Row(
        children: [
          const Padding(
            padding: edgeForElements,
            child: Text(
              'Подробнее о номере',
              style: TextStyle(
                fontSize: 16,
                color: ratingTextColor,
              ),
            ),
          ),
          Padding(
            padding: edgeForElements,
            child: SvgPicture.string(
              vectorAbout,
              width: 15,
              height: 15,
            ),
          ),
        ],
      ),
    );
  }
}

class _HotepRoomPrice extends StatelessWidget {
  final HotelRoom hotelRoom;
  const _HotepRoomPrice({
    required this.hotelRoom,
  });

  @override
  Widget build(BuildContext context) {
    const paddingTop = EdgeInsets.only(top: 5);
    return Row(
      children: [
        Expanded(
          child: Padding(
            padding: paddingTop,
            child: Text(
              priceFormatterHotel(hotelRoom.price),
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
            padding: paddingTop,
            child: Text(
              hotelRoom.pricePer,
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
