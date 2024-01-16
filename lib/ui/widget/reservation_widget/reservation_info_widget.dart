import 'package:flutter/material.dart';
import 'package:hotel/domain/entity/reservation.dart';
import 'package:hotel/ui/widget/hotel_widget/hotel_paging_widget.dart';
import 'package:hotel/ui/widget/reservation_widget/buyer_info_widget.dart';
import 'package:hotel/ui/widget/reservation_widget/reservation_about_widget.dart';
import 'package:hotel/ui/widget/reservation_widget/reservation_model.dart';
import 'package:hotel/ui/widget/reservation_widget/tourist_add_widget.dart';
import 'package:hotel/ui/widget/reservation_widget/tourist_tile_widget.dart';
import 'package:provider/provider.dart';

class ReservationInfoWidget extends StatelessWidget {
  const ReservationInfoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    const sizedBox = SizedBox(height: 10);
    final model = context.watch<ReservationModel>();
    Reservation? reservation = model.reservation;
    if (reservation == null) {
      return const SizedBox.shrink();
    }
    return Container(
      decoration: const BoxDecoration(
        color: Color.fromRGBO(246, 246, 249, 1),
      ),
      child: ListView(
        children: [
          sizedBox,
          Container(
            decoration: model.containerDecoration,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: HotelPagingWidget(
                hotelName: reservation.hotelName,
                hotelAddress: reservation.hotelAdress,
                rating: reservation.horating,
                ratingName: reservation.ratingName,
              ),
            ),
          ),
          sizedBox,
          const ReservationAboutWidget(),
          sizedBox,
          const BuyerInfoWidget(),
          if (model.touristList.isNotEmpty) ...[
            const SizedBox(height: 8),
            const TouristTileWidget(),
          ],
          const SizedBox(height: 8),
          const TouristAddWidget(),
          const SizedBox(height: 8),
          const _TourServicePriceWidget(),
          const SizedBox(height: 8),
          const _CheckPayWidget(),
          const SizedBox(height: 8),
        ],
      ),
    );
  }
}

class _TourServicePriceWidget extends StatelessWidget {
  const _TourServicePriceWidget();

  @override
  Widget build(BuildContext context) {
    final model = context.read<ReservationModel>();
    final reservation = model.reservation;
    if (reservation == null) return const SizedBox.shrink();
    return Container(
      decoration: model.containerDecoration,
      child: Padding(
        padding: const EdgeInsets.only(left: 16, right: 16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            _PriceItemInfoWidget(
              name: 'Тур',
              value: model.getPriceInFormat(reservation.tourPrice),
            ),
            _PriceItemInfoWidget(
              name: 'Топливный сбор',
              value: model.getPriceInFormat(reservation.fuelCharge),
            ),
            _PriceItemInfoWidget(
              name: 'Сервисный сбор',
              value: model.getPriceInFormat(reservation.serviceCharge),
            ),
            _PriceItemInfoWidget(
              name: 'К оплате',
              value: model.getPriceInFormat(model.totalPrice()),
              textColor: const Color.fromRGBO(13, 114, 255, 1),
            ),
          ],
        ),
      ),
    );
  }
}

class _PriceItemInfoWidget extends StatelessWidget {
  final String name;
  final String value;
  final Color? textColor;
  const _PriceItemInfoWidget(
      {required this.name, required this.value, this.textColor});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 8,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 5,
            child: Text(
              name,
              style: const TextStyle(
                color: Color.fromRGBO(130, 135, 150, 1),
                fontSize: 16,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          Expanded(
            flex: 7,
            child: Text(
              textAlign: TextAlign.end,
              maxLines: 3,
              value,
              style: TextStyle(
                color: textColor ?? const Color.fromRGBO(0, 0, 0, 1),
                fontSize: 16,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _CheckPayWidget extends StatelessWidget {
  const _CheckPayWidget();

  @override
  Widget build(BuildContext context) {
    final model = context.read<ReservationModel>();
    return Container(
      decoration: model.containerDecoration,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: ElevatedButton(
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(
                const Color.fromRGBO(13, 114, 255, 1))),
        onPressed: () {
          model.payReservation();
        },
        child: Text(
          model.getPayText(),
          style: const TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
