import 'package:json_annotation/json_annotation.dart';

part 'hotel.g.dart';

@JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
class Hotel {
  int id;
  String? name;
  String adress;
  int minimalPrice;
  String? priceForIt;
  int rating;
  String? ratingName;
  List<String> imageUrls;
  AboutHotel aboutTheHotel;

  Hotel(
    this.id,
    this.name,
    this.adress,
    this.minimalPrice,
    this.priceForIt,
    this.rating,
    this.ratingName,
    this.imageUrls,
    this.aboutTheHotel,
  );

  factory Hotel.fromJson(Map<String, dynamic> json) => _$HotelFromJson(json);

  Map<String, dynamic> toJson() => _$HotelToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake)
class AboutHotel {
  String? description;
  List<String> peculiarities;

  AboutHotel(this.description, this.peculiarities);

  factory AboutHotel.fromJson(Map<String, dynamic> json) =>
      _$AboutHotelFromJson(json);

  Map<String, dynamic> toJson() => _$AboutHotelToJson(this);
}
