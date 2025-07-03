import 'package:flutter/material.dart';

class MenuCard extends StatelessWidget {
  final Map<String, dynamic> menu;

  const MenuCard(this.menu, {super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(builder: (_) => menu['screen']),
      ),
      child: Card(
        margin: EdgeInsets.symmetric(vertical: 10),
        elevation: 4,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: Column(
          children: [
            Image.asset(menu['image'], height: 150, width: double.infinity, fit: BoxFit.cover),
            Padding(
              padding: EdgeInsets.all(12),
              child: Text(menu['title'], style: TextStyle(fontSize: 18)),
            )
          ],
        ),
      ),
    );
  }
}
