class VetClinic {
  final double lat;
  final double lng;
  final String name;
  final String placeId;
  final double rating;
  final String address;
  final double timing;

  const VetClinic(
      {required this.name,
      required this.address,
      required this.rating,
      required this.placeId,
      required this.lat,
      required this.lng,
      required this.timing});

  factory VetClinic.fromJson(Map<String, dynamic> vetJson) => VetClinic(
      name: vetJson["name"],
      address: vetJson["vicinity"],
      rating: vetJson["rating"].toDouble(),
      placeId: vetJson["place_id"],
      lat: vetJson["geometry"]["location"]["lat"],
      lng: vetJson["geometry"]["location"]["lng"],
      timing: vetJson["opening_hours"]
  );
}
