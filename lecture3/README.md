# lecture3 — Dart 语言基础二：面向对象与集合

第 5 周课堂作业三。课堂案例 `dart_oo` 复现 + 自主实践。

## 项目结构

```
dart_oo/                 # dart create 生成的命令行项目
├── bin/dart_oo.dart     # 入口：构造成绩册并输出全部统计
├── lib/student.dart     # Student 类（命名构造 fromJson、getter、校验 setter）
├── lib/gradebook.dart   # GradeBook 类（集合链式统计）
├── lib/logger.dart      # Logger mixin（日志能力）
├── lib/honor_roll.dart  # HonorRoll mixin（光荣榜：mixin 替代继承的改造）
└── test/gradebook_test.dart  # test 包单元测试（正常 + 异常路径）
```

## 运行

```bash
cd dart_oo
dart run        # 输出成绩册统计
dart test       # 运行单元测试
```

## 完成要点

- 类设计：字段私有封装、命名构造函数 `Student.fromJson`、带校验的 score setter
- 集合统计链：`average` / `maxBy` / `countPassed` / `groupByGrade` 全部用
  where/map/fold 等链式方法实现，无手写 for 循环；另有用 5 个以上链式方法
  组合实现的 `topNames` 光荣榜统计
- mixin：`Logger` 日志 mixin 混入 GradeBook；`HonorRoll` 由继承一层改造为 mixin
  （改造前后对照见提交历史 `refactor: replace HonorRoll inheritance with mixin`）
- 单元测试：test/ 下覆盖正常统计路径与越界分数异常路径
- AI 使用：全程使用 TraeCode（Kimi-K3）辅助生成，所有代码经 `dart run` /
  `dart test` 人工验证，详见进度报告第七节 AI 使用记录
