import 'package:flutter/material.dart';

class MembersDatabaseContent extends StatelessWidget {
  const MembersDatabaseContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.grey.shade200,
      ),
      child: Column(children: [Row(children: [])]),
    );
  }
}
