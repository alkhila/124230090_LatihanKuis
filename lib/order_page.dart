import 'package:flutter/material.dart';

class OrderPage extends StatefulWidget {
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
  State<OrderPage> createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  final jumlahText = TextEditingController();
  double totalHarga = 0.0;

  void _hitungJumlah() {
    // 1. Bersihkan string harga dari karakter non-angka
    final String hargaString = widget.hargaMenu.replaceAll(
      RegExp(r'[^0-9]'),
      '',
    );
    final double harga = double.tryParse(hargaString) ?? 0.0;

    final double jumlah = double.tryParse(jumlahText.text) ?? 0.0;

    // 2. Gunakan setState untuk memperbarui state
    setState(() {
      totalHarga = harga * jumlah;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Detail Pemesanan"),
        backgroundColor: const Color.fromARGB(255, 150, 109, 88),
        foregroundColor: Colors.white,
      ),
      body: Center(
        child: Column(
          children: [
            Image.asset(widget.fotoMenu, width: 200, height: 200),
            const SizedBox(height: 20),
            Text(
              widget.namaMenu,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Text(
              "Harga: ${widget.hargaMenu}",
              style: const TextStyle(fontSize: 18),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: TextFormField(
                controller: jumlahText,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  hintText: 'Masukkan Jumlah',
                  labelText: 'Masukkan Jumlah',
                  labelStyle: TextStyle(
                    color: Color.fromARGB(255, 150, 109, 88),
                  ),
                  contentPadding: EdgeInsets.all(8.0),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(8.0)),
                    borderSide: BorderSide(
                      color: const Color.fromARGB(255, 150, 109, 88),
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(8.0)),
                    borderSide: BorderSide(
                      color: const Color.fromARGB(255, 150, 109, 88),
                    ),
                  ),
                ),
              ),
            ),
            Container(
              width: 465,
              child: ElevatedButton(
                onPressed: _hitungJumlah,
                child: Text('Hitung'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 150, 109, 88),
                  foregroundColor: Colors.white,
                ),
              ),
            ),
            const SizedBox(height: 20),
            Text(
              'Total Harga : Rp${totalHarga.toStringAsFixed(0)}',
              style: const TextStyle(fontSize: 15),
            ),
          ],
        ),
      ),
    );
  }
}
