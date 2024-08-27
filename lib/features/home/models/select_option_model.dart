

class SelectOptionModel {
  const SelectOptionModel({
    required this.value,
    required this.title,
  });

  final int value;
  final String title;
}


List<SelectOptionModel> listOption = [
  SelectOptionModel(
    value: 1,
    title: 'ABA KHQR',
  ),
  SelectOptionModel(
    value: 2,
    title: 'Pay by Cash',
  ),
];
