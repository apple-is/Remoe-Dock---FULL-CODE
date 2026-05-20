import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';
import 'core/theme/app_theme.dart';
import 'data/models/device_model.dart';
import 'data/providers/device_provider.dart';
import 'l10n/app_localizations.dart';
import 'l10n/language_provider.dart';
import 'features/home/home_screen.dart';
import 'features/help/tutorial_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(DeviceModelAdapter());
  await Hive.openBox<DeviceModel>('devices');
  await Hive.openBox('settings');

  final settingsBox = Hive.box('settings');
  final hasSeenTutorial = settingsBox.get('tutorial_seen', defaultValue: false);

  runApp(RemoteDockApp(showTutorial: !hasSeenTutorial));
}

class RemoteDockApp extends StatelessWidget {
  final bool showTutorial;

  const RemoteDockApp({super.key, this.showTutorial = false});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => LanguageProvider(),
      child: Consumer<LanguageProvider>(
        builder: (context, langProvider, _) {
          return ChangeNotifierProvider(
            create: (context) => DeviceProvider(),
            child: MaterialApp(
              title: 'Remote Dock',
              debugShowCheckedModeBanner: false,
              theme: AppTheme.getThemeForTime(),
              localizationsDelegates: const [
                AppLocalizations.delegate,
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
              ],
              supportedLocales: const [
                Locale('en', ''),
                Locale('de', ''),
              ],
              locale: langProvider.locale,
              home: _getInitialScreen(showTutorial),
            ),
          );
        },
      ),
    );
  }

  Widget _getInitialScreen(bool showTutorial) {
    if (showTutorial) {
      return const TutorialScreen();
    }

    return const HomeScreen();
  }
}
