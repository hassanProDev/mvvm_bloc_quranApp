import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:marquee_text/marquee_text.dart';
import 'package:mvvm_islami_app/theming/my_theme.dart';
import 'package:mvvm_islami_app/view%20model/radio/radio_cubit.dart';

import '../../../view model/app_theme/app_theme_cubit.dart';

class RadioScreen extends StatelessWidget {
  double size = 50;
  Color color = MyTheming.borderColor;

  // late Future<RadioModel> radioData;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          AppLocalizations.of(context)!.apptitle,
          style: Theme.of(context).textTheme.headline1,
        ),
      ),
      body: BlocProvider(
        create: (context) => RadioCubit(),
        child: BlocConsumer<RadioCubit, RadioState>(
          listener: (context, state) {
            // RadioLoaded(radioData: radioData);
          },
          // buildWhen: (previuos,current){
          //   if(previuos is RadioInitial){
          //     print('you have some logic error ');
          //     current==RadioError('');
          //   }
          // },
          builder: (context, state) {
            RadioCubit myCubit = BlocProvider.of(context);
            AppThemeCubit myAppThemeCubit = BlocProvider.of(context);
            // myCubit.emit(RadioLoaded(radioData: radioData));
            // return FutureBuilder<RadioModel>(
            //     future: radioData,
            //     builder: (context, snapshot) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset('assets/images/radioImg.png'),
                Container(
                  child: MarqueeText(
                    alwaysScroll: true,
                    // marqueeDirection: MarqueeDirection.btt,
                    text: TextSpan(text: 'Quran Radio'),
                    style: Theme.of(context).textTheme.headline4,
                    speed: 5,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    InkWell(
                      onTap: () {},
                      child: Icon(
                        myAppThemeCubit.leftIcon,
                        color: MyTheming.borderColor,
                        size: size,
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        myCubit.changeStatus();
                      },
                      child: Icon(
                        myCubit.icon,
                        color: MyTheming.borderColor,
                        size: size,
                      ),
                    ),
                    InkWell(
                      onTap: () {},
                      child: Icon(
                        myAppThemeCubit.rightIcon,
                        color: MyTheming.borderColor,
                        size: size,
                      ),
                    ),
                  ],
                ),
              ],
            );
            // });
          },
        ),
      ),
    );
  }
}
