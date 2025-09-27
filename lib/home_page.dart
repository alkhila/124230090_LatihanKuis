import 'package:flutter/material.dart';
import 'package:latihan_kuis/auth/login_page.dart';

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
                      nama: "Nasi Goreng",
                      harga: "Rp 15000",
                      foto:
                          "assets/logo_burger.png", // Ganti dengan path gambar Anda
                    ),
                    _MenuMakanan(
                      nama: "Mie Ayam",
                      harga: "Rp 12000",
                      foto: "assets/logo_burger.png",
                    ),
                    _MenuMakanan(
                      nama: "Sate Ayam",
                      harga: "Rp 20000",
                      foto: "assets/logo_burger.png",
                    ),
                    _MenuMakanan(
                      nama: "Bakso",
                      harga: "Rp 10000",
                      foto: "assets/logo_burger.png",
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

  Widget _MenuMakanan({required nama, required harga, required foto}) {
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
            Text(nama, style: TextStyle(fontWeight: FontWeight.bold)),
            Text("Harga: $harga", style: TextStyle()),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {},
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
