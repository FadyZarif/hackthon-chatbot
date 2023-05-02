class TravelModel {
  Entities? entities;
  List<Intents>? intents;
  String? text;

  TravelModel({this.entities, this.intents, this.text});

  TravelModel.fromJson(Map<String, dynamic> json) {
    entities = json['entities'] != null ? new Entities.fromJson(json['entities']) : null;
    if (json['intents'] != null) {
      intents = <Intents>[];
      json['intents'].forEach((v) { intents!.add(new Intents.fromJson(v)); });
    }
    text = json['text'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.entities != null) {
      data['entities'] = this.entities!.toJson();
    }
    if (this.intents != null) {
      data['intents'] = this.intents!.map((v) => v.toJson()).toList();
    }
    data['text'] = this.text;
    return data;
  }
}

class Entities {
  List<ReturnYesReturnYes>? returnYesReturnYes;
  List<StationStation>? stationStation;

  Entities({this.returnYesReturnYes, this.stationStation});

  Entities.fromJson(Map<String, dynamic> json) {
    if (json['returnYes:returnYes'] != null) {
      returnYesReturnYes = <ReturnYesReturnYes>[];
      json['returnYes:returnYes'].forEach((v) { returnYesReturnYes!.add(new ReturnYesReturnYes.fromJson(v)); });
    }
    if (json['station:station'] != null) {
      stationStation = <StationStation>[];
      json['station:station'].forEach((v) { stationStation!.add(new StationStation.fromJson(v)); });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.returnYesReturnYes != null) {
      data['returnYes:returnYes'] = this.returnYesReturnYes!.map((v) => v.toJson()).toList();
    }
    if (this.stationStation != null) {
      data['station:station'] = this.stationStation!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ReturnYesReturnYes {
  String? body;
  double? confidence;
  int? end;
  Entities? entities;
  String? id;
  String? name;
  String? role;
  int? start;
  String? type;
  String? value;

  ReturnYesReturnYes({this.body, this.confidence, this.end, this.entities, this.id, this.name, this.role, this.start, this.type, this.value});

  ReturnYesReturnYes.fromJson(Map<String, dynamic> json) {
    body = json['body'];
    confidence = json['confidence'];
    end = json['end'];
    entities = json['entities'] != null ? new Entities.fromJson(json['entities']) : null;
    id = json['id'];
    name = json['name'];
    role = json['role'];
    start = json['start'];
    type = json['type'];
    value = json['value'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['body'] = this.body;
    data['confidence'] = this.confidence;
    data['end'] = this.end;
    if (this.entities != null) {
      data['entities'] = this.entities!.toJson();
    }
    data['id'] = this.id;
    data['name'] = this.name;
    data['role'] = this.role;
    data['start'] = this.start;
    data['type'] = this.type;
    data['value'] = this.value;
    return data;
  }
}



Map<String, dynamic> toJson() {
  final Map<String, dynamic> data = new Map<String, dynamic>();
  return data;
}


class StationStation {
  String? body;
  double? confidence;
  int? end;
  String? id;
  String? name;
  String? role;
  int? start;
  String? type;
  String? value;

  StationStation({this.body, this.confidence, this.end, this.id, this.name, this.role, this.start, this.type, this.value});

  StationStation.fromJson(Map<String, dynamic> json) {
    body = json['body'];
    confidence = json['confidence'];
    end = json['end'];
    id = json['id'];
    name = json['name'];
    role = json['role'];
    start = json['start'];
    type = json['type'];
    value = json['value'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['body'] = this.body;
    data['confidence'] = this.confidence;
    data['end'] = this.end;
    data['id'] = this.id;
    data['name'] = this.name;
    data['role'] = this.role;
    data['start'] = this.start;
    data['type'] = this.type;
    data['value'] = this.value;
    return data;
  }
}

class Intents {
  double? confidence;
  String? id;
  String? name;

  Intents({this.confidence, this.id, this.name});

  Intents.fromJson(Map<String, dynamic> json) {
    confidence = json['confidence'];
    id = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['confidence'] = this.confidence;
    data['id'] = this.id;
    data['name'] = this.name;
    return data;
  }
}
