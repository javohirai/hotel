import 'package:dio/dio.dart';
import 'package:hotel/domain/entity/hotel.dart';
import 'package:hotel/domain/entity/hotel_room.dart';
import 'package:hotel/domain/entity/reservation.dart';

class HotelClient {
  final _dio = Dio();

  Future<Hotel?> getHotel() async {
    try {
      final response = await _dio
          .get('https://run.mocky.io/v3/d144777c-a67f-4e35-867a-cacc3b827473');
      final statusCode = response.statusCode;
      if (statusCode == null) return null;
      if (statusCode ~/ 100 == 2) {
        return Hotel.fromJson(response.data);
      }
      return null;
    } on DioException catch (e) {
      throw e.message.toString();
    }
  }

  Future<HotelRoomResponse?> getHotelRoom() async {
    try {
      final response = await _dio
          .get('https://run.mocky.io/v3/8b532701-709e-4194-a41c-1a903af00195');
      final statusCode = response.statusCode;
      if (statusCode == null) return null;
      if (statusCode ~/ 100 == 2) {
        return HotelRoomResponse.fromJson(response.data);
      }
      return null;
    } on DioException catch (e) {
      throw e.message.toString();
    }
  }

  Future<Reservation?> getReservation() async {
    try {
      final response = await _dio
          .get('https://run.mocky.io/v3/63866c74-d593-432c-af8e-f279d1a8d2ff');
      final statusCode = response.statusCode;
      if (statusCode == null) return null;
      if (statusCode ~/ 100 == 2) {
        return Reservation.fromJson(response.data);
      }
      return null;
    } on DioException catch (e) {
      throw e.message.toString();
    }
  }
}
