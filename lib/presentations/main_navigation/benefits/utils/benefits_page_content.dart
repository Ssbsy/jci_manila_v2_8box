import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:jci_manila_v2/app/widgets/widget_text.dart';
import 'package:jci_manila_v2/core/constants/images.dart';
import 'package:jci_manila_v2/core/models/benefits.dart';

class BenefitsPageContent extends StatefulWidget {
  const BenefitsPageContent({super.key});

  @override
  State<BenefitsPageContent> createState() => _BenefitsPageContentState();
}

class _BenefitsPageContentState extends State<BenefitsPageContent> {
  final List<Benefits> benefits = [
    Benefits(
      image: Images.jollibeeLogo,
      discount: 20,
      title: 'Jollibee',
      discountDescription:
          'Any members can use this voucher on any Jollibee branches',
      category: 'Food and Beverage',
    ),
    Benefits(
      image: Images.mangInasalLogo,
      discount: 20,
      title: 'Mang Inasal',
      discountDescription:
          'Any members can use this voucher on any Jollibee branches',
      category: 'Food and Beverage',
    ),
    Benefits(
      image: Images.redRibbonLogo,
      discount: 20,
      title: 'Red Ribbon',
      discountDescription:
          'Any members can use this voucher on any Jollibee branches',
      category: 'Food and Beverage',
    ),
    Benefits(
      image: Images.johnsonsLogo,
      discount: 20,
      title: 'Johnson Fitness & Well Being',
      discountDescription:
          'Any members can use this voucher on any Jollibee branches',
      category: 'Health and Wellness',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final List<String> shownCategories = [];

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children:
            benefits.map((benefit) {
              String category = benefit.category ?? 'Others';
              String? header;

              if (!shownCategories.contains(category)) {
                header = category;
                shownCategories.add(category);
              }

              return _buildBenefitCard(context, benefit, header);
            }).toList(),
      ),
    );
  }

  Widget _buildBenefitCard(
    BuildContext context,
    Benefits benefits,
    String? header,
  ) {
    return GestureDetector(
      onTap: () {},
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (header != null)
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: WidgetText(title: header, isBold: true, size: 18),
            ),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(10),
            margin: const EdgeInsets.only(bottom: 15),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15),
              border: Border.all(width: 1, color: Colors.grey),
            ),
            child: Row(
              children: [
                benefits.image,
                const SizedBox(width: 10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      WidgetText(title: benefits.title, isBold: true, size: 16),
                      WidgetText(title: benefits.discountDescription, size: 14),
                      const Gap(10),
                      WidgetText(
                        title:
                            '${benefits.discount.toStringAsFixed(0)}% Discount',
                        size: 16,
                        color: Colors.blue,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
