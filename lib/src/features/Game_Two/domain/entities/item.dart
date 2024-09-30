class Item {
  final String name;
  final String value;
  final bool matched;

  Item({
    required this.name,
    required this.value,
    this.matched = false,
  });
}
