import 'package:flutter/material.dart';
import 'package:hotel/ui/widget/hotel_widget/hotel_about_widget.dart';
import 'package:hotel/ui/widget/hotel_widget/hotel_info_widget.dart';
import 'package:hotel/ui/widget/hotel_widget/hotel_model.dart';
import 'package:provider/provider.dart';

class HotelWidget extends StatelessWidget {
  const HotelWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final model = context.watch<HotelModel>();
    final hotel = model.hotel;
    Widget body = const Center(
      child: CircularProgressIndicator(),
    );
    if (hotel != null) {
      body = ListView(
        children: const [
          HotelInfoWidget(),
          SizedBox(height: 10),
          HotelAbout(),
        ],
      );
    }
    return Scaffold(
      appBar: AppBar(
          title: const Center(
        child: Text('Отель'),
      )),
      body: body,
    );
  }
}

