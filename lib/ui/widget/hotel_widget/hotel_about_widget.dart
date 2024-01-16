import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hotel/domain/navigation/main_navigation.dart';
import 'package:hotel/ui/app/image_asset.dart';
import 'package:hotel/ui/widget/hotel_widget/choise_chip_widget.dart';
import 'package:hotel/ui/widget/hotel_widget/hotel_model.dart';
import 'package:provider/provider.dart';

class HotelAbout extends StatelessWidget {
  const HotelAbout({super.key});

  @override
  Widget build(BuildContext context) {
    final model = context.read<HotelModel>();
    final hotel = model.hotel;
    if (hotel == null) return const SizedBox.shrink();
    final description = hotel.aboutTheHotel.description;
    return Container(
      decoration: BoxDecoration(
        color: const Color.fromRGBO(255, 255, 255, 1),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 10, top: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              // Hotel name
              padding: EdgeInsets.only(top: 5),
              child: Text(
                'Об отеле',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            ChoiceChipsWidget(hotel.aboutTheHotel.peculiarities),
            if (description != null)
              Padding(
                padding: const EdgeInsets.only(right: 10),
                child: Text(
                  description,
                  style: const TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 16,
                  ),
                ),
              ),
            Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 15,
                vertical: 15,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: const Color.fromRGBO(251, 251, 252, 1),
              ),
              child: const Column(children: [
                _ListileWidget('Удобства', 'Самое необходимое', emojiHappy),
                _VectorBetweenListile(),
                _ListileWidget(
                    'Что включено', 'Самое необходимое', tickSquare),
                _VectorBetweenListile(),
                _ListileWidget(
                    'Что не включено', 'Самое необходимое', closeSquare),
              ]),
            ),
            Container(
              padding: const EdgeInsets.only(right: 10, bottom: 10),
              width: double.infinity,
              child: ElevatedButton(
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                        const Color.fromRGBO(13, 114, 255, 1))),
                onPressed: () {
                  Navigator.of(context).pushNamed(
                    MainNavigationRoutes.hotelRoomRoute,
                    arguments: hotel,
                  );
                },
                child: const Text(
                  'К выбору номера',
                  style: TextStyle(
                    color: Colors.white,
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

class _VectorBetweenListile extends StatelessWidget {
  const _VectorBetweenListile();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 40),
      child: Container(
        color: const Color.fromRGBO(130, 135, 150, 0.15),
        width: 275,
        height: 1,
      ),
    );
  }
}

class _ListileWidget extends StatelessWidget {
  final String title;
  final String subtitle;
  final String leadingSvg;
  const _ListileWidget(
    this.title,
    this.subtitle,
    this.leadingSvg,
  );

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: SvgPicture.string(
        leadingSvg,
        width: 24,
        height: 24,
      ),
      title: Text(title),
      subtitle: Text(subtitle),
      trailing: SvgPicture.string(
        vector,
        width: 6,
        height: 12,
      ),
    );
  }
}
