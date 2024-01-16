import 'package:flutter/material.dart';
import 'package:hotel/domain/entity/hotel.dart';
import 'package:hotel/domain/service/hotel_service.dart';

class HotelModel extends ChangeNotifier {
  final BuildContext context;
  final _hotelService = HotelService();
  Hotel? _hotel;

  Hotel? get hotel => _hotel;

  HotelModel(this.context) {
    _init();
  }

  void _init() async {
    _hotel = await _hotelService.getHotel();
    notifyListeners();
  }
}
