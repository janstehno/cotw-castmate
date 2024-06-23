import 'package:cotwcastmate/interface/interface.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Utils {
  static Color backgroundAt(int i) => i % 2 == 0 ? Interface.odd : Interface.even;

  static String formatDouble(double value) {
    String text = value.toStringAsFixed(2);
    if (text.contains('.')) {
      text = text.replaceAll(RegExp(r'0*$'), '');
      text = text.replaceAll(RegExp(r'\.$'), '');
    }
    return text;
  }

  static void redirectTo(Uri uri) async {
    if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
      throw Exception("Unfortunately the link could not be launched. Please, go back or restart the application.");
    }
  }

  static void mailTo() async {
    if (!await launchUrl(Uri(scheme: 'mailto', path: 'toastovac@email.cz'), mode: LaunchMode.externalApplication)) {
      throw Exception("Unfortunately the link could not be launched. Please, go back or restart the application.");
    }
  }
}
