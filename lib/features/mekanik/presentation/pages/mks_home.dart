import 'package:flutter/material.dart';
import 'package:siap/core/constants/constan.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:siap/core/services/local_storage_service.dart';
import 'package:siap/features/barang/presentation/pages/scan_manual.dart';
import 'package:siap/features/login/presentation/pages/login_page.dart';
import 'package:siap/utils/menu.dart';

class MksHome extends StatelessWidget {
  const MksHome({super.key});

  @override
  Widget build(BuildContext context) {
    final linkGbr = "https://example.com/profile.jpg";
    final storage = LocalStorageService();

    return FutureBuilder(
      future: Future.wait([storage.getKodebagian(), storage.getNama()]),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return const Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        }
        final kodebagian = snapshot.data![0] ?? '';
        final nama = snapshot.data![1] ?? '';
        return SafeArea(
          child: Scaffold(
            appBar: AppBar(
              elevation: 0.25,
              backgroundColor: Colors.white,
              flexibleSpace: Container(
                padding: const EdgeInsets.only(left: 16, right: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Image.asset(
                      'assets/images/logo.png',
                      height: 100,
                      width: 150,
                    ),
                    Container(
                      color: Colors.transparent,
                      child: Row(
                        children: [
                          Image.asset(
                            "assets/images/kerja.png",
                            height: 100,
                            width: 150,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            backgroundColor: Colors.white,
            body: Container(
              color: Colors.transparent,
              child: ListView(
                physics: const ClampingScrollPhysics(),
                children: [
                  Container(
                    padding: const EdgeInsets.only(
                      left: 10,
                      right: 10,
                      top: 12,
                    ),
                    color: Colors.white,
                    child: Column(
                      children: [
                        _topMenu(kodebagian, nama, linkGbr),
                        const SizedBox(height: 20),
                        _buildMenu(context),
                      ],
                    ),
                  ),
                  Container(
                    color: Colors.white,
                    margin: const EdgeInsets.only(top: 16.0),
                    child: const Column(children: []),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _topMenu(String kodebagian, String nama, String linkGbr) {
    return Container(
      height: 120,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Color(0xff3164bd), Color(0xff295cb5)],
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 15),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text("Welcome :", style: TextStyle(color: Colors.white)),
                Text(
                  nama,
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(kodebagian, style: const TextStyle(color: Colors.white70)),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: CircleAvatar(
              radius: 40,
              backgroundColor: Colors.white,
              child: ClipOval(
                child: CachedNetworkImage(
                  imageUrl: linkGbr,
                  fit: BoxFit.cover,
                  width: 80,
                  height: 80,
                  placeholder:
                      (context, url) => const CircularProgressIndicator(),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMenu(BuildContext context) {
    final storage = LocalStorageService();

    return SizedBox(
      child: Container(
        margin: const EdgeInsets.only(top: 6.0, bottom: 6.0),
        child: GridView.count(
          shrinkWrap: true,
          crossAxisCount: 3,
          children: <Widget>[
            MenuIcon(
              icon: Icons.barcode_reader,
              iconColor: MyPalette.menuBluebird,
              label: "Scan Barcode",
              onPres: () {},
            ),
            MenuIcon(
              icon: Icons.search_outlined,
              iconColor: Colors.green,
              label: "Cari Manual",
              onPres: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const ScanManual()),
                );
              },
            ),
            MenuIcon(
              icon: Icons.ads_click,
              iconColor: MyPalette.menuMm,
              label: "By Name",
              onPres: () {},
            ),
            MenuIcon(
              icon: Icons.book_outlined,
              iconColor: Colors.purple,
              label: "Rekap",
              onPres: () {},
            ),
            MenuIcon(
              icon: Icons.warehouse_rounded,
              iconColor: MyPalette.menuMm,
              label: "Service",
              onPres: () {},
            ),
            MenuIcon(
              icon: Icons.article_outlined,
              iconColor: MyPalette.menuKuning,
              label: "Tickets",
              onPres: () {},
            ),
            MenuIcon(
              icon: Icons.logout_outlined,
              iconColor: Colors.blue,
              label: "Logout",
              onPres: () {
                storage.clear();
                Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(builder: (_) => const LoginPage()),
                  (route) => false,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
