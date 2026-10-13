import 'package:dart_oo/gradebook.dart';
import 'package:dart_oo/student.dart';

void main(List<String> arguments) {
  final book = GradeBook('Dart 程序设计', [
    Student('01', '李华', 92),
    Student('02', '王芳', 55),
    Student.fromJson({'id': '03', 'name': '张伟', 'score': 78}),
    Student('04', '刘洋', 85),
    Student('05', '陈静', 61),
  ]);

  print('课程：${book.courseName}，学生数：${book.students.length}');
  print('平均分：${book.average.toStringAsFixed(2)}');
  print('最高分：${book.maxBy.name}（${book.maxBy.score}）');
  print('及格人数：${book.countPassed}');
  print('分档统计：');
  book.groupByGrade().forEach((band, list) {
    final names = list.map((s) => s.name).join('、');
    print('  $band：${list.length} 人（$names）');
  });
  book.printBoard(3);
}
