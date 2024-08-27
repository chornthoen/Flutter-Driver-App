

class DropOffModel{
  final String name;
  final String image;
  final String phone;
  final String item;
  final String code;
  final String deliveryAddress;
  final String dropOffLocation;

  DropOffModel({
    required this.name,
    required this.image,
    required this.phone,
    required this.item,
    required this.code,
    required this.deliveryAddress,
    required this.dropOffLocation,
  });
}

final listDropOff = [
  DropOffModel(
    name: 'John Doe',
    image: 'assets/images/profile_null.png',
    phone: '+855 987 654 310',
    item: '5',
    code: '#000444',
    deliveryAddress: '123 Main St, New York, NY 10001, USA',
    dropOffLocation: '123 Main St, New York, NY 10001, USA',
  ),
  DropOffModel(
    name: 'John Doe',
    image: 'assets/images/profile_null.png',
    phone: '+855 987 654 310',
    item: '6',
    code: '#000444',
    deliveryAddress: '123 Main St, New York, NY 10001, USA',
    dropOffLocation: '123 Main St, New York, NY 10001, USA',
  ),
  DropOffModel(
    name: 'John Doe',
    image: 'assets/images/profile_null.png',
    phone: '+855 987 654 310',
    item: '4',
    code: '#000444',
    deliveryAddress: '123 Main St, New York, NY 10001, USA',
    dropOffLocation: '123 Main St, New York, NY 10001, USA',
  ),
];
