import 'package:dart_oo/gradebook.dart';
import 'package:dart_oo/student.dart';
import 'package:test/test.dart';

void main() {
  group('GradeBook 统计（正常路径）', () {
    final book = GradeBook('Dart 程序设计', [
      Student('01', '李华', 92),
      Student('02', '王芳', 55),
      Student('03', '张伟', 78),
    ]);

    test('平均分 / 最高分 / 及格人数统计正确', () {
      expect(book.average, closeTo(75.0, 1e-9));
      expect(book.maxBy.name, '李华');
      expect(book.countPassed, 2);
    });

    test('groupByGrade 按优良中差分档正确', () {
      final grouped = book.groupByGrade();
      expect(grouped['优']!.single.name, '李华');
      expect(grouped['中']!.single.name, '张伟');
      expect(grouped['差']!.single.name, '王芳');
    });

    test('topNames 链式统计：降序且只含及格者', () {
      expect(book.topNames(2), ['李华(92)', '张伟(78)']);
      expect(book.topNames(5).length, 2); // 王芳不及格被 where 过滤
    });
  });

  group('Student 封装（异常路径）', () {
    test('score setter 越界抛 ArgumentError', () {
      final s = Student('09', '测试', 80);
      expect(() => s.score = 120, throwsArgumentError);
      expect(() => s.score = -1, throwsArgumentError);
      expect(s.score, 80); // 原值未被破坏
    });

    test('fromJson 命名构造解析正确', () {
      final s = Student.fromJson({'id': '07', 'name': '赵六', 'score': 88});
      expect(s.id, '07');
      expect(s.name, '赵六');
      expect(s.score, 88.0);
      expect(s.passed, isTrue);
    });
  });
}
