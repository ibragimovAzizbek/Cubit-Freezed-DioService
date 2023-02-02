// To parse this JSON data, do
//
//     final userModel = userModelFromJson(jsonString);

import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'user_model.freezed.dart';
part 'user_model.g.dart';

List<UserModel> userModelFromJson(String str) => List<UserModel>.from(json.decode(str).map((x) => UserModel.fromJson(x)));

String userModelToJson(List<UserModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

@freezed
class UserModel with _$UserModel {
    const factory UserModel({
        int? id,
        String? name,
        String? username,
        String? email,
        Address? address,
        String? phone,
        String? website,
        Company? company,
    }) = _UserModel;

    factory UserModel.fromJson(Map<String, dynamic> json) => _$UserModelFromJson(json);
}

@freezed
class Address with _$Address {
    const factory Address({
        String? street,
        String? suite,
        String? city,
        String? zipcode,
        Geo? geo,
    }) = _Address;

    factory Address.fromJson(Map<String, dynamic> json) => _$AddressFromJson(json);
}

@freezed
class Geo with _$Geo {
    const factory Geo({
        String? lat,
        String? lng,
    }) = _Geo;

    factory Geo.fromJson(Map<String, dynamic> json) => _$GeoFromJson(json);
}

@freezed
class Company with _$Company {
    const factory Company({
        String? name,
        String? catchPhrase,
        String? bs,
    }) = _Company;

    factory Company.fromJson(Map<String, dynamic> json) => _$CompanyFromJson(json);
}
