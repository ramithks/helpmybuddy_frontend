import 'dart:convert';

List<UserModel> usermodelFromJson(String str) {
  final jsonData = json.decode(str);
  return List<UserModel>.from(jsonData.map((user) => UserModel.fromJson(user)));
}

String usermodelToJson(UserModel data) => json.encode(data.toJson());

class UserModel {
  String status;
  Data data;

  UserModel({
    required this.status,
    required this.data,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        status: json["status"],
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "data": data.toJson(),
      };
}

class Data {
  String id;
  String googleId;
  String fullName;
  String email;
  String profileImageUrl;
  String gender;
  String phoneNumber;
  GeoLocation? geoLocation;
  String address;
  String aadharCardUrl;
  String upiId;
  String isEligible;
  int v;

  Data({
    required this.id,
    required this.googleId,
    required this.fullName,
    required this.email,
    this.profileImageUrl = 'NA',
    this.gender = 'NA',
    this.phoneNumber = 'NA',
    this.geoLocation,
    this.address = 'NA',
    this.aadharCardUrl = 'NA',
    this.upiId = 'NA',
    required this.isEligible,
    required this.v,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["_id"],
        googleId: json["googleId"],
        fullName: json["full_name"],
        email: json["email"],
        profileImageUrl: json["profileImageUrl"] ?? 'NA',
        gender: json["gender"] ?? 'NA',
        phoneNumber: json["phoneNumber"] ?? 'NA',
        geoLocation: json["geoLocation"] != null
            ? GeoLocation.fromJson(json["geoLocation"])
            : null,
        address: json["address"] ?? 'NA',
        aadharCardUrl: json["aadharCardUrl"] ?? 'NA',
        upiId: json["upiId"] ?? 'NA',
        isEligible: json["isEligible"],
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "googleId": googleId,
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
        "__v": v,
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
