import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:mvvm_islami_app/theming/my_theme.dart';
import 'package:mvvm_islami_app/view%20model/app_theme/app_theme_cubit.dart';
import 'package:mvvm_islami_app/view/homeLayout/home.dart';
import 'package:mvvm_islami_app/view/screens/ahadeth/hadeth_screen.dart';
import 'package:mvvm_islami_app/view/screens/quran/sura_screen.dart';
import 'package:mvvm_islami_app/view/screens/sebha/azkar_screen.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AppThemeCubit(),
      child: BlocConsumer<AppThemeCubit, AppThemeState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          AppThemeCubit myCubit = BlocProvider.of(context);
          return MaterialApp(
            localizationsDelegates: [
              AppLocalizations.delegate, // Add this line
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            supportedLocales: [
              Locale('en', ''), // English, no country code
              Locale('ar', ''), // Spanish, no country code
            ],
            locale: Locale(myCubit.lang),
            debugShowCheckedModeBanner: false,
            initialRoute: HomeLayout.routeName,
            routes: {
              HadethScreen.routeName: (_) => HadethScreen(),
              HomeLayout.routeName: (_) => HomeLayout(),
              SuraScreen.routeName: (_) => SuraScreen(),
              AzkarScreen.routeName: (_) => AzkarScreen(),
            },
            theme: MyTheming.themeApp,
            darkTheme: MyTheming.darkTheme,
            themeMode: myCubit.isDark ? ThemeMode.dark : ThemeMode.light,
          );
        },
      ),
    );
  }
}
