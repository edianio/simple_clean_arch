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

  copyWith({
    int? id,
    Nullable<String?>? title,
    Nullable<String?>? description,
    Nullable<DateTime?>? completedAt,
    DateTime? createdAt,
  }) {
    return AppTask(
      id: id ?? this.id,
      title: title?.value ?? this.title,
      description: description?.value ?? this.description,
      completedAt: completedAt?.value ?? this.completedAt,
      createdAt: createdAt ?? this.createdAt,
    );
  }
}
