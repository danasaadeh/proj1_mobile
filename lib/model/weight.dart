class Weight {
  int id;
  final String name;
  Weight({required this.id, required this.name});
  factory Weight.fromjson(jsonData) {
    return Weight(id: jsonData['id'], name: jsonData['name']);
  }
}
