import 'package:simple_clean_arch/src/utils/nullable.dart';

class AppTask {
  final int? id;
  final String title;
  final String description;
  final DateTime? completedAt;
  final DateTime createdAt;

  const AppTask({
    this.id,
    required this.title,
    required this.description,
    this.completedAt,
    required this.createdAt,
  });

  AppTask.empty() : this(
    title: '',
    description: '',
    createdAt: DateTime.now(),
  );

  copyWith({
    int? id,
    String? title,
    String? description,
    Nullable<DateTime?>? completedAt,
    DateTime? createdAt,
  }) {
    return AppTask(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      completedAt: completedAt == null ? this.completedAt : completedAt.value,
      createdAt: createdAt ?? this.createdAt,
    );
  }
}
