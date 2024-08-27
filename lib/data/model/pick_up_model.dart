class PickUpModel {
  String package;
  String location;
  String startLocation;
  String endLocation;

  PickUpModel({
    required this.package,
    required this.location,
    required this.startLocation,
    required this.endLocation,
  });
}

final List<PickUpModel> listPickUp = [
  PickUpModel(
    package: '3',
    location: 'Phnom Penh, Cambodia',
    startLocation: 'ទួលគោក',
    endLocation: 'ភ្នំពេញ',
  ),
  PickUpModel(
    package: '6',
    location: 'Phnom Penh, Cambodia',
    startLocation: 'កម្ពុជាក្រោម',
    endLocation: 'ភ្នំពេញ',
  ),
  PickUpModel(
    package: '5',
    location: 'Phnom Penh, Cambodia',
    startLocation: 'បឹងកេងកង',
    endLocation: 'ភ្នំពេញ',
  ),
  PickUpModel(
    package: '3',
    location: 'Phnom Penh, Cambodia',
    startLocation: 'អង្គរជុំវិញ',
    endLocation: 'ភ្នំពេញ',
  ),
  PickUpModel(
    package: '3',
    location: 'Phnom Penh, Cambodia',
    startLocation: 'តាខ្មៅ',
    endLocation: 'ភ្នំពេញ',
  ),
];
