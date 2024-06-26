import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:ma_biblio/src/books/books_add_view.dart';
import 'package:ma_biblio/src/home/home_view.dart';
import 'package:ma_biblio/src/library_model.dart';
import 'package:provider/provider.dart';
import 'library/library_view.dart';

import 'settings/settings_controller.dart';
import 'settings/settings_view.dart';

/// The Widget that configures your application.
class BiblioApp extends StatelessWidget {
  const BiblioApp({
    super.key,
    required this.settingsController,
  });

  final SettingsController settingsController;

  @override
  Widget build(BuildContext context) {
    // Glue the SettingsController to the MaterialApp.
    //
    // The ListenableBuilder Widget listens to the SettingsController for changes.
    // Whenever the user updates their settings, the MaterialApp is rebuilt.
    return Consumer<LibraryModel>(builder: (context, library, child) {
      // library.loadJsonFile();
      return ListenableBuilder(
        listenable: settingsController,
        builder: (BuildContext context, Widget? child) {
          return MaterialApp(
            // Providing a restorationScopeId allows the Navigator built by the
            // MaterialApp to restore the navigation stack when a user leaves and
            // returns to the app after it has been killed while running in the
            // background.
            restorationScopeId: 'app',

            // Provide the generated AppLocalizations to the MaterialApp. This
            // allows descendant Widgets to display the correct translations
            // depending on the user's locale.
            localizationsDelegates: const [
              AppLocalizations.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            supportedLocales: const [
              Locale('en', ''), // English, no country code
            ],

            // Use AppLocalizations to configure the correct application title
            // depending on the user's locale.
            //
            // The appTitle is defined in .arb files found in the localization
            // directory.
            onGenerateTitle: (BuildContext context) =>
                AppLocalizations.of(context)!.appTitle,

            // Define a light and dark color theme. Then, read the user's
            // preferred ThemeMode (light, dark, or system default) from the
            // SettingsController to display the correct theme.
            theme: lightThemeData(context),
            darkTheme: ThemeData.dark(),
            themeMode: settingsController.themeMode,

            // Define a function to handle named routes in order to support
            // Flutter web url navigation and deep linking.
            onGenerateRoute: (RouteSettings routeSettings) {
              return MaterialPageRoute<void>(
                settings: routeSettings,
                builder: (BuildContext context) {
                  switch (routeSettings.name) {
                    case SettingsView.routeName:
                      return SettingsView(controller: settingsController);
                    case LibraryView.routeName:
                      return const LibraryView();
                    case BookAddView.routeName:
                      return const BookAddView();
                    default:
                      return const HomeView();
                  }
                },
              );
            },
          );
        },
      );
    });
  }
}

// light Theme
ThemeData lightThemeData(BuildContext context) {
  const ColorScheme lightColorScheme = ColorScheme(
      brightness: Brightness.light,
      primary: Color.fromARGB(255, 23, 126, 137),
      onPrimary: Colors.white,
      secondary: Color.fromARGB(255, 8, 76, 97),
      onSecondary: Colors.white,
      error: Color.fromARGB(255, 219, 58, 52),
      onError: Colors.black,
      background: Color.fromARGB(230, 225, 230, 225),
      onBackground: Color.fromARGB(255, 8, 76, 97),
      surface: Color.fromARGB(100, 23, 126, 137),
      onSurface: Color.fromARGB(255, 8, 76, 97));
  return ThemeData.light().copyWith(
      colorScheme: lightColorScheme,
      canvasColor: lightColorScheme.background,
      scaffoldBackgroundColor: lightColorScheme.background,
      textTheme: const TextTheme(
          titleLarge: TextStyle(
              fontWeight: FontWeight.bold,
              color: Color.fromARGB(255, 8, 76, 97))));
}

// // dark Theme
// ThemeData darkThemeData(BuildContext context) {
//   return ThemeData.dark().copyWith(
//       primaryColor: Color(0xFFFF1D00),
//       colorScheme:
//           ColorScheme.fromSwatch().copyWith(secondary: Color(0xFF24A751)));
// }
