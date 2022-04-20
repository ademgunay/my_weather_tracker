import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'home_controller.dart';

class HomePage extends StatelessWidget {
  // The widget's constructor
  HomePage({Key? key}) : super(key: key);

  final HomeController _controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomRight,
            colors: [Colors.red, Colors.blue, Colors.red],
          ),
        ),
        child: Obx(
          () => SafeArea(
            // Our page based on a single column at its root.
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // A row within the column containing an icon and text.
                _rowItem(
                  Icons.location_city_outlined,
                  "Your location is ${_controller.address}",
                ),
                const SizedBox(height: 18),
                _rowItem(
                  Icons.thermostat_outlined,
                  "The temperature is ${_controller.temperature}°C",
                ),
                const SizedBox(height: 18),
                _rowItem(
                  Icons.info_outline,
                  "You should ${_controller.infoText.value}",
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _rowItem(IconData icon, String text) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 24),
      // the decoration allows us to customize our container
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      // We add padding to our row for extra space around it.
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: 32,
            ),
            const SizedBox(width: 8),
            // This tells the Text to use the maximum space possible.
            Expanded(
              // We will fetch the user's current city
              child: Text(
                text,
                style: const TextStyle(fontSize: 18),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
