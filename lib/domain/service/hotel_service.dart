import 'package:hotel/domain/entity/hotel.dart';
import 'package:hotel/domain/entity/hotel_room.dart';
import 'package:hotel/domain/entity/reservation.dart';
import 'package:hotel/domain/network/hotel_client.dart';

class HotelService {
  final _hotelClient = HotelClient();

  Future<Hotel?> getHotel() async {
    return await _hotelClient.getHotel();
  }

  Future<HotelRoomResponse?> getHotelRoom() async {
    return await _hotelClient.getHotelRoom();
  }

  Future<Reservation?> getReservation() async {
    return await _hotelClient.getReservation();
  }
}
