import 'package:flutter/material.dart';

class ScanManual extends StatefulWidget {
  const ScanManual({super.key});

  @override
  State<ScanManual> createState() => _ScanManualState();
}

class _ScanManualState extends State<ScanManual> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Scan Manual"),
      ),
      body: const Center(
        child: Text("Fitur Scan Manual akan segera hadir!"),
      ),
    );
  }
}
