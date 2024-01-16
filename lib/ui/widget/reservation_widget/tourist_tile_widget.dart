import 'package:flutter/material.dart';
import 'package:hotel/domain/entity/tourist.dart';
import 'package:hotel/ui/widget/reservation_widget/reservation_model.dart';
import 'package:provider/provider.dart';

class TouristTileWidget extends StatelessWidget {
  const TouristTileWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final model = context.watch<ReservationModel>();
    List<Widget> touristListWidget = [];
    for (var item in model.touristList) {
      final tile = _TileItemWidget(model.touristList.indexOf(item));
      touristListWidget.add(tile);
      touristListWidget.add(const SizedBox(height: 8));
    }
    return Column(
      children: touristListWidget,
    );
  }
}

class _TileItemWidget extends StatefulWidget {
  final int index;
  const _TileItemWidget(this.index);

  @override
  _TileItemWidgetState createState() => _TileItemWidgetState();
}

class _TileItemWidgetState extends State<_TileItemWidget> {
  bool _customTileExpanded = false;

  @override
  Widget build(BuildContext context) {
    final model = context.read<ReservationModel>();
    final tile = model.touristList[widget.index];
    return Container(
      decoration: const BoxDecoration(color: Colors.white),
      child: ExpansionTile(
        title: Text(
          'Турист №${widget.index + 1}',
          style: const TextStyle(fontSize: 22, fontWeight: FontWeight.w500),
        ),
        trailing: SizedBox(
          width: 32,
          height: 32,
          child: Container(
            decoration: BoxDecoration(
              color: const Color.fromRGBO(13, 114, 255, 0.1),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(
              _customTileExpanded ? Icons.arrow_drop_up : Icons.arrow_drop_down,
            ),
          ),
        ),
        children: [
          _TileTextInputItemWidget(
            touristStruct: tile.name,
          ),
          const SizedBox(height: 8),
          _TileTextInputItemWidget(
            touristStruct: tile.surname,
          ),
          const SizedBox(height: 8),
          _TileTextInputItemWidget(
            touristStruct: tile.birthDate,
          ),
          const SizedBox(height: 8),
          _TileTextInputItemWidget(
            touristStruct: tile.nationality,
          ),
          const SizedBox(height: 8),
          _TileTextInputItemWidget(
            touristStruct: tile.docNumber,
          ),
          const SizedBox(height: 8),
          _TileTextInputItemWidget(
            touristStruct: tile.docExpireDate,
          ),
          const SizedBox(height: 8)
        ],
        onExpansionChanged: (bool expanded) {
          setState(() {
            _customTileExpanded = expanded;
          });
        },
      ),
    );
  }
}

class _TileTextInputItemWidget extends StatelessWidget {
  const _TileTextInputItemWidget({
    required this.touristStruct,
  });

  final TouristStruct touristStruct;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: 8,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: const Color.fromRGBO(246, 246, 249, 1),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: TextField(
          controller: touristStruct.controller,
          keyboardType: TextInputType.text,
          decoration: InputDecoration(
            errorText: touristStruct.errorText,
            border: InputBorder.none,
            errorBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                borderSide: BorderSide(color: Color.fromRGBO(235, 87, 87, 15))),
            labelText: touristStruct.fieldLabel,
            fillColor: Colors.green,
            floatingLabelStyle: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: Color.fromRGBO(169, 171, 183, 1),
            ),
          ),
        ),
      ),
    );
  }
}
