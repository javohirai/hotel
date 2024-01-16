// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hotel_room.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HotelRoomResponse _$HotelRoomResponseFromJson(Map<String, dynamic> json) =>
    HotelRoomResponse(
      rooms: (json['rooms'] as List<dynamic>)
          .map((e) => HotelRoom.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$HotelRoomResponseToJson(HotelRoomResponse instance) =>
    <String, dynamic>{
      'rooms': instance.rooms,
    };

HotelRoom _$HotelRoomFromJson(Map<String, dynamic> json) => HotelRoom(
      id: json['id'] as int,
      name: json['name'] as String,
      price: json['price'] as int,
      pricePer: json['price_per'] as String,
      peculiarities: (json['peculiarities'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      imageUrls: (json['image_urls'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$HotelRoomToJson(HotelRoom instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'price': instance.price,
      'price_per': instance.pricePer,
      'peculiarities': instance.peculiarities,
      'image_urls': instance.imageUrls,
    };
