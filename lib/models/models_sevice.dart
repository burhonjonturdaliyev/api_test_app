class MyService {
  int? id;
  String? createdAt;
  Null? createdBy;
  String? updatedAt;
  Null? modifiedBy;
  bool? deleted;
  String? name;
  int? icon;
  String? categoryType;

  MyService(
      {required this.id,
      required this.createdAt,
      required this.createdBy,
      required this.updatedAt,
      required this.modifiedBy,
      required this.deleted,
      required this.name,
      required this.icon,
      required this.categoryType});
}
