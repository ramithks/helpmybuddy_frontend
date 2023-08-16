// To parse this JSON data, do
//
//     final userModel = userModelFromJson(jsonString);
import 'dart:convert';

UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));

String userModelToJson(UserModel data) => json.encode(data.toJson());

class UserModel {
  final String token;
  final Data data;

  UserModel({
    required this.data,
    required this.token,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        data: Data.fromJson(json["data"]),
        token: json['token']
      );

  Map<String, dynamic> toJson() => {
        "data": data.toJson(),
        'token': token
      };
}

class Data {
  bool? isAdmin;
  String fullName;
  String email;
  String profileImageUrl;
  String? gender;
  String? phoneNumber;
  GeoLocation? geoLocation;
  String? address;
  String? aadharCardUrl;
  String? upiId;
  bool? isEligible;

  Data({
    this.isAdmin,
    required this.fullName,
    required this.email,
    required this.profileImageUrl,
    this.gender,
    this.phoneNumber,
    this.geoLocation,
    this.address,
    this.aadharCardUrl,
    this.upiId,
    this.isEligible,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        isAdmin: json["isAdmin"] ?? false, // Default to false
        fullName: json["full_name"] ?? "NA", // Default to "NA"
        email: json["email"] ?? "NA", // Default to "NA"
        profileImageUrl: json["profileImageUrl"] ?? "NA", // Default to "NA"
        gender: json["gender"] ?? "NA", // Default to "NA"
        phoneNumber: json["phoneNumber"] ?? "NA", // Default to "NA"
        geoLocation: json["geoLocation"] != null
            ? GeoLocation.fromJson(json["geoLocation"])
            : null,
        address: json["address"] ?? "NA",
        aadharCardUrl: json["aadharCardUrl"] ?? "NA",
        upiId: json["upiId"] ?? "NA",
        isEligible: json["isEligible"] ?? false, // Default to false
      );

  Map<String, dynamic> toJson() => {
        "isAdmin": isAdmin,
        "full_name": fullName,
        "email": email,
        "profileImageUrl": profileImageUrl,
        "gender": gender,
        "phoneNumber": phoneNumber,
        "geoLocation": geoLocation?.toJson(), // Convert to JSON if not null
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
        latitude: json["latitude"] ?? "NA", // Set default value "NA"
        longitude: json["longitude"] ?? "NA", // Set default value "NA"
      );

  Map<String, dynamic> toJson() => {
        "latitude": latitude,
        "longitude": longitude,
      };
}
