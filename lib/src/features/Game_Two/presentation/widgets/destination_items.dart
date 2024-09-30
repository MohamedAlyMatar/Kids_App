import 'package:flutter/material.dart';
import 'package:kids_app/src/features/Game_Two/data/models/item_model.dart';

class DestinationItems extends StatelessWidget {
  final List<ItemModel> items;

  const DestinationItems({Key? key, required this.items}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 405,
      width: 200,
      decoration: const BoxDecoration(
        color: Colors.blue,
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      child: Wrap(
        direction: Axis.vertical,
        alignment: WrapAlignment.start,
        spacing: 0.1,
        runSpacing: 0.1,
        children: items.map((item) {
          return DragTarget<ItemModel>(
            onAccept: (receivedItem) {
              // Handle the accepted item
            },
            builder: (context, acceptedItems, rejectedItems) => Container(
              margin: const EdgeInsets.all(10),
              padding: const EdgeInsets.all(10),
              height: 80,
              width: 80,
              decoration: BoxDecoration(
                color: item.accepting ? Colors.white : Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              alignment: Alignment.center,
              child: item.matched
                  ? Icon(item.icon, color: Colors.greenAccent, size: 60)
                  : Text(
                      item.name,
                      style: const TextStyle(
                        fontSize: 18,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
