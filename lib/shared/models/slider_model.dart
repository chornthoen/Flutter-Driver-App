class SliderModels {
  SliderModels({required this.imgPath, required this.index});
  final String imgPath;
  final int index;
}

List<SliderModels> slider = [
  SliderModels(imgPath: 'assets/images/slider_1.png', index: 0),
  SliderModels(imgPath: 'assets/images/slider_2.png', index: 1),
  SliderModels(imgPath: 'assets/images/slider_3.png', index: 2),
];
