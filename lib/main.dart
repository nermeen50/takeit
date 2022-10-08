import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:v_room_app/Blocs/account_bloc.dart';
import 'package:v_room_app/Blocs/availableTimeHome_bloc.dart';
import 'package:v_room_app/Blocs/booking_bloc.dart';
import 'package:v_room_app/Blocs/change_password_bloc.dart';
import 'package:v_room_app/Blocs/details_order_bloc.dart';
import 'package:v_room_app/Blocs/edit_profile_bloc.dart';
import 'package:v_room_app/Blocs/forget_password_bloc.dart';
import 'package:v_room_app/Blocs/home_bloc.dart';
import 'package:v_room_app/Blocs/login_bloc.dart';
import 'package:v_room_app/Blocs/orders_bloc.dart';
import 'package:v_room_app/Blocs/register_bloc.dart';
import 'package:v_room_app/Blocs/resturant_bloc.dart';
import 'package:v_room_app/screens/home.dart';
import 'package:v_room_app/screens/splash.dart';
import 'package:v_room_app/utils/ColorsUtils.dart';
import 'package:v_room_app/utils/Constants.dart';
import 'package:v_room_app/utils/FontsUtils.dart';
import 'package:v_room_app/utils/PreferenceManger.dart';
import 'package:v_room_app/utils/TokenUtil.dart';
import 'generated/l10n.dart';

main(List<String> args) async {
  WidgetsFlutterBinding.ensureInitialized();
  var prefs = await SharedPreferences.getInstance();
  var token = await PreferenceManager.getInstance().getString('token');

  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
  ));
  print('App Language ${prefs.getString(Constants.languageCode)}');
  print('Token${token}');
  runApp(ProviderScope(
      child: MyMaterial(
    localeApp: prefs.getString(Constants.languageCode),
    token: token,
  )));
}

class MyMaterial extends ConsumerWidget {
  var localeApp;
  var token;

  MyMaterial({this.localeApp, this.token});
  @override
  Widget build(BuildContext context, watch) {
    // var locProvider = watch(localProvider);
    // print(locProvider.appLocal);
    print(localeApp);

    return ScreenUtilInit(
      designSize: Size(428, 926),
      builder: () => MultiBlocProvider(
        providers: [
          BlocProvider<RegisterBloc>(create: (_) => RegisterBloc()),
          BlocProvider<LoginBloc>(create: (_) => LoginBloc()),
          BlocProvider<ForgetPasswordBloc>(create: (_) => ForgetPasswordBloc()),
          BlocProvider<HomeBloc>(create: (_) => HomeBloc()),
          BlocProvider<AvailableTimeHomeBloc>(
              create: (_) => AvailableTimeHomeBloc()),
          BlocProvider<ResturantBloc>(create: (_) => ResturantBloc()),
          BlocProvider<BookingBolc>(create: (_) => BookingBolc()),
          BlocProvider<AccountBloc>(create: (_) => AccountBloc()),
          BlocProvider<ChangPaawordeBloc>(create: (_) => ChangPaawordeBloc()),
          BlocProvider<OrdersBloc>(create: (_) => OrdersBloc()),
          BlocProvider<OrderDetailsBloc>(create: (_) => OrderDetailsBloc()),
          BlocProvider<EditProfileBloc>(create: (_) => EditProfileBloc()),
        ],
        child: GetMaterialApp(
          debugShowCheckedModeBanner: true,
          locale: Locale(localeApp.toString()),
          theme: ThemeData(
            primaryColor: ColorsUtils.primaryYellow,
            scaffoldBackgroundColor: localeApp == 'ar'
                ? ColorsUtils.arabicBackgroundColor
                : ColorsUtils.englishBackgroundColor,
            fontFamily: FontUtils.CAIRO_FONT,
          ),
          supportedLocales: S.delegate.supportedLocales,
          localizationsDelegates: [
            S.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          home: token != '' ? Home() : Splash(),
        ),
      ),
    );
  }
}
