import 'package:flutter/material.dart';
import 'package:preferences_app/providers/providers.dart';
import 'package:preferences_app/screens/screens.dart';
import 'package:provider/provider.dart';

import 'share_preferences/preferences.dart';


void main() async {

  WidgetsFlutterBinding.ensureInitialized();

  await Preferences.init();

  runApp(

    MultiProvider(

      providers: [
        ChangeNotifierProvider( create: ( _ ) => ThemeProvider(isDarkMode: Preferences.isDarkMode ) )
      ],

      child: const MyApp(),

    )
    

  );

}

class MyApp extends StatelessWidget {

  const MyApp({
    Key? key
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      initialRoute: HomeScreen.routerName,
      routes: {
        HomeScreen.routerName    : ( _ ) => const HomeScreen(),
        SettingScreen.routerName : ( _ ) => const SettingScreen()
      },
      theme: Provider.of<ThemeProvider>(context).currentTheme,
    );
  }
}