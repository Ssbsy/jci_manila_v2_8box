import 'package:flutter/material.dart';
import 'package:jci_manila_v2/app/widgets/widget_text.dart';
import 'package:jci_manila_v2/core/models/reaction.dart';

class ReactionsScreen extends StatefulWidget {
  final Reaction? reaction;
  const ReactionsScreen({super.key, this.reaction});

  @override
  State<ReactionsScreen> createState() => _ReactionsScreenState();
}

class _ReactionsScreenState extends State<ReactionsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: ListView(children: [_header(context)]));
  }

  Padding _header(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10, top: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: () {},
            child: Row(
              children: [
                const Icon(Icons.arrow_forward_ios, size: 15),
                const WidgetText(title: 'Comment', isBold: true),
              ],
            ),
          ),
          Row(
            children: [
              const WidgetText(title: 'Close'),
              const SizedBox(width: 5),
              GestureDetector(
                onTap: () => Navigator.pop(context),
                child: const Icon(Icons.close),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
