// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

Welcome welcomeFromJson(String str) => Welcome.fromJson(json.decode(str));

String welcomeToJson(Welcome data) => json.encode(data.toJson());

class Welcome {
  Welcome({
    required this.success,
    required this.message,
    required this.object,
  });

  bool success;
  String message;
  List<List<Object>> object;

  factory Welcome.fromJson(Map<String, dynamic> json) => Welcome(
        success: json["success"],
        message: json["message"],
        object: List<List<Object>>.from(json["object"]
            .map((x) => List<Object>.from(x.map((x) => Object.fromJson(x))))),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "message": message,
        "object": List<dynamic>.from(
            object.map((x) => List<dynamic>.from(x.map((x) => x.toJson())))),
      };
}

class Object {
  Object({
    required this.id,
    required this.createdAt,
    this.createdBy,
    required this.updatedAt,
    this.modifiedBy,
    required this.deleted,
    required this.userId,
    required this.status,
    required this.dialogs,
  });

  int id;
  DateTime createdAt;
  dynamic createdBy;
  DateTime updatedAt;
  dynamic modifiedBy;
  bool deleted;
  int userId;
  String status;
  List<Dialog> dialogs;

  factory Object.fromJson(Map<String, dynamic> json) => Object(
        id: json["id"],
        createdAt: DateTime.parse(json["createdAt"]),
        createdBy: json["createdBy"],
        updatedAt: DateTime.parse(json["updatedAt"]),
        modifiedBy: json["modifiedBy"],
        deleted: json["deleted"],
        userId: json["userId"],
        status: json["status"],
        dialogs:
            List<Dialog>.from(json["dialogs"].map((x) => Dialog.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "createdAt": createdAt.toIso8601String(),
        "createdBy": createdBy,
        "updatedAt": updatedAt.toIso8601String(),
        "modifiedBy": modifiedBy,
        "deleted": deleted,
        "userId": userId,
        "status": status,
        "dialogs": List<dynamic>.from(dialogs.map((x) => x.toJson())),
      };
}

class Dialog {
  Dialog({
    required this.createdAt,
    required this.userId,
    required this.fistName,
    required this.lastName,
    required this.accountType,
    required this.message,
  });

  DateTime createdAt;
  int userId;
  String fistName;
  String lastName;
  String accountType;
  String message;

  factory Dialog.fromJson(Map<String, dynamic> json) => Dialog(
        createdAt: DateTime.parse(json["createdAt"]),
        userId: json["userId"],
        fistName: json["fistName"],
        lastName: json["lastName"],
        accountType: json["accountType"],
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "createdAt": createdAt.toIso8601String(),
        "userId": userId,
        "fistName": fistName,
        "lastName": lastName,
        "accountType": accountType,
        "message": message,
      };
}
