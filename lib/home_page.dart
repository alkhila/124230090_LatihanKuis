import 'package:flutter/material.dart';
import 'package:latihan_kuis/auth/login_page.dart';
import 'package:latihan_kuis/order_page.dart';

class HomePage extends StatelessWidget {
  final String username;
  const HomePage({super.key, required this.username});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Halo $username', style: TextStyle(color: Colors.white)),
        backgroundColor: const Color.fromARGB(255, 150, 109, 88),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return LoginPage();
                  },
                ),
                (router) => false,
              );
            },
            icon: Icon(Icons.logout_outlined, color: Colors.red),
          ),
        ],
      ),

      body: Center(
        child: Column(
          children: [
            Image.asset(
              'assets/banner.jpg',
              height: 200,
              width: double.infinity, // Membuat gambar memenuhi lebar layar
              fit: BoxFit
                  .cover, // Memastikan gambar memenuhi area yang ditentukan tanpa distorsi
            ),
            const SizedBox(height: 30),
            Text(
              'Daftar Menu',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: GridView.count(
                  crossAxisCount: 2,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 11,
                  children: <Widget>[
                    // Memanggil widget _menuItem() secara manual untuk setiap menu
                    _MenuMakanan(
                      context,
                      nama: "Ayam Goreng",
                      harga: "Rp 40000",
                      foto: "assets/ayam_goreng.jpg",
                    ),
                    _MenuMakanan(
                      context,
                      nama: "Sandwich",
                      harga: "Rp 15000",
                      foto:
                          "assets/sandwich.jpg", // Ganti dengan path gambar Anda
                    ),
                    _MenuMakanan(
                      context,
                      nama: "Burger",
                      harga: "Rp 12000",
                      foto: "assets/burger.jpg",
                    ),
                    _MenuMakanan(
                      context,
                      nama: "Kentang Goreng",
                      harga: "Rp 10000",
                      foto: "assets/kentang_goreng.jpg",
                    ),
                    _MenuMakanan(
                      context,
                      nama: "Fettucini",
                      harga: "Rp 20000",
                      foto: "assets/fettucini.jpg",
                    ),
                    _MenuMakanan(
                      context,
                      nama: "Pizza",
                      harga: "Rp 50000",
                      foto: "assets/pizza.jpg",
                    ),
                    // Tambahkan menu lainnya di sini
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _MenuMakanan(
    BuildContext context, {
    required String nama,
    required String harga,
    required String foto,
  }) {
    return Container(
      child: Card(
        margin: EdgeInsets.all(8),
        elevation: 6, // Beri efek bayangan
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15), // Atur sudut melengkung
        ),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.asset(foto, width: 100, height: 100),
            ),
            const SizedBox(height: 5),
            Text(nama, style: TextStyle(fontWeight: FontWeight.bold)),
            Text("Harga: $harga", style: TextStyle()),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Navigasi ke OrderPage saat tombol ditekan
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      // Ganti dengan nama widget halaman pemesanan Anda
                      // Kirim data nama, harga, dan foto ke halaman OrderPage
                      return OrderPage(
                        namaMenu: nama,
                        hargaMenu: harga,
                        fotoMenu: foto,
                      );
                    },
                  ),
                );
              },
              child: Text("Pesan", style: TextStyle(color: Colors.white)),
              style: ElevatedButton.styleFrom(
                backgroundColor: Color.fromARGB(255, 150, 109, 88),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
