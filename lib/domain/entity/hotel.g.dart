// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hotel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Hotel _$HotelFromJson(Map<String, dynamic> json) => Hotel(
      json['id'] as int,
      json['name'] as String?,
      json['adress'] as String,
      json['minimal_price'] as int,
      json['price_for_it'] as String?,
      json['rating'] as int,
      json['rating_name'] as String?,
      (json['image_urls'] as List<dynamic>).map((e) => e as String).toList(),
      AboutHotel.fromJson(json['about_the_hotel'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$HotelToJson(Hotel instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'adress': instance.adress,
      'minimal_price': instance.minimalPrice,
      'price_for_it': instance.priceForIt,
      'rating': instance.rating,
      'rating_name': instance.ratingName,
      'image_urls': instance.imageUrls,
      'about_the_hotel': instance.aboutTheHotel.toJson(),
    };

AboutHotel _$AboutHotelFromJson(Map<String, dynamic> json) => AboutHotel(
      json['description'] as String?,
      (json['peculiarities'] as List<dynamic>).map((e) => e as String).toList(),
    );

Map<String, dynamic> _$AboutHotelToJson(AboutHotel instance) =>
    <String, dynamic>{
      'description': instance.description,
      'peculiarities': instance.peculiarities,
    };
