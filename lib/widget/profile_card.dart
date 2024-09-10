import 'package:flutter/material.dart';

class ProfileCard extends StatelessWidget {
  final String info;
  final IconData icon;

  const ProfileCard({Key? key, required this.info, required this.icon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 30, bottom: 10, top: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(10),
          bottomRight: Radius.circular(10),
        ),
        border: Border(
          bottom: BorderSide(
            color: Color.fromARGB(255, 51, 86, 116).withOpacity(0.7),
            width: 1.2,
          ),
        ),
      ),
      child: Row(
        children: [
          Icon(
            icon,
            color: Color.fromARGB(255, 51, 86, 116),
            size: 26,
          ),
          SizedBox(width: 20),
          Text(
            info,
            style: TextStyle(fontSize: 16),
          ),
        ],
      ),
    );
  }
}
