import 'package:flutter/material.dart';

class FilterOptionsDialog extends StatefulWidget {
   static String id = "filter";
  
  @override
  _FilterOptionsDialogState createState() => _FilterOptionsDialogState();
}

class _FilterOptionsDialogState extends State<FilterOptionsDialog> {
  bool wifiSelected = false;
  bool activitiesSelected = false;
  bool parkingSelected = false;
  bool restaurantSelected = false;
  bool poolSelected = false;
  bool acSelected = false;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Filter Options'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          CheckboxListTile(
            title: const Text('Wi-Fi'),
            value: wifiSelected,
            onChanged: (value) {
              setState(() {
                wifiSelected = value ?? false;
              });
            },
          ),
          CheckboxListTile(
            title: const Text('Activities'),
            value: activitiesSelected,
            onChanged: (value) {
              setState(() {
                activitiesSelected = value ?? false;
              });
            },
          ),
          CheckboxListTile(
            title: const Text('Parking'),
            value: parkingSelected,
            onChanged: (value) {
              setState(() {
                parkingSelected = value ?? false;
              });
            },
          ),
          CheckboxListTile(
            title: const Text('Restaurant'),
            value: restaurantSelected,
            onChanged: (value) {
              setState(() {
                restaurantSelected = value ?? false;
              });
            },
          ),
          CheckboxListTile(
            title: const Text('Pool'),
            value: poolSelected,
            onChanged: (value) {
              setState(() {
                poolSelected = value ?? false;
              });
            },
          ),
          CheckboxListTile(
            title: const Text('AC'),
            value: acSelected,
            onChanged: (value) {
              setState(() {
                acSelected = value ?? false;
              });
            },
          ),
          SizedBox(
            width: 150,
            height: 40,
            child: ElevatedButton(
              onPressed: () {
                // Perform search with selected filters
              },
              style: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.all<Color>(const Color(0XFF1B4158)),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
              child: const Text(
                'Search',
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
