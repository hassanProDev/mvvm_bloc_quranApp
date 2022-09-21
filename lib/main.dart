import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mvvm_islami_app/theming/my_theme.dart';
import 'package:mvvm_islami_app/view%20model/app_theme/app_theme_cubit.dart';
import 'package:mvvm_islami_app/view/homeLayout/home.dart';
import 'package:mvvm_islami_app/view/screens/quran/sura_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

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
            debugShowCheckedModeBanner: false,
            initialRoute: HomeLayout.routeName,
            routes: {
              HomeLayout.routeName: (_) => HomeLayout(),
              SuraScreen.routeName: (_) => SuraScreen(),
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
