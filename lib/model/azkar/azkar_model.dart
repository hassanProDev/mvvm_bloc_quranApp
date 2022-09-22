class AzkarModel {
  String id;
  String zekr;

  AzkarModel({required this.id, required this.zekr});

  AzkarModel.fromJson(Map<String, dynamic> json)
      : this(
            id: json['id'] ?? '' as String, zekr: json['zekr'] ?? '' as String);

  Map<String, dynamic> toJson() {
    return {'id': id, 'zekr': zekr};
  }
}
