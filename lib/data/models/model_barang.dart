class ModelBarang {
  final String status;
  final List<Barang> data;

  ModelBarang({
    required this.status,
    required this.data,
  });

  factory ModelBarang.fromJson(Map<String, dynamic> json) => ModelBarang(
        status: json["status"],
        data: List<Barang>.from(json["data"].map((x) => Barang.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class Barang {
  String? id;
  String namabarang;
  String? klasifikasi;
  String? idkategori;
  String? kategori;
  String? model;
  String? merek;
  String? nomorseri;
  String? nobarcode;
  String? statusbarang;
  String? lokasi;
  String? idlokasi;
  String? tglbeli;
  String? tgldatang;
  String? tglexpired;
  String? origin;
  String? po;
  String? gambar;
  String? urlGbr;
  String? admin;
  String? dateupdate;
  String? usern;
  String mtgid;
  String ceklist;

  Barang({
    required this.id,
    required this.namabarang,
    required this.klasifikasi,
    required this.idkategori,
    required this.kategori,
    required this.model,
    required this.merek,
    required this.nomorseri,
    required this.nobarcode,
    required this.statusbarang,
    required this.lokasi,
    required this.idlokasi,
    required this.tglbeli,
    required this.tgldatang,
    required this.tglexpired,
    required this.origin,
    required this.po,
    required this.gambar,
    required this.urlGbr,
    required this.admin,
    required this.dateupdate,
    required this.usern,
    required this.mtgid,
    required this.ceklist,
  });

  factory Barang.fromJson(Map<String, dynamic> json) => Barang(
        id: json["id"],
        namabarang: json["namabarang"] ?? '',
        klasifikasi: json["klasifikasi"],
        idkategori: json["idkategori"],
        kategori: json["kategori"],
        model: json["model"],
        merek: json["merek"],
        nomorseri: json["nomorseri"],
        nobarcode: json["nobarcode"],
        statusbarang: json["statusbarang"],
        idlokasi: json["idlokasi"],
        lokasi: json["lokasi"],
        tglbeli: json["tglbeli"],
        tgldatang: json["tgldatang"],
        tglexpired: json["tglexpired"],
        origin: json["origin"],
        po: json["po"],
        mtgid: json["mtg_id"] ?? '',
        ceklist: json["ceklist"] ?? 'Belum Ada',
        gambar: json["gambar"],
        urlGbr: json["url_gbr"],
        admin: json["admin"],
        dateupdate: json["dateupdate"],
        usern: json["usern"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "namabarang": namabarang,
        "klasifikasi": klasifikasi,
        "idkategori": idkategori,
        "kategori": kategori,
        "model": model,
        "merek": merek,
        "nomorseri": nomorseri,
        "nobarcode": nobarcode,
        "statusbarang": statusbarang,
        "idlokasi": idlokasi,
        "lokasi": lokasi,
        "tglbeli": tglbeli,
        "tgldatang": tgldatang,
        "tglexpired": tglexpired,
        "origin": origin,
        "po": po,
        "gambar": gambar,
        "url_gbr": urlGbr,
        "admin": admin,
        "mtgid": mtgid,
        "ceklist": ceklist,
        "dateupdate": dateupdate,
        "usern": usern,
      };
}
