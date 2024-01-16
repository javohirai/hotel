import 'package:flutter/material.dart';
import 'package:hotel/ui/widget/reservation_widget/reservation_model.dart';
import 'package:provider/provider.dart';

class TouristAddWidget extends StatelessWidget {
  const TouristAddWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final model = context.read<ReservationModel>();
    return Container(
      decoration: model.containerDecoration,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 8,
        ),
        child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
          const Expanded(
            child: Text(
              'Добавить туриста',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Container(
            width: 32,
            height: 32,
            decoration: BoxDecoration(
              color: const Color.fromRGBO(13, 114, 255, 1),
              borderRadius: BorderRadius.circular(12),
            ),
            child: IconButton(
              iconSize: 16,
              onPressed: () {
                model.addToruist();
              },
              icon: const Icon(Icons.add),
              color: Colors.white,
            ),
          ),
        ]),
      ),
    );
  }
}
