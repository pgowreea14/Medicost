import 'package:flutter/material.dart';

AppBar appBar(BuildContext context) {
  return AppBar(
    backgroundColor: Color.fromARGB(255, 250, 253, 251),
    title: Text(
      "MediCost",
      style: TextStyle(
        color: Colors.black, // Adjust color as needed
      ),
    ),
    actions: [
      IconButton(
        icon: Icon(
          Icons.notifications_outlined,
          size: 30,
          color: Colors.black, // Adjust color as needed
        ),
        onPressed: () {
          // Add your notification logic here
        },
      ),
    ],
  );
}
