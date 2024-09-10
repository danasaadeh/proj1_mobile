class RoomInfo {
  final String price, image, name, description, sleeps, beds;
  final List<String> pictures;
  final List<String> fetuers;

  RoomInfo(
      {required this.price,
      required this.beds,
      required this.sleeps,
      required this.fetuers,
      required this.image,
      required this.name,
      required this.description,
      required this.pictures});
}
