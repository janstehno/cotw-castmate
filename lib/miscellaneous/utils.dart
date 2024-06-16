import 'dart:math';

import 'package:cotwcastmate/interface/interface.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Utils {
  static Color backgroundAt(int i) => i % 2 == 0 ? Interface.odd : Interface.even;

  static String removePointZero(double value) {
    String text = value.toString();
    List<String> split = text.split(".");
    String newText = split.length == 2 ? "${split[0]}.${split[1].substring(0, min(2, split[1].length))}" : split[0];
    return (split.length == 2 && split[1] == "0") ? split[0] : newText;
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
