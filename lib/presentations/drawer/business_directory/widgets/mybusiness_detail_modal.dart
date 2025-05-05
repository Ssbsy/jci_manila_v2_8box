import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class MyBusinessDetailModal extends StatelessWidget {
  const MyBusinessDetailModal({super.key});

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      initialChildSize: 0.85,
      maxChildSize: 0.9,
      minChildSize: 0.5,
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
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(16),
                      child: Image.asset(
                        'assets/images/puic_logo.jpg',
                        width: 400,
                        height: 250,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),

                  const Gap(16),
                  const Text(
                    'Pacific Union Insurance Company',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const Gap(8),
                  const Text(
                    'Pacific Union Insurance Company (PUIC), founded in 1945, is the first non-life insurer licensed by the Philippine government. It offers a wide range of insurance products and issued its first bond for President Jose P. Laurel Sr.',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.black54,
                      height: 1.5,
                    ),
                  ),
                  const Divider(height: 32),
                  _buildDetailRow(
                    'Owner',
                    'Jan Adrian D. Padiernos',
                    'Co-Owner',
                    'Not Available',
                  ),
                  const Gap(12),
                  _buildDetailRow(
                    'Type',
                    'Insurance',
                    'Industry',
                    'Financial Service',
                  ),
                  const Divider(height: 32),
                  const Text(
                    'Address',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  const Gap(4),
                  const Text(
                    'Unit 2401, 24th Floor, Antel Corporate Center, 121 Valero Street, Salcedo Village, Makati City, 1227, Metro Manila, Philippines',
                    style: TextStyle(color: Colors.black54, fontSize: 13),
                  ),
                  const Gap(16),
                  const Text(
                    'Operating Hours',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  const Gap(4),
                  const Text(
                    'Mon-Fri: 8:00 AM to 5:00 PM\nSat-Sun: 8:00 AM - 12:00 PM',
                    style: TextStyle(color: Colors.black54, fontSize: 13),
                  ),
                  const Gap(16),
                  const Text(
                    'Benefits',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  const Gap(4),
                  const Text(
                    '20% Discount',
                    style: TextStyle(color: Colors.black54, fontSize: 13),
                  ),
                  const Gap(30),
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
