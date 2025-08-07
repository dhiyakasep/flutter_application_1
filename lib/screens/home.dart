import 'package:flutter/material.dart';

class homePage extends StatefulWidget {
  const homePage({super.key});

  @override
  State<homePage> createState() => _homePageState();
}

class _homePageState extends State<homePage> {
  int _selectetedIndex = 0;

  final List<Widget> _pages = const [
    Center(child: Text('Ini halaman Beranda')),
    Center(child: Text('Ini halaman Bookmark')),
    CartPage(),
    ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Asep Sopiah'),
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
              label: 'Beranda'),
          NavigationDestination(
              icon: Icon(Icons.bookmark_outline_rounded),
              selectedIcon: Icon(Icons.bookmark_rounded),
              label: 'Bookmarks'),
          NavigationDestination(
              icon: Icon(Icons.shopping_bag_outlined),
              selectedIcon: Icon(Icons.shopping_bag),
              label: 'Cart'),
          NavigationDestination(
              icon: Icon(Icons.person_outline_rounded),
              selectedIcon: Icon(Icons.person_rounded),
              label: 'Profile'),
        ],
      ),
    );
  }
}

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          const SizedBox(height: 40),
          Center(
            child: Stack(
              children: [
                const CircleAvatar(
                  radius: 50,
                  backgroundImage: NetworkImage(
                    'https://i.pravatar.cc/150?img=12',
                  ),
                ),
                Positioned(
                  right: 4,
                  bottom: 4,
                  child: Container(
                    width: 18,
                    height: 18,
                    decoration: BoxDecoration(
                      color: Colors.green,
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.white, width: 3),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          const Text(
            'Muhammad Firdaus',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const Text(
            '@dhiyaulhaq',
            style: TextStyle(
              color: Colors.grey,
              fontSize: 14,
            ),
          ),
          const SizedBox(height: 24),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildStatItem("Post", "120"),
              const SizedBox(width: 40),
              _buildStatItem("Follower", "2.5K"),
              const SizedBox(width: 40),
              _buildStatItem("Mengikuti", "345"),
            ],
          ),
        ],
      ),
    );
  }

  static Widget _buildStatItem(String title, String value) {
    return Column(
      children: [
        Text(
          value,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          title,
          style: const TextStyle(
            fontSize: 14,
            color: Colors.grey,
          ),
        ),
      ],
    );
  }
}

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 24),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              'Keranjang Belanja',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(height: 16),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              children: const [
                CartItem(
                  imageUrl: 'https://images.tokopedia.net/img/cache/500-square/o3syd0/1997/1/1/4f8f95ce7fca422198e2eff3a4a8678e~.jpeg',
                  title: 'Produk 1',
                  price: 'Rp 50.000',
                ),
                CartItem(
                  imageUrl: 'https://images.tokopedia.net/img/cache/500-square/o3syd0/1997/1/1/4f8f95ce7fca422198e2eff3a4a8678e~.jpeg',
                  title: 'Produk 2',
                  price: 'Rp 75.000',
                ),
                CartItem(
                  imageUrl: 'https://images.tokopedia.net/img/cache/500-square/o3syd0/1997/1/1/4f8f95ce7fca422198e2eff3a4a8678e~.jpeg',
                  title: 'Produk 3',
                  price: 'Rp 120.000',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class CartItem extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String price;

  const CartItem({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      child: ListTile(
        leading: Image.network(
          imageUrl,
          width: 60,
          height: 60,
          fit: BoxFit.cover,
        ),
        title: Text(title),
        subtitle: Text(price),
        trailing: Icon(Icons.delete_outline),
      ),
    );
  }
}
