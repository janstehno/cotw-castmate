import 'package:cotwcastmate/builders/home.dart';
import 'package:cotwcastmate/generated/assets.gen.dart';
import 'package:cotwcastmate/generated/fonts.gen.dart';
import 'package:cotwcastmate/interface/interface.dart';
import 'package:cotwcastmate/interface/scroll_behavior.dart';
import 'package:cotwcastmate/interface/settings.dart';
import 'package:cotwcastmate/widgets/app/error.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  int language = sharedPreferences.getInt("language") ?? 0;
  bool imperialUnits = sharedPreferences.getBool("imperialUnits") ?? false;
  bool tackleEffectiveness = sharedPreferences.getBool("tackleEffectiveness") ?? false;
  runApp(
    EasyLocalization(
      path: "assets/translations",
      startLocale: const Locale("en"),
      fallbackLocale: const Locale("en"),
      supportedLocales: Settings.languageCodes,
      saveLocale: true,
      useFallbackTranslations: true,
      child: ChangeNotifierProvider(
        create: (BuildContext context) => Settings(
          language: language,
          imperialUnits: imperialUnits,
          tackleEffectiveness: tackleEffectiveness,
        ),
        child: const App(),
      ),
    ),
  );
}

class App extends StatelessWidget {
  const App({
    super.key,
  });

  void get _errorBuilder {
    ErrorWidget.builder = ((e) => MaterialApp(
          debugShowCheckedModeBanner: false,
          home: WidgetError(
            code: "ExA001",
            error: e.exception.toString(),
            stack: e.toString(),
          ),
        ));
  }

  ThemeData get _themeData {
    return ThemeData(
      brightness: Brightness.dark,
      scrollbarTheme: ScrollbarThemeData(
        thumbColor: WidgetStateProperty.all(Interface.primary),
      ),
      bottomSheetTheme: BottomSheetThemeData(
        backgroundColor: Colors.black.withOpacity(0),
      ),
      appBarTheme: const AppBarTheme(
        backgroundColor: Interface.primaryDark,
        toolbarHeight: 0,
        elevation: 0,
      ),
      textSelectionTheme: const TextSelectionThemeData(
        selectionColor: Interface.primaryDark,
        selectionHandleColor: Interface.primaryLight,
      ),
      fontFamily: FontFamily.normal,
    );
  }

  ScrollConfiguration _scrollConfiguration(Widget? widget) {
    return ScrollConfiguration(
      behavior: InvisibleScrollBehavior(),
      child: widget!,
    );
  }

  MaterialApp _buildApp(BuildContext context) {
    precacheImage(AssetImage(Assets.graphics.images.cotw.path), context);
    return MaterialApp(
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      debugShowCheckedModeBanner: false,
      builder: (BuildContext context, Widget? widget) {
        _errorBuilder;
        return _scrollConfiguration(widget);
      },
      theme: _themeData,
      home: const BuilderHome(),
    );
  }

  @override
  Widget build(BuildContext context) => _buildApp(context);
}
