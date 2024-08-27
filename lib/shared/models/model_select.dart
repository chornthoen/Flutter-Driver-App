
class SelectModel {
  final String title;
  final String? svg;
  bool? isClick;

  SelectModel({
    required this.title,
    this.isClick,
    this.svg,
  });
}

final List<SelectModel> listSelect = [
  SelectModel(title: 'ABA KHQR', isClick: false, svg: 'assets/svg/khqr.svg'),
  SelectModel(title: 'Pay by Cash', isClick: false, svg: 'assets/svg/riel.svg'),
];
