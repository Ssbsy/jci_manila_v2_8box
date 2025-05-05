import 'package:flutter/material.dart';
import 'package:jci_manila_v2/presentations/drawer/business_directory/widgets/business_card.dart';
import 'package:jci_manila_v2/presentations/drawer/business_directory/widgets/business_detail_modal.dart';

class SponsorList extends StatelessWidget {
  const SponsorList({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 6),
          child: GestureDetector(
            onTap: () {
              showModalBottomSheet(
                context: context,
                isScrollControlled: true,
                backgroundColor: Colors.transparent,
                builder: (_) => const BusinessDetailModal(),
              );
            },
            child: const BusinessCardWidget(
              title: 'TKL Steel Corp',
              subtitle: 'Oroquieta Rd, Santa Cruz, Manila',
              ownerLabel: 'Laurence C. Tan',
              imagePath: 'assets/images/tkl_steel_corp_img.png',
            ),
          ),
        ),

        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 6),
          child: BusinessCardWidget(
            title: 'Sponsor 2',
            subtitle: 'Oroquieta Rd, Santa Cruz, Manila',
            ownerLabel: 'Company Owner',
            imagePath: 'assets/images/mlbb.png',
          ),
        ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 6),
          child: BusinessCardWidget(
            title: 'Sponsor 3',
            subtitle: 'Oroquieta Rd, Santa Cruz, Manila',
            ownerLabel: 'Company Owner',
            imagePath: 'assets/images/mlbb.png',
          ),
        ),
      ],
    );
  }
}
