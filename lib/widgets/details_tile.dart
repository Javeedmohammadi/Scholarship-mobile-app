import 'package:flutter/material.dart';

class DetailsTile extends StatelessWidget {
  final String title;
  final String subtitle;

  const DetailsTile({Key? key, required this.title, required this.subtitle})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(10)),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
              color: Color(0xFFef6036).withOpacity(0.1),
              blurRadius: 2,
              offset: const Offset(1, 2)),
        ],
        border:
            Border.all(color: Color(0xFF002551).withOpacity(0.2), width: 0.8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: TextStyle(fontSize: 14)),
          Text(subtitle,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
        ],
      ),
    );
    ;
  }
}
