import 'package:isar/isar.dart';
import 'package:simple_clean_arch/src/domain/task/entities/app_task.dart';

part 'app_task_dto.g.dart';

@collection
class AppTaskDto {
  final Id id;
  final String title;
  final String description;
  final DateTime? completedAt;
  final DateTime createdAt;

  const AppTaskDto({
    this.id = Isar.autoIncrement,
    required this.title,
    required this.description,
    this.completedAt,
    required this.createdAt,
  });

  factory AppTaskDto.fromJson(Map<String, dynamic> json) => AppTaskDto(
    id: json["id"],
    title: json["title"],
    description: json["description"],
    completedAt: json["completedAt"],
    createdAt: json["createdAt"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
    "description": description,
    "completedAt": completedAt,
    "createdAt": createdAt,
  };
  
  factory AppTaskDto.fromEntity(AppTask entity) => AppTaskDto(
    id: entity.id ?? Isar.autoIncrement,
    title: entity.title,
    description: entity.description,
    completedAt: entity.completedAt,
    createdAt: entity.createdAt,
  );

  AppTask toEntity() => AppTask(
    id: id,
    title: title,
    description: description,
    completedAt: completedAt,
    createdAt: createdAt,
  );
}
