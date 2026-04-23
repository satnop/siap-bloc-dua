class UserModel {
  final String pid;
  final String nama;
  final String kodebagian;
  String? gedung;

  UserModel({
    required this.pid,
    required this.nama,
    required this.kodebagian,
    this.gedung,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      pid: json['pid'],
      nama: json['nama'],
      kodebagian: json['kodebagian'],
      gedung: json['gedung'],
    );
  }
}
