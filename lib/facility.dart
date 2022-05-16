class Facility {
  final String facilityName;
  final String operatingTime;
  final String contactNumber;
  final String location;
  final String? extraInfo;
  Facility(
      {required this.facilityName,
      required this.operatingTime,
      required this.contactNumber,
      required this.location,
      this.extraInfo});
  factory Facility.fromJson(Map<String, dynamic> json) =>
      _facilityFromJson(json);
  Map<String, dynamic> toJson() => _facilityToJson(this);
}

Facility _facilityFromJson(Map<String, dynamic> json) {
  return Facility(
      facilityName: json['facilityName'] as String,
      operatingTime: json['operatingTime'] as String,
      contactNumber: json['contactNumber'] as String,
      location: json['location'] as String,
      extraInfo: json['extraInfo'] as String?);
}

Map<String, dynamic> _facilityToJson(Facility instance) => <String, dynamic>{
      'facilityName': instance.facilityName,
      'operatingTime': instance.operatingTime,
      'contactNumber': instance.contactNumber,
      'location': instance.location,
      'extraInfo': instance.extraInfo
    };
