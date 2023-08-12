// To parse this JSON data, do
//
//     final userModel = userModelFromJson(jsonString);
import 'dart:convert';

UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));

String userModelToJson(UserModel data) => json.encode(data.toJson());

class UserModel {
  Data data;

  UserModel({
    required this.data,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "data": data.toJson(),
      };
}

class Data {
  bool isAdmin;
  String fullName;
  String email;
  String profileImageUrl;
  String gender;
  String phoneNumber;
  GeoLocation? geoLocation; // Make geoLocation nullable
  String address;
  String aadharCardUrl;
  String upiId;
  bool isEligible;

  Data({
    required this.isAdmin,
    required this.fullName,
    required this.email,
    required this.profileImageUrl,
    required this.gender,
    required this.phoneNumber,
    this.geoLocation,
    required this.address,
    required this.aadharCardUrl,
    required this.upiId,
    required this.isEligible,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        isAdmin: json["isAdmin"],
        fullName: json["full_name"],
        email: json["email"],
        profileImageUrl: json["profileImageUrl"],
        gender: json["gender"],
        phoneNumber: json["phoneNumber"] ?? "NA", // Set default value "NA"
        geoLocation: json["geoLocation"] != null
            ? GeoLocation.fromJson(json["geoLocation"])
            : GeoLocation(
                latitude: "NA", longitude: "NA"), // Set default value "NA"
        address: json["address"] ?? "NA", // Set default value "NA"
        aadharCardUrl: json["aadharCardUrl"] ?? "NA", // Set default value "NA"
        upiId: json["upiId"] ?? "NA", // Set default value "NA"
        isEligible: json["isEligible"],
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
