// To parse this JSON data, do
//
//     final userModel = userModelFromJson(jsonString);

import 'dart:convert';

UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));

String userModelToJson(UserModel data) => json.encode(data.toJson());

class UserModel {
  String messege;
  Data data;

  UserModel({
    required this.messege,
    required this.data,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        messege: json["messege"],
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "messege": messege,
        "data": data.toJson(),
      };
}

class Data {
  String id;
  String fullName;
  String email;
  String profileImageUrl;
  String? gender;
  String? phoneNumber;
  GeoLocation? geoLocation;
  String? address;
  String? aadharCardUrl;
  String? upiId;
  bool isEligible;

  Data({
    required this.id,
    required this.fullName,
    required this.email,
    required this.profileImageUrl,
    this.gender,
    this.phoneNumber,
    this.geoLocation,
    this.address,
    this.aadharCardUrl,
    this.upiId,
    required this.isEligible,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["_id"],
        fullName: json["full_name"],
        email: json["email"],
        profileImageUrl: json["profileImageUrl"],
        gender: json["gender"] ?? 'NA',
        phoneNumber: json["phoneNumber"] ?? 'NA',
        geoLocation: json["geoLocation"] != null
            ? GeoLocation.fromJson(json["geoLocation"])
            : null,
        address: json["address"] ?? 'NA',
        aadharCardUrl: json["aadharCardUrl"] ?? 'NA',
        upiId: json["upiId"] ?? 'NA',
        isEligible: json["isEligible"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "full_name": fullName,
        "email": email,
        "profileImageUrl": profileImageUrl,
        "gender": gender,
        "phoneNumber": phoneNumber,
        "geoLocation": geoLocation?.toJson(),
        "address": address,
        "aadharCardUrl": aadharCardUrl,
        "upiId": upiId,
        "isEligible": isEligible,
      };
}

class GeoLocation {
  String latitude;
  String longitude;

  GeoLocation({
    required this.latitude,
    required this.longitude,
  });

  factory GeoLocation.fromJson(Map<String, dynamic> json) => GeoLocation(
        latitude: json["latitude"],
        longitude: json["longitude"],
      );

  Map<String, dynamic> toJson() => {
        "latitude": latitude,
        "longitude": longitude,
      };
}
