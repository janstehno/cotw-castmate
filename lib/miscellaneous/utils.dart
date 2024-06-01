import 'package:cotwcastmate/interface/interface.dart';
import 'package:cotwcastmate/miscellaneous/enums.dart';
import 'package:cotwcastmate/widgets/app/bar_snack.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Utils {
  static Color backgroundAt(int i) => i % 2 == 0 ? Interface.odd : Interface.even;

  static void _hideSnackBar(BuildContext context) => ScaffoldMessenger.of(context).hideCurrentSnackBar();

  static void _buildSnackBar(WidgetSnackBar snackBar, BuildContext context) {
    _hideSnackBar(context);
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: const Duration(milliseconds: 1000),
        padding: const EdgeInsets.all(0),
        backgroundColor: Interface.primaryDark,
        content: GestureDetector(
          onTap: () {
            _hideSnackBar(context);
          },
          child: snackBar,
        ),
      ),
    );
  }

  static void buildSnackBarMessage(String message, ProcessType process, BuildContext context) {
    _buildSnackBar(
      WidgetSnackBar(
        text: message,
        process: process,
      ),
      context,
    );
  }

  static String removePointZero(double value) {
    String text = value.toString();
    List<String> split = text.split(".");
    return (split.length == 2 && split[1] == "0") ? split[0] : text;
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
