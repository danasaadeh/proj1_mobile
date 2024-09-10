class User {
  final String name;
  final String email;

  final Nation nationality;
  final String age;
  final String phone;
  final int gender_id;
  final bool wallet;

  User({
    required this.name,
    required this.email,
    required this.nationality,
    required this.age,
    required this.phone,
    required this.gender_id,
    required this.wallet,
  });
  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      name: json['name'],
      email: json['email'],
      nationality: Nation.fromJson(json['nationality']),
      age: json['age'],
      phone: json['phone'],
      gender_id: json['gender_id'],
      wallet: json['wallet_value'],
    );
  }
}

class Gender {
  final int id;
  final String name;
  Gender({required this.id, required this.name});
  factory Gender.fromjson(jsonData) {
    return Gender(id: jsonData['id'], name: jsonData['name']);
  }
}

class Nation {
  final int id;
  final String nation;

  Nation({
    required this.id,
    required this.nation,
  });
  factory Nation.fromJson(dynamic json) {
    if (json is Map<String, dynamic>) {
      return Nation(
        id: json['id'],
        nation: json['nationality'],
      );
    } else if (json is List<dynamic>) {
      return Nation(
        id: 0,
        nation: '',
      );
    } else {
      throw Exception('Invalid nationality format: $json');
    }
  }
}
