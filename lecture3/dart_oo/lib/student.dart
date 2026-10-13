/// 学生模型：封装学号、姓名与成绩。
///
/// 字段通过 getter/setter 暴露，成绩私有（下划线前缀），
/// setter 带范围校验；提供命名构造函数 [Student.fromJson] 用于
/// 从 Map/JSON 构造对象。
class Student {
  final String id;
  final String name;
  double _score; // 私有：下划线前缀，库外不可直接访问

  Student(this.id, this.name, [this._score = 0]);

  /// 命名构造函数：从 JSON/Map 造对象的标准入口。
  /// 初始化列表（冒号后）在构造体执行前运行。
  Student.fromJson(Map<String, dynamic> json)
      : id = json['id'] as String,
        name = json['name'] as String,
        _score = (json['score'] as num).toDouble();

  double get score => _score;

  /// setter 带校验：越界直接抛 ArgumentError。
  set score(double v) {
    if (v < 0 || v > 100) throw ArgumentError('分数越界: $v');
    _score = v;
  }

  bool get passed => _score >= 60;

  /// 优良中差分档，供 groupByGrade 使用。
  String get gradeBand {
    if (_score >= 90) return '优';
    if (_score >= 80) return '良';
    if (_score >= 60) return '中';
    return '差';
  }

  @override
  String toString() => 'Student(id: $id, name: $name, score: $_score)';
}
