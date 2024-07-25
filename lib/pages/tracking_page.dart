import 'package:flutter/material.dart';

class TrackingPage extends StatefulWidget {
  const TrackingPage({super.key});

  @override
  State<TrackingPage> createState(){
    return TrackingPageState();
  }
}

class TrackingPageState extends State<TrackingPage> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

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
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        notchMargin: 6.0,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            buildBottomNavigationItem(0, Icons.home, 'Home'),
            buildBottomNavigationItem(1, Icons.shopping_cart, 'Cart'),
            buildBottomNavigationItem(2, Icons.notifications, 'Updates'),
            buildBottomNavigationItem(3, Icons.person, 'Profile'),
          ],
        ),
      ),
    );
  }

  Widget buildBottomNavigationItem(int index, IconData icon, String label) {
    bool isSelected = _selectedIndex == index;
    return GestureDetector(
      onTap: () => _onItemTapped(index),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
        decoration: isSelected
            ? BoxDecoration(
                color: Colors.grey[200],
                border: Border.all(color: Colors.black, width: 2.0),
                borderRadius: BorderRadius.circular(30.0),
              )
            : null,
        child: Row(
          children: [
            Icon(icon, color: isSelected ? Colors.black : Colors.grey),
            const SizedBox(width: 8),
            if (isSelected)
              Text(
                label,
                style: const TextStyle(color: Colors.black),
              ),
          ],
        ),
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
