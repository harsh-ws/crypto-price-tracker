import 'package:flutter/material.dart';
import 'price_screen.dart';

void main() {
  runApp(MaterialApp(theme: ThemeData(
    colorScheme: ColorScheme.fromSwatch().copyWith(
      primary: Colors.grey[700],
    ),
  ),home: const PriceScreen(),));
}

