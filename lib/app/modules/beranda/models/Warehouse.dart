import 'dart:convert';

Warehouse warehouseFromJson(String str) => Warehouse.fromJson(json.decode(str));

String warehouseToJson(Warehouse data) => json.encode(data.toJson());

class Warehouse {
  int? id;
  String? code;
  String? name;
  String? owner;
  String? email;
  String? pic;
  String? contact;
  String? address;
  String? longitude;
  String? latitude;
  String? agenId;
  String? kurirId;
  String? category;
  String? isActive;
  String? createdAt;
  String? updatedAt;
  String? statusPick;

  Warehouse({
    this.id,
    this.code,
    this.name,
    this.owner,
    this.email,
    this.pic,
    this.contact,
    this.address,
    this.longitude,
    this.latitude,
    this.agenId,
    this.kurirId,
    this.category,
    this.isActive,
    this.createdAt,
    this.updatedAt,
    this.statusPick,
  });

  factory Warehouse.fromJson(Map<String, dynamic> json) => Warehouse(
        id: json["id"],
        code: json["code"],
        name: json["name"],
        owner: json["owner"],
        email: json["email"],
        pic: json["pic"],
        contact: json["contact"],
        address: json["address"],
        longitude: json["longitude"],
        latitude: json["latitude"],
        category: json["category"],
        agenId: json["agen_id"],
        kurirId: json["kurir_id"],
        isActive: json["is_active"],
        statusPick: json["status_pick"],
        createdAt: json["created_at"],
        updatedAt: json["updated_at"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "code": code,
        "name": name,
        "owner": owner,
        "email": email,
        "pic": pic,
        "contact": contact,
        "address": address,
        "longitude": longitude,
        "latitude": latitude,
        "category": category,
        "agen_id": agenId,
        "kurir_id": kurirId,
        "is_active": isActive,
        "status_pick": statusPick,
        "created_at": createdAt,
        "updated_at": updatedAt,
      };
}
