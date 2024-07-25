import 'package:flutter/material.dart';

class TrackingPage extends StatelessWidget {
  const TrackingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Container(
          margin: const EdgeInsets.all(8.0),
          decoration: const BoxDecoration(
            color: Colors.black,
            shape: BoxShape.circle,
          ),
          child: IconButton(
            icon: const Icon(Icons.arrow_back),
            color: Colors.white,
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.search),
                      hintText: 'Search',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                CircleAvatar(
                  backgroundColor: Colors.black,
                  child: IconButton(
                    icon: const Icon(Icons.shopping_cart, color: Colors.white),
                    onPressed: () {},
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            buildTrackingHeader('6556 23341 8090', 'Eno Express', 'Transit'),
            const SizedBox(height: 16),
            buildHorizontalStepper(),
            const SizedBox(height: 16),
            const Text(
              'Tracking',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            buildTrackingItem('US 2343445668', 'Tamil Nadu', 'Delivered', Icons.local_shipping),
            buildTrackingItem('US 2343445652', 'Delhi, India', 'Transit', Icons.local_shipping),
            buildTrackingItem('US 2343445638', 'Franklin, Alabama', 'Accepted', Icons.local_shipping),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home, color: Colors.black),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart, color: Colors.black),
            label: 'Cart',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications, color: Colors.black),
            label: 'Bell',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person, color: Colors.black),
            label: 'Profile',
          ),
        ],
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.black,
        onTap: (index) {},
      ),
    );
  }

  Widget buildTrackingHeader(String trackingCode, String carrier, String status) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Row(
        children: [
          const Icon(Icons.local_shipping),
          const SizedBox(width: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                trackingCode,
                style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
              ),
              Text(carrier, style: const TextStyle(color: Colors.black)),
            ],
          ),
          const Spacer(),
          Text(status, style: const TextStyle(color: Colors.black)),
        ],
      ),
    );
  }

  Widget buildHorizontalStepper() {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Column(
        children: [
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('25 June, 2021', style:  TextStyle(color: Colors.black)),
              Text('30 June, 2021', style:  TextStyle(color: Colors.black)),
            ],
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              buildStep(true, Icons.local_shipping),
              buildLine(true),
              buildStep(true, Icons.airplanemode_active),
              buildLine(false),
              buildStep(false, Icons.person),
              buildLine(false),
              buildStep(false, Icons.check_circle),
            ],
          ),
          const SizedBox(height: 8),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Sacramento',
                style:  TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
              ),
              Text(
                'Tamil Nadu',
                style:  TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget buildStep(bool isActive, IconData icon) {
    return CircleAvatar(
      backgroundColor: isActive ? Colors.black : Colors.grey,
      child: Icon(icon, color: Colors.white),
    );
  }

  Widget buildLine(bool isActive) {
    return Expanded(
      child: Container(
        height: 2,
        color: isActive ? Colors.black : Colors.grey,
      ),
    );
  }

  Widget buildTrackingItem(String trackingCode, String location, String status, IconData icon) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16.0),
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Row(
        children: [
          Icon(icon),
          const SizedBox(width: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                trackingCode,
                style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
              ),
              Text(location, style: const TextStyle(color: Colors.black)),
            ],
          ),
          const Spacer(),
          Text(status, style: const TextStyle(color: Colors.black)),
        ],
      ),
    );
  }
}
