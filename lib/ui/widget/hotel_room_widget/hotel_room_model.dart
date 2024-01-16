import 'package:flutter/material.dart';
import 'package:hotel/domain/entity/hotel.dart';
import 'package:hotel/domain/entity/hotel_room.dart';
import 'package:hotel/domain/service/hotel_service.dart';

class HotelRoomModel extends ChangeNotifier {
  final BuildContext context;
  final Hotel hotel;
  final _hotelService = HotelService();
  final List<HotelRoom> _hotelRooms = [];

  List<HotelRoom> get hotelRooms => _hotelRooms;

  HotelRoomModel(this.context, this.hotel) {
    _init();
  }

  void _init() async {
    final hotelRoomResponse = await _hotelService.getHotelRoom();
    if (hotelRoomResponse == null) return;
    _hotelRooms.addAll(hotelRoomResponse.rooms);
    notifyListeners();
  }
}
