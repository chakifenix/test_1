// To parse this JSON data, do
//
//     final listRoomModel = listRoomModelFromJson(jsonString);

import 'dart:convert';

ListRoomModel listRoomModelFromJson(String str) =>
    ListRoomModel.fromJson(json.decode(str));

String listRoomModelToJson(ListRoomModel data) => json.encode(data.toJson());

class ListRoomModel {
  List<Room> rooms;

  ListRoomModel({
    required this.rooms,
  });

  factory ListRoomModel.fromJson(Map<String, dynamic> json) => ListRoomModel(
        rooms: List<Room>.from(json["rooms"].map((x) => Room.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "rooms": List<dynamic>.from(rooms.map((x) => x.toJson())),
      };
}

class Room {
  int id;
  String name;
  int price;
  String pricePer;
  List<String> peculiarities;
  List<String> imageUrls;

  Room({
    required this.id,
    required this.name,
    required this.price,
    required this.pricePer,
    required this.peculiarities,
    required this.imageUrls,
  });

  factory Room.fromJson(Map<String, dynamic> json) => Room(
        id: json["id"],
        name: json["name"],
        price: json["price"],
        pricePer: json["price_per"],
        peculiarities: List<String>.from(json["peculiarities"].map((x) => x)),
        imageUrls: List<String>.from(json["image_urls"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "price": price,
        "price_per": pricePer,
        "peculiarities": List<dynamic>.from(peculiarities.map((x) => x)),
        "image_urls": List<dynamic>.from(imageUrls.map((x) => x)),
      };
}
