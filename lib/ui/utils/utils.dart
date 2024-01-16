import 'package:flutter/material.dart';
import "package:intl/intl.dart";

List<Widget> choiceChips(List<String?> choiceChipsList) {
  List<Widget> chips = [];
  for (int i = 0; i < choiceChipsList.length; i++) {
    Widget item = Chip(
      label: Text(
        choiceChipsList[i] ?? '',
        style: const TextStyle(
          color: Color.fromRGBO(130, 135, 150, 1),
        ),
      ),
      side: const BorderSide(color: Colors.white),
      backgroundColor: const Color.fromRGBO(251, 251, 252, 1),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5.0),
      ),
    );
    chips.add(item);
  }
  return chips;
}

String priceFormatterHotel(int price) {
  final ocy = NumberFormat("#,##0", "en_US");
  return 'от ${ocy.format(price).replaceAll(',', ' ')} ₽';
}

String getPriceFormat(int price) {
  final ocy = NumberFormat("#,##0", "en_US");
  return ocy.format(price).replaceAll(',', ' ');
}
