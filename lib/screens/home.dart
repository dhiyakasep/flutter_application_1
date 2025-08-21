import 'package:dhiya12rpl1_app/screens/login.dart';
import 'package:flutter/material.dart';

class homePage extends StatefulWidget {
  const homePage({super.key});

  @override
  State<homePage> createState() => _homePageState();
}

class _homePageState extends State<homePage> {
  int _selectetedIndex = 0;

  final List<Widget> _pages = const [
    ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('KasWarga'),
      ),
      body: _pages[_selectetedIndex],
      bottomNavigationBar: NavigationBar(
        animationDuration: const Duration(milliseconds: 300),
        selectedIndex: _selectetedIndex,
        onDestinationSelected: (index) {
          setState(() {
            _selectetedIndex = index;
          });
        },
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.home_outlined),
            selectedIcon: Icon(Icons.home_rounded),
            label: 'Beranda',
          ),
          NavigationDestination(
            icon: Icon(Icons.payments_outlined),
            selectedIcon: Icon(Icons.payments_rounded),
            label: 'Iuran',
          ),
          NavigationDestination(
            icon: Icon(Icons.receipt_long_outlined),
            selectedIcon: Icon(Icons.receipt_long),
            label: 'Laporan',
          ),
          NavigationDestination(
            icon: Icon(Icons.person_outline_rounded),
            selectedIcon: Icon(Icons.person_rounded),
            label: 'Profil',
          ),
        ],
      ),
    );
  }
}

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF4F6F8),
      appBar: AppBar(
        title: const Text(
          'Profil Saya',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 1,
        surfaceTintColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            CircleAvatar(
              radius: 48,
              backgroundColor: Colors.indigo.shade100,
              child: const Icon(Icons.person, size: 50, color: Colors.indigo),
            ),
            const SizedBox(height: 12),
            const Text(
              'Muhammad Firdaus',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 4),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 12, vertical: 4),
              decoration: BoxDecoration(
                color: Colors.green.shade100,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Text(
                'Warga Aktif',
                style: TextStyle(color: Colors.green, fontWeight: FontWeight.w600),
              ),
            ),
            const SizedBox(height: 24),
            Column(
              children: [
                buildInfoTile(Icons.home, 'Nomor Rumah', 'Blok C No. 12'),
                buildInfoTile(Icons.phone_android, 'Nomor HP', '0812-3456-7890'),
                buildInfoTile(Icons.email_outlined, 'Email', 'dhiya@gmail.com'),
                buildInfoTile(Icons.badge_outlined, 'Status Akun', 'Aktif'),
              ],
            ),
            SizedBox(height: 32),
            Column(
              children: [
                buildActionButton(
                  icon: Icons.history,
                  label: 'Riwayat Iuran Saya',
                  onTap: () {},
                  color: Colors.indigo,
                ),
                SizedBox(height: 12),
                buildActionButton(
                  icon: Icons.edit,
                  label: 'Ubah Profil',
                  onTap: () {},
                  color: Colors.orange,
                ),
                SizedBox(height: 12),
                buildActionButton(
                  icon: Icons.lock_reset,
                  label: 'Ganti Password',
                  onTap: () {},
                  color: Colors.deepPurple,
                ),
                SizedBox(height: 12),
                buildActionButton(
                  icon: Icons.logout,
                  label: 'Keluar Akun',
                  onTap: () {
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(builder: (context) => LoginPage()),
                      (route) => false,
                    );
                  },
                  color: Colors.red,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget buildInfoTile(IconData icon, String title, String value) {
    return Container(
      margin: EdgeInsets.only(bottom: 14),
      padding: EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
      ),
      child: Row(
        children: [
          Icon(icon, size: 28, color: Colors.indigo),
          SizedBox(width: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: TextStyle(fontSize: 14, color: Colors.black54)),
              SizedBox(height: 4),
              Text(value, style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
            ],
          ),
        ],
      ),
    );
  }

  Widget buildActionButton({
    required IconData icon,
    required String label,
    required VoidCallback onTap,
    required Color color,
  }) {
    return SizedBox(
      width: double.infinity,
      height: 50,
      child: ElevatedButton.icon(
        onPressed: onTap,
        icon: Icon(icon, size: 20),
        label: Text(label, style: const TextStyle(fontSize: 16)),
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14),
          ),
        ),
      ),
    );
  }
}
