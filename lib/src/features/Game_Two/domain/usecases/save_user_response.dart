import 'package:kids_app/src/features/Game_Two/data/models/item_model.dart';

class SaveUserResponses {
  void call(List<ItemModel> items) {
    for (var item in items) {
      if (item.matched) {
        print("User matched ${item.name} correctly.");
      } else {
        print("User did not match ${item.name}.");
      }
    }
  }
}
