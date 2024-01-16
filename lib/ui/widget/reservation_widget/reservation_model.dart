import 'package:flutter/material.dart';
import 'package:hotel/domain/entity/reservation.dart';
import 'package:hotel/domain/entity/tourist.dart';
import 'package:hotel/domain/navigation/main_navigation.dart';
import 'package:hotel/domain/service/hotel_service.dart';
import 'package:hotel/ui/utils/utils.dart';

class ReservationModel extends ChangeNotifier {
  final BuildContext context;
  Reservation? _reservation;
  final _service = HotelService();
  final TextEditingController emailController = TextEditingController();
  final containerDecoration = BoxDecoration(
    color: Colors.white.withAlpha(205),
    borderRadius: BorderRadius.circular(12),
  );

  bool emailIsValid = true;
  List<Tourirst> touristList = [];
  Reservation? get reservation => _reservation;

  ReservationModel(this.context) {
    _init();
  }

  void _init() async {
    _reservation = await _service.getReservation();
    notifyListeners();
  }

  Tourirst getDefaultTourist() {
    return Tourirst(
      TouristStruct(controller: TextEditingController(), fieldLabel: 'Имя'),
      TouristStruct(controller: TextEditingController(), fieldLabel: 'Фамилия'),
      TouristStruct(
          controller: TextEditingController(), fieldLabel: 'Дата рождения'),
      TouristStruct(
          controller: TextEditingController(), fieldLabel: 'Гражданство'),
      TouristStruct(
          controller: TextEditingController(),
          fieldLabel: 'Номер загранпаспорта'),
      TouristStruct(
          controller: TextEditingController(),
          fieldLabel: 'Срок действия загранпаспорта'),
    );
  }

  void addToruist() {
    touristList.add(getDefaultTourist());
    notifyListeners();
  }

  int totalPrice() {
    final tourReservation = _reservation;
    if (tourReservation == null) return 0;
    return tourReservation.fuelCharge +
        tourReservation.serviceCharge +
        tourReservation.tourPrice;
  }

  String getPayText() {
    return 'Оплатить ${getPriceFormat(totalPrice())} ₽';
  }

  String getPriceInFormat(int price) {
    return '${getPriceFormat(price)} ₽';
  }

  void emailIsValidChanged() {
    String email = emailController.text;
    emailIsValid = RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(email);
    notifyListeners();
  }

  void payReservation() {
    emailIsValidChanged();
    bool hasNotFilledController = false;
    for (var tourist in touristList) {
      _checkControllerToEmpty(tourist.name, hasNotFilledController);
      _checkControllerToEmpty(tourist.surname, hasNotFilledController);
      _checkControllerToEmpty(tourist.birthDate, hasNotFilledController);
      _checkControllerToEmpty(tourist.nationality, hasNotFilledController);
      _checkControllerToEmpty(tourist.docNumber, hasNotFilledController);
      _checkControllerToEmpty(tourist.docExpireDate, hasNotFilledController);
    }
    if (!emailIsValid || hasNotFilledController) return;
    Navigator.of(context).pushNamed(MainNavigationRoutes.checkoutRoute);
  }

  void _checkControllerToEmpty(
      TouristStruct touristStcurt, bool hasNotFilledController) {
    if (touristStcurt.controller.text.isEmpty) {
      if (!hasNotFilledController) {
        hasNotFilledController = !hasNotFilledController;
      }
      touristStcurt.errorText = defaultErrorText();
    } else {
      touristStcurt.errorText = null;
    }
  }

  String defaultErrorText() {
    return 'value is empty';
  }
}
