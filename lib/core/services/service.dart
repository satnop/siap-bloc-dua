import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:siap/core/constants/alamat.dart';
import 'package:siap/core/errors/exception.dart';
import 'package:siap/core/services/tokenmgr.dart';
import 'package:siap/data/models/auth/user.dart';
import 'package:siap/data/models/model_barang.dart';
import 'package:siap/data/models/model_kodesop.dart';

import 'package:http/http.dart' show Client;

class SiapApiService {
  Client client = Client();
  final String url = Apis.baseUrl;

  Future<LoginModel?> login(String pid, String pass) async {
    try {
      Map<String, String> header = {
        'Content-type': 'application/json',
        'Accept': 'application/json'
      };
      final respond = await client
          .post(Uri.parse("$url/otentikasi/login"),
              headers: header, body: json.encode({"pid": pid, "pass": pass}))
          .timeout(const Duration(seconds: 5));

      if (respond.statusCode == 200) {
        final data = loginModelFromJson(respond.body);
        TokenManager().setToken(data.accessToken, data.user.kodebagian);
        return data;
      } else {
        throw ("Password Salah");
      }
    } on SocketException {
      throw ("Tidak Ada Internet");
    } on HttpException {
      throw ("Server Error/Mati");
    } on TimeoutException {
      throw ("Server Error/Mati");
    } catch (e) {
      throw ("$e");
    }
  }

  Future<List<Barang>> getBarang(String id, String token) async {
    Map<String, String> header = {
      'Content-type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token'
    };
    try {
      final respond = await client.get(Uri.parse("$url/getbarang/$id/$token"),
          headers: header);
      if (respond.statusCode == 200) {
        List<dynamic> body = jsonDecode(respond.body)['data'];
        List<Barang> tbbarang =
            body.map((dynamic item) => Barang.fromJson(item)).toList();

        return tbbarang;
      } else if (respond.statusCode == 401) {
        throw UnauthorizedException('TokenExpired');
      } else if (respond.statusCode == 404) {
        throw UnauthorizedException('NODATA');
      }
    } catch (e) {
      rethrow;
    }
    return [];
  }

//gpt sarankan list barang tidak boleh null, hilangkan ?
  Future<List<Barang>> getbyBarkod(
      String like, String kate, String token) async {
    Map<String, String> header = {
      'Content-type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token'
    };
    final response = await client
        .get(Uri.parse("$url/getbybarkod/$like/$kate/$token"), headers: header);
    if (response.statusCode == 200) {
      final List bynama = jsonDecode(response.body)['data'] ?? [];
      return bynama.map((json) => Barang.fromJson(json)).where((sel) {
        final filter = sel.nobarcode ?? '';
        return filter.contains(like.toUpperCase());
      }).toList();
    } else {
      throw Exception("Tidak Ketemu");
    }
  }

  Future<List<KodeSop>> getkodeSop(String mtg, String token) async {
    Map<String, String> header = {
      'Content-type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token'
    };

    try {
      final respond = await client.get(Uri.parse("$url/getkodesop/$mtg/$token"),
          headers: header);
      if (respond.statusCode == 200) {
        List<dynamic> body = jsonDecode(respond.body)['data'];
        List<KodeSop> smp =
            body.map((dynamic item) => KodeSop.fromJson(item)).toList();
        return smp;
      } else if (respond.statusCode == 401) {
        throw UnauthorizedException('TokenExpired');
      } else {
        return [];
      }
    } on SocketException {
      await Future.delayed(const Duration(milliseconds: 1800));
      throw ("NOINTERNET");
    }
  }

  Future<bool> saveMaintenance(String barkod, String mtg, String pid,
      Map<String, String> cek, String ket) async {
    Map<String, String> header = {
      'Content-type': 'application/json',
      'Accept': 'application/json',
    };
    try {
      // final jsonPayload = json.encode({
      //   "barcode": barkod,
      //   "pid": pid,
      //   "mtg": mtg,
      //   "cek": cek, // Map<String, String> will be converted to JSON object
      //   "ket": ket
      // });
      // print('JSON Payload: $jsonPayload');
      final respond = await client.post(Uri.parse("$url/savemaintenance"),
          headers: header,
          body: json.encode({
            "barcode": barkod,
            "pid": pid,
            "mtg": mtg,
            "cek": cek,
            "ket": ket
          }));
      if (respond.statusCode == 200) {
        var data = jsonDecode(respond.body)["message"];
        if (data == "Success") {
          return true;
        } else {
          //print('Server Error: ${respond.statusCode} - ${respond.body}');
          return false;
        }
      } else {
        return false;
      }
    } catch (e) {
      rethrow;
    }
  }
}
