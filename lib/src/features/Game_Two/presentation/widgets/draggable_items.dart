import 'package:flutter/material.dart';
import 'package:kids_app/src/features/Game_Two/data/models/item_model.dart';

class DraggableItems extends StatelessWidget {
  final List<ItemModel> items;

  const DraggableItems({Key? key, required this.items}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: items.map((item) {
        return Draggable<ItemModel>(
          data: item,
          childWhenDragging: Icon(item.icon, color: Colors.grey),
          feedback: Icon(item.icon, size: 60),
          child: Icon(item.icon, size: 60),
        );
      }).toList(),
    );
  }
}
