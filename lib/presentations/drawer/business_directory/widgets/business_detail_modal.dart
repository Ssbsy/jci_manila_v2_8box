import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:jci_manila_v2/app/theme/app_colors.dart';

class BusinessDetailModal extends StatelessWidget {
  const BusinessDetailModal({super.key});

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      initialChildSize: 0.85,
      maxChildSize: 0.95,
      minChildSize: 0.6,
      expand: false,
      builder:
          (_, controller) => Container(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
            ),
            child: SingleChildScrollView(
              controller: controller,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Image.asset(
                      'assets/images/tkl_steel_corp_img.png',
                      width: 400,
                      height: 250,
                    ),
                  ),
                  const Gap(4),
                  const Center(
                    child: Text(
                      "Trust you can build on",
                      style: TextStyle(color: Colors.black54),
                    ),
                  ),
                  const Gap(20),
                  const Text(
                    'TKL Steel Corp',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const Gap(8),
                  const Text(
                    'TKL Steel Corp is a leading steel distributor in the Philippines, established in 1989. It supplies a wide range of steel products, including angle bars, steel plates, and pipes, serving industries such as construction and manufacturing.',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.black54,
                      height: 1.5,
                    ),
                  ),
                  const Divider(height: 32),
                  _buildDetailRow(
                    'Owner',
                    'Laurence C. Tan',
                    'Co-Owner',
                    'Not Available',
                  ),
                  const Gap(12),
                  _buildDetailRow(
                    'Type',
                    'Steel, Trading',
                    'Industry',
                    'Construction',
                  ),
                  const Divider(height: 32),
                  const Text(
                    'Address',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  const Gap(4),
                  const Text(
                    'Oroquieta Rd, Santa Cruz, Manila, 1014 Metro Manila',
                    style: TextStyle(color: Colors.black54, fontSize: 13),
                  ),
                  const Gap(16),
                  const Text(
                    'Operating Hours',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  const Gap(4),
                  const Text(
                    'Mon–Fri: 8:00 AM to 5:00 PM',
                    style: TextStyle(color: Colors.black54, fontSize: 13),
                  ),
                  const Gap(24),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Palette.accentBlue,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 24,
                          vertical: 12,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: const Text(
                        'Get Direction',
                        style: TextStyle(
                          color: Palette.neutralWhite,
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                      ),
                    ),
                  ),
                  const Gap(20),
                ],
              ),
            ),
          ),
    );
  }

  Widget _buildDetailRow(
    String leftTitle,
    String leftValue,
    String rightTitle,
    String rightValue,
  ) {
    return Row(
      children: [
        Expanded(child: _buildColumn(leftTitle, leftValue)),
        const SizedBox(width: 12),
        Expanded(child: _buildColumn(rightTitle, rightValue)),
      ],
    );
  }

  Widget _buildColumn(String title, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
        ),
        const Gap(4),
        Text(
          value,
          style: const TextStyle(fontSize: 13, color: Colors.black54),
        ),
      ],
    );
  }
}
