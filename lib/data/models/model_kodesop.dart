import 'dart:convert';

ModelKodesop modelKodesopFromJson(String str) =>
    ModelKodesop.fromJson(json.decode(str));
String modelKodesopToJson(ModelKodesop data) => json.encode(data.toJson());

class ModelKodesop {
  final String status;
  final List<KodeSop> sop;

  ModelKodesop({
    required this.status,
    required this.sop,
  });

  factory ModelKodesop.fromJson(Map<String, dynamic> json) => ModelKodesop(
        status: json["status"],
        sop: List<KodeSop>.from(json["sop"].map((x) => KodeSop.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "sop": List<dynamic>.from(sop.map((x) => x.toJson())),
      };
}

class KodeSop {
  final String id;
  final String no;
  final String sop;
  final bool cek;

  KodeSop({
    required this.id,
    required this.no,
    required this.sop,
    required this.cek,
  });

  factory KodeSop.fromJson(Map<String, dynamic> json) => KodeSop(
        id: json["id"],
        no: json["no"],
        sop: json["sop"],
        cek: json["cek"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "no": no,
        "sop": sop,
        "cek": cek,
      };
}
