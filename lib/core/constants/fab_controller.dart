import 'package:flutter/material.dart';

enum FABDesignType { defaultFab, altFab }

class FABController {
  static final ValueNotifier<bool> showFAB = ValueNotifier(false);
  static final ValueNotifier<FABDesignType> fabDesignType = ValueNotifier(
    FABDesignType.defaultFab,
  );
}
