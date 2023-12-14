import 'package:flutter/material.dart';

class AppRadius {
  static BorderRadius radius8 = BorderRadius.circular(8);
  static BorderRadius radius12 = BorderRadius.circular(12);
  static BorderRadius radius16 = BorderRadius.circular(16);

  static BorderRadius bottomRadius20 = const BorderRadius.only(
    bottomLeft: Radius.circular(20),
    bottomRight: Radius.circular(20),
  );
}
