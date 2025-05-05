import 'package:flutter/material.dart';
import 'package:jci_manila_v2/presentations/drawer/business_directory/widgets/business_card.dart';
import 'package:jci_manila_v2/presentations/drawer/business_directory/widgets/mybusiness_detail_modal.dart';

class BusinessList extends StatelessWidget {
  const BusinessList({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 6),
          child: BusinessCardWidget(
            title: 'Pacific Union Insurance',
            subtitle: 'Oroquieta Rd, Santa Cruz, Manila',
            ownerLabel: 'You',
            imagePath: 'assets/images/puic_logo.jpg',
            onTap: () {
              showModalBottomSheet(
                context: context,
                isScrollControlled: true,
                backgroundColor: Colors.transparent,
                builder: (_) => const MyBusinessDetailModal(),
              );
            },
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 6),
          child: BusinessCardWidget(
            title: 'Business 1',
            subtitle: 'Oroquieta Rd, Santa Cruz, Manila',
            ownerLabel: 'You',
            imagePath: 'assets/images/mlbb.png',
          ),
        ),
      ],
    );
  }
}
