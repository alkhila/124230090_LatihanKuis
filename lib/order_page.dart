import 'package:flutter/material.dart';

class OrderPage extends StatelessWidget {
  final String namaMenu;
  final String hargaMenu;
  final String fotoMenu;
  const OrderPage({
    super.key,
    required this.namaMenu,
    required this.hargaMenu,
    required this.fotoMenu,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Detail Pemesanan",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: const Color.fromARGB(255, 150, 109, 88),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // 3. Tampilkan data yang sudah diterima
            Image.asset(fotoMenu, width: 200, height: 200),
            const SizedBox(height: 20),
            Text(
              "Anda memesan: $namaMenu",
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Text("Harga: $hargaMenu", style: const TextStyle(fontSize: 18)),
          ],
        ),
      ),
    );
  }
}
