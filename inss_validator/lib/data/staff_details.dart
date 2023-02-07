// To parse this JSON data, do
//
//     final stafDetails = stafDetailsFromJson(jsonString);

import 'dart:convert';

StafDetails stafDetailsFromJson(String str) =>
    StafDetails.fromJson(json.decode(str));

String stafDetailsToJson(StafDetails data) => json.encode(data.toJson());

class StafDetails {
  StafDetails(
      {required this.id,
      required this.name,
      required this.position,
      required this.code,
      required this.cashPaidStaff,
      required this.startDate,
      required this.birthDate,
      required this.idNumbers,
      required this.inssNum,
      required this.category,
      required this.gender,
      required this.bloodType,
      required this.location,
      required this.municipality,
      required this.dutyOcation,
      required this.teamSection,
      required this.opsWadSupport,
      required this.donor,
      required this.baseSalary});

  int id;
  String name;
  String position;
  String code;
  String cashPaidStaff;
  String startDate;
  String birthDate;
  String idNumbers;
  String inssNum;
  String category;
  String gender;
  String bloodType;
  String location;
  String municipality;
  String dutyOcation;
  String teamSection;
  String opsWadSupport;
  String donor;
  int baseSalary;

  factory StafDetails.fromJson(Map<String, dynamic> json) => StafDetails(
        id: jsonDecode(json["id"]),
        name: json["name"],
        position: json["position"],
        code: json["code"],
        cashPaidStaff: json["cashPaidStaff"],
        startDate: json["startDate"],
        birthDate: json["birthDate"],
        idNumbers: json["idNumbers"],
        inssNum: json["inssNum"],
        category: json["category"],
        gender: json["gender"],
        bloodType: json["bloodType"],
        location: json["location"],
        municipality: json["municipality"],
        dutyOcation: json["dutyOcation"],
        teamSection: json["teamSection"],
        opsWadSupport: json["opsWadSupport"],
        donor: json["donor"],
        baseSalary: jsonDecode(json["baseSalary"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "position": position,
        "code": code,
        "cash_paid_staff": cashPaidStaff,
        "start_date": startDate,
        "birth_date": birthDate,
        "id_numbers": idNumbers,
        "inss_num": inssNum,
        "category": category,
        "gender": gender,
        "blood_type": bloodType,
        "location": location,
        "municipality": municipality,
        "duty_ocation": dutyOcation,
        "team_Section": teamSection,
        "ops_wad_support": opsWadSupport,
        "donor": donor,
        "baseSalary": baseSalary,
      };
}
