/**
 * Pet Model Class
 */

class Pet {
  final String name;
  final int age;
  final double weight;
  final String breed;
  List<String> vaccinationDates = [];

  Pet({
    required this.name,
    required this.age,
    required this.weight,
    required this.breed,
  });

  void addVaccination(String vaccinationDate) {
    vaccinationDates.add(vaccinationDate);
  }

  factory Pet.fromJson(Map<String, dynamic> petJson, {petName}) => Pet(
    name: petJson["petName"],
    age: petJson["petAge"],
    weight: petJson["petWeight"],
    breed: petJson["petBreed"],
  );

  List<String> getVaccinationDate(Map<String, dynamic> petJson) =>
      petJson["vaccination"];
}
