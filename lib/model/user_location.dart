class UserLocation {
  final String city;
  final String state;
  final String country;
  final String postcode;
  final LocationStreet street;
  final LocationCoordinate coordinate;
  final LocationTimezoneCoordinate timezone;

  UserLocation({
    required this.city,
    required this.state,
    required this.country,
    required this.postcode,
    required this.street,
    required this.coordinate,
    required this.timezone,
  });

  factory UserLocation.fromMap(Map<String, dynamic> json) {
    // final coordinate = LocationCoordinate(
    //   latitude: json['location']['coordinates']['latitude'],
    //   longitude: json['location']['coordinates']['longitude'],
    // );
    final coordinate = LocationCoordinate.fromMap(json['coordinates']);
    // final street = LocationStreet(
    //   name: json['location']['street']['name'],
    //   number: json['location']['street']['number'],
    // );

    final street = LocationStreet.fromMap(json['street']);
    // final timezone = LocationTimezoneCoordinate(
    //   description: json['location']['timezone']['description'],
    //   offset: json['location']['timezone']['offset'],
    // );
    final timezone = LocationTimezoneCoordinate.fromMap(json['street']);
    return UserLocation(
        city: json['location']['city'],
        country: json['location']['country'],
        postcode: json['location']['postcode'].toString(),
        state: json['location']['state'],
        coordinate: coordinate,
        street: street,
        timezone: timezone);
  }
}

class LocationStreet {
  final int number;
  final String name;
  LocationStreet({required this.name, required this.number});

  factory LocationStreet.fromMap(Map<String, dynamic> json) {
    return LocationStreet(
      name: json['name'],
      number: json['number'],
    );
  }
}

class LocationCoordinate {
  final String latitude;
  final String longitude;

  LocationCoordinate({
    required this.latitude,
    required this.longitude,
  });

  factory LocationCoordinate.fromMap(Map<String, dynamic> json) {
    return LocationCoordinate(
      latitude: json['latitude'],
      longitude: json['longitude'],
    );
  }
}

class LocationTimezoneCoordinate {
  final String offset;
  final String description;
  LocationTimezoneCoordinate({
    required this.description,
    required this.offset,
  });
  factory LocationTimezoneCoordinate.fromMap(Map<String, dynamic> json) {
    return LocationTimezoneCoordinate(
      description: json['location']['timezone']['description'],
      offset: json['location']['timezone']['offset'],
    );
  }
}
