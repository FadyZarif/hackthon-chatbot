class LicenseModel {
  String? userName;
  String? licenseNumber;
  int? violationValue;



  LicenseModel({this.userName, this.licenseNumber, this.violationValue});

  LicenseModel.fromJson(Map<String, dynamic> json)
      : this(
    userName: json['userName'],
    licenseNumber: json['licenseNumber'],
    violationValue: json['violationValue'],

  );

  Map<String, dynamic> toJson() {
    return {
      'userName': userName,
      'licenseNumber': licenseNumber,
      'violationValue': violationValue,

    };
  }
}
