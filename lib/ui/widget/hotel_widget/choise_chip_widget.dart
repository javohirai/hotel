import 'package:hotel/ui/utils/utils.dart';
import 'package:flutter/material.dart';

class ChoiceChipsWidget extends StatelessWidget {
  final List<String> peculiarities;
  const ChoiceChipsWidget(this.peculiarities, {super.key});

  @override
  Widget build(BuildContext context){
    return SizedBox(
      width: double.infinity,
      child: Wrap(
        crossAxisAlignment: WrapCrossAlignment.center,
        spacing: 4.0, // gap between adjacent chips
        children: choiceChips(peculiarities),
      ),
    );
  }
}