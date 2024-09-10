class Trip {
  final int id;
  final String tripName;
  final double price;
  final String destination;
  final String requiredAge;
  final int numberOfDays;
  final int maxNumberOfPeople;
  final String tripDetails;
  final String tripProgramme;
  final String fromDate;
  final String toDate;
  final List<String> tripPhotos;
  final List<TripService> tripServices;
  bool fav;

  Trip({
    required this.id,
    required this.tripName,
    required this.price,
    required this.destination,
    required this.requiredAge,
    required this.numberOfDays,
    required this.maxNumberOfPeople,
    required this.tripDetails,
    required this.tripProgramme,
    required this.fromDate,
    required this.toDate,
    required this.tripPhotos,
    required this.tripServices,
    required this.fav,
  });

  factory Trip.fromJson(Map<String, dynamic> json) {
    var tripPhotosList = json['trip_photos'].cast<String>();
    var tripServicesList = (json['trip_services_type'] as List)
        .map((service) => TripService.fromJson(service))
        .toList();

    return Trip(
      id: json['id'],
      tripName: json['trip_name'],
      price: double.parse(json['price']),
      destination: json['destination'],
      requiredAge: json['required_age'],
      numberOfDays: json['number_of_days'],
      maxNumberOfPeople: json['max_number_of_people'],
      tripDetails: json['trip_details'],
      tripProgramme: json['trip_programme'],
      fromDate: json['from_date'],
      toDate: json['to_date'],
      fav: json['isFavorite'],
      tripPhotos: tripPhotosList,
      tripServices: tripServicesList,
    );
  }
}

class TripService {
  final int id;
  final String serviceName;

  TripService({
    required this.id,
    required this.serviceName,
  });

  factory TripService.fromJson(Map<String, dynamic> json) {
    return TripService(
      id: json['id'],
      serviceName: json['service_name'],
    );
  }
}

class FavTrip {
  final int id;
  final String name;
  final String destination;
  final String fromDate;
  final String toDate;
  final List<FavPhotoTrip> tripPhoto;
  bool fav;

  FavTrip(
      {required this.id,
      required this.name,
      required this.destination,
      required this.fromDate,
      required this.toDate,
      required this.tripPhoto,
      required this.fav});
  factory FavTrip.fromJson(Map<String, dynamic> json) {
    return FavTrip(
      id: json['trip_id'],
      name: json['trip_name'],
      destination: json['destination'],
      tripPhoto: (json['trip_photos'] as List<dynamic>)
          .map((photo) => FavPhotoTrip.fromJson(photo))
          .toList(),
      fromDate: json['from_date'],
      toDate: json['to_date'],
      fav: json['isFavorite'],
    );
  }
}

class FavPhotoTrip {
  final String photo;

  FavPhotoTrip({required this.photo});
  factory FavPhotoTrip.fromJson(Map<String, dynamic> json) {
    return FavPhotoTrip(photo: json['photo']);
  }
}
