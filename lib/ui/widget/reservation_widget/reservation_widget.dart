import 'package:flutter/material.dart';
import 'package:hotel/domain/entity/reservation.dart';
import 'package:hotel/ui/widget/reservation_widget/reservation_info_widget.dart';
import 'package:hotel/ui/widget/reservation_widget/reservation_model.dart';
import 'package:provider/provider.dart';

class ReservationWidget extends StatelessWidget {
  const ReservationWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final model = context.watch<ReservationModel>();
    Reservation? reservation = model.reservation;
    Widget body = const Center(
      child: CircularProgressIndicator(),
    );
    if (reservation != null) {
      body = const ReservationInfoWidget();
    }
    return Scaffold(
      appBar: AppBar(
          title: const Center(
        child: Text('Бронирование'),
      )),
      body: body,
    );
  }
}
