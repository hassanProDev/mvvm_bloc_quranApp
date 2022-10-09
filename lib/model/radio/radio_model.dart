class RadioModel {
  List<Radios>? radios;

  RadioModel({this.radios});

  RadioModel.fromJson(Map<String, dynamic> json) {
    if (json['radios'] != null) {
      radios = <Radios>[];
      json['radios'].forEach((v) {
        radios!.add(new Radios.fromJson(v));
      });
    }
  }
}

class Radios {
  String? name;
  String? radioUrl;

  Radios({this.name, this.radioUrl});

  Radios.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    radioUrl = json['radio_url'];
  }
}
