import 'package:json_annotation/json_annotation.dart';

part 'hotel_room.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class HotelRoomResponse {
  List<HotelRoom> rooms;

  HotelRoomResponse({required this.rooms});

  factory HotelRoomResponse.fromJson(Map<String, dynamic> json) =>
      _$HotelRoomResponseFromJson(json);

  Map<String, dynamic> toJson() => _$HotelRoomResponseToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake)
class HotelRoom {
  int id;
  String name;
  int price;
  String pricePer;
  List<String> peculiarities;
  List<String> imageUrls;

  HotelRoom({
    required this.id,
    required this.name,
    required this.price,
    required this.pricePer,
    required this.peculiarities,
    required this.imageUrls,
  });

  factory HotelRoom.fromJson(Map<String, dynamic> json) =>
      _$HotelRoomFromJson(json);

  Map<String, dynamic> toJson() => _$HotelRoomToJson(this);
}
