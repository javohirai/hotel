import 'package:flutter/material.dart';
import 'package:hotel/domain/entity/reservation.dart';
import 'package:hotel/ui/widget/reservation_widget/reservation_model.dart';
import 'package:provider/provider.dart';

class ReservationAboutWidget extends StatelessWidget {
  const ReservationAboutWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final model = context.read<ReservationModel>();
    Reservation? reservation = model.reservation;
    if (reservation == null) {
      return const SizedBox.shrink();
    }
    return Container(
      decoration: model.containerDecoration,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 8,
        ),
        child: Column(
          children: [
            _ReservationItemInfoWidget(
              name: 'Вылет из',
              value: reservation.departure,
            ),
            _ReservationItemInfoWidget(
              name: 'Страна, город',
              value: reservation.arrivalCountry,
            ),
            _ReservationItemInfoWidget(
              name: 'Даты',
              value:
                  '${reservation.tourDateStart} - ${reservation.tourDateStop}',
            ),
            _ReservationItemInfoWidget(
              name: 'Кол-во ночей',
              value: '${reservation.numberOfNights} ночей',
            ),
            _ReservationItemInfoWidget(
              name: 'Отель',
              value: reservation.hotelName,
            ),
            _ReservationItemInfoWidget(
              name: 'Номер',
              value: reservation.room,
            ),
            _ReservationItemInfoWidget(
              name: 'Питание',
              value: reservation.nutrition,
            ),
          ],
        ),
      ),
    );
  }
}

class _ReservationItemInfoWidget extends StatelessWidget {
  final String name;
  final String value;
  const _ReservationItemInfoWidget({required this.name, required this.value});

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
              maxLines: 3,
              value,
              style: const TextStyle(
                color: Color.fromRGBO(0, 0, 0, 1),
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
