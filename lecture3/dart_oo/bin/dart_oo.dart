import 'package:dart_oo/gradebook.dart';
import 'package:dart_oo/student.dart';

void main(List<String> arguments) {
  final book = GradeBook('Dart 程序设计', [
    Student('01', '李华', 92),
    Student('02', '王芳', 55),
    Student.fromJson({'id': '03', 'name': '张伟', 'score': 78}),
  ]);
  print('课程：${book.courseName}，学生数：${book.students.length}');
  for (final s in book.students) {
    print(s);
  }
}
