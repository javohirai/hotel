import 'package:flutter/material.dart';
import 'package:hotel/domain/entity/hotel.dart';
import 'package:hotel/ui/widget/checkout_widget/checkout_widget.dart';
import 'package:hotel/ui/widget/hotel_room_widget/hotel_room_model.dart';
import 'package:hotel/ui/widget/hotel_room_widget/hotel_room_widget.dart';
import 'package:hotel/ui/widget/hotel_widget/hotel_model.dart';
import 'package:hotel/ui/widget/hotel_widget/hotel_widget.dart';
import 'package:hotel/ui/widget/reservation_widget/reservation_model.dart';
import 'package:hotel/ui/widget/reservation_widget/reservation_widget.dart';
import 'package:provider/provider.dart';

abstract class MainNavigationRoutes {
  static const initialRoute = '/';
  static const hotelRoomRoute = '/hotel_room';
  static const reservationRoute = '/reservation';
  static const checkoutRoute = '/checkout';
}

class MainNavigation {
  static Map<String, WidgetBuilder> routes = {
    MainNavigationRoutes.initialRoute: (context) => ChangeNotifierProvider(
          create: (context) => HotelModel(context),
          child: const HotelWidget(),
        ),
    MainNavigationRoutes.reservationRoute: (context) => ChangeNotifierProvider(
          create: (context) => ReservationModel(context),
          child: const ReservationWidget(),
        ),
    MainNavigationRoutes.checkoutRoute: (context) => const CheckOutWidget(),
  };

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    WidgetBuilder builder = (context) {
      return const Scaffold(
        body: Center(child: Text('Route not found')),
      );
    };
    switch (settings.name) {
      case MainNavigationRoutes.hotelRoomRoute:
        var hotel = settings.arguments as Hotel;
        builder = (context) {
          return ChangeNotifierProvider(
            create: (context) => HotelRoomModel(context, hotel),
            child: const HotelRoomWidget(),
          );
        };
    }
    return MaterialPageRoute(builder: builder);
  }
}
