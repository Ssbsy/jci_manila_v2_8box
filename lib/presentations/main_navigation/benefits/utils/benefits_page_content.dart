import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:jci_manila_v2/core/providers/benefits_provider/benefits_provider.dart';
import 'package:provider/provider.dart';
import 'package:jci_manila_v2/app/widgets/widget_text.dart';

class BenefitsPageContent extends StatefulWidget {
  const BenefitsPageContent({super.key});

  @override
  State<BenefitsPageContent> createState() => _BenefitsPageContentState();
}

class _BenefitsPageContentState extends State<BenefitsPageContent> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<BenefitsProvider>(context, listen: false).fetchBenefits();
    });
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<BenefitsProvider>(context);
    final List<String> shownCategories = [];

    if (provider.isLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children:
            provider.benefits.map((benefit) {
              final String category = benefit['category'] ?? 'Others';
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
    dynamic benefit,
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
                Image.network(
                  benefit['image'] ?? '',
                  width: 60,
                  height: 60,
                  errorBuilder: (_, __, ___) => const Icon(Icons.image),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      WidgetText(
                        title: benefit['title'],
                        isBold: true,
                        size: 16,
                      ),
                      WidgetText(title: benefit['description'], size: 14),
                      const Gap(10),
                      WidgetText(
                        title: "${benefit['discount']}% Discount",
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
