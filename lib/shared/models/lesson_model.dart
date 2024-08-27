class LessonModel {
  LessonModel({
    required this.imgPath,
    required this.title,
  });

  final String imgPath;
  final String title;
}

List<LessonModel> lesson = [
  LessonModel(
    imgPath: 'assets/images/rectangle.png',
    title: 'បទ ពស់លេបកន្ទុយ',
  ),
  LessonModel(
    imgPath: 'assets/images/lesson_2.png',
    title: 'បទ យតិភង្គ',
  ),
  LessonModel(
    imgPath: 'assets/images/rectangle.png',
    title: 'បទ ពស់លេបកន្ទុយ',
  ),
  LessonModel(
    imgPath: 'assets/images/lesson_2.png',
    title: 'បទ យតិភង្គ',
  ),
];
