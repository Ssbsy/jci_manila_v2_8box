import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:jci_manila_v2/app/components/widget_text_field.dart';
import 'package:jci_manila_v2/app/theme/app_colors.dart';
import 'package:jci_manila_v2/app/widgets/widget_text.dart';

class EventRegistration extends StatefulWidget {
  const EventRegistration({super.key});

  @override
  State<EventRegistration> createState() => _EventRegistrationState();
}

class _EventRegistrationState extends State<EventRegistration> {
  bool freeGMM = false;
  bool withAddon = false;
  bool acceptedTerms = false;
  double registrationFee = 1800.0;
  double addonFee = 15000.0;

  String paymentMethod = 'paymaya';
  final couponController = TextEditingController();

  @override
  void dispose() {
    couponController.dispose();
    super.dispose();
  }

  double get totalFee =>
      (freeGMM ? 0 : registrationFee) + (withAddon ? addonFee : 0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Palette.neutralWhite,
      appBar: AppBar(
        title: const Text('Event Registration'),
        backgroundColor: Palette.gradientStart,
        foregroundColor: Colors.white,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _header('Attendance Type'),
            _radioTile('Onsite', true),

            _header('Free GMM'),
            Checkbox(
              value: freeGMM,
              onChanged: (val) => setState(() => freeGMM = val!),
            ),

            _header('Add-ons (Include 15,000 Mem-Fee)'),
            Checkbox(
              value: withAddon,
              onChanged: (val) => setState(() => withAddon = val!),
            ),

            _header('Coupon'),
            WidgetTextField(
              controller: couponController,
              hintText: 'Enter coupon (if applicable)',
              isFilled: true,
              fillColor: Palette.neutralWhite,
              enabledBorderSideColor: Palette.neutralLightGray,
              focusedBorderSideColor: Palette.neutralLightGray,
              textColor: Palette.neutralBlack,
            ),
            const Gap(20),

            _header('Total Due'),
            WidgetTextField(
              controller: TextEditingController(
                text: '₱ ${totalFee.toStringAsFixed(2)}',
              ),
              isFilled: true,
              fillColor: Palette.neutralGray.withOpacity(0.2),
              enabledBorderSideColor: Colors.transparent,
              textColor: Colors.black,
              keyboardType: TextInputType.number,
            ),
            const Gap(20),

            _header('Payment Breakdown'),
            _breakdownRow(
              'Registration Fee:',
              '₱ ${(freeGMM ? 0 : registrationFee).toStringAsFixed(2)}',
            ),
            if (withAddon)
              _breakdownRow('Add-ons:', '₱ ${addonFee.toStringAsFixed(2)}'),
            _breakdownRow('Total:', '₱ ${totalFee.toStringAsFixed(2)}'),

            const Gap(20),
            _header('Payment Method'),
            RadioListTile(
              value: 'paymaya',
              groupValue: paymentMethod,
              onChanged: (val) => setState(() => paymentMethod = val!),
              contentPadding: EdgeInsets.zero,
              title: const Text(
                'Card payments/Paymaya (will be directed to Paymaya Portal)',
                style: TextStyle(fontSize: 14),
              ),
              activeColor: Palette.accentBlue,
            ),
            RadioListTile(
              value: 'bank',
              groupValue: paymentMethod,
              onChanged: (val) => setState(() => paymentMethod = val!),
              contentPadding: EdgeInsets.zero,
              title: const Text(
                'Bank transfer/Bank Deposit',
                style: TextStyle(fontSize: 14),
              ),
              activeColor: Palette.accentBlue,
            ),

            if (paymentMethod == 'bank') _buildBankDetails(),

            const Gap(16),
            Row(
              children: [
                Checkbox(
                  value: acceptedTerms,
                  onChanged: (val) => setState(() => acceptedTerms = val!),
                ),
                const Expanded(
                  child: WidgetText(
                    title: 'I accept the Terms and Services and Privacy Policy',
                    size: 14,
                  ),
                ),
              ],
            ),

            const Gap(24),
            _formActions(),
            const Gap(40),
          ],
        ),
      ),
    );
  }

  Widget _header(String title) => Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [WidgetText(title: title, size: 14), const Gap(8)],
  );

  Widget _radioTile(String label, bool selected, {VoidCallback? onTap}) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Radio(
          value: true,
          groupValue: selected,
          onChanged: (_) => onTap?.call(),
        ),
        const Gap(4),
        Expanded(child: WidgetText(title: label, size: 14, maxLine: 3)),
      ],
    );
  }

  Widget _breakdownRow(String label, String amount) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 6),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          WidgetText(title: label, size: 14),
          WidgetText(title: amount, size: 14, isBold: true),
        ],
      ),
    );
  }

  Widget _buildBankDetails() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Gap(10),
        const WidgetText(
          title: 'Please attach the photo or screenshot of your deposit slip',
          size: 14,
        ),
        const Gap(10),
        _boldBankDetail(
          'BDO Account Name:',
          'JUNIOR CHAMBER INTERNATIONAL OF MANILA INC.',
        ),
        _boldBankDetail('BDO Account No.:', '000560289081'),
        _boldBankDetail(
          'Unionbank Account Name:',
          'JUNIOR CHAMBER INTERNATIONAL OF MANILA INC.',
        ),
        _boldBankDetail('Unionbank Account No.:', '000560289081'),
        const Gap(14),
        SizedBox(
          width: double.infinity,
          child: OutlinedButton(
            onPressed: () {},
            style: OutlinedButton.styleFrom(
              side: const BorderSide(color: Palette.accentBlue),
              padding: const EdgeInsets.symmetric(vertical: 14),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            child: const Text(
              'Upload picture',
              style: TextStyle(
                color: Palette.accentBlue,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _boldBankDetail(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: RichText(
        text: TextSpan(
          style: const TextStyle(color: Colors.black, fontSize: 14),
          children: [
            TextSpan(text: '$label\n'),
            TextSpan(
              text: value,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }

  Widget _formActions() {
    return Row(
      children: [
        Expanded(
          child: OutlinedButton(
            onPressed: () {},
            style: OutlinedButton.styleFrom(
              side: const BorderSide(color: Palette.accentBlue),
              padding: const EdgeInsets.symmetric(vertical: 14),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            child: const Text(
              'Cancel',
              style: TextStyle(
                color: Palette.accentBlue,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        const Gap(12),
        Expanded(
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Palette.accentBlue,
              foregroundColor: Palette.neutralWhite,
              padding: const EdgeInsets.symmetric(vertical: 14),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            onPressed: () {},
            child: const Text(
              'Submit',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ],
    );
  }
}
