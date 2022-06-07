import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:get_it/get_it.dart';
import 'app_controller.dart';
import 'config/app_colors.dart';
import 'config/app_routes.dart';

class PayFlowApp extends StatelessWidget {
  const PayFlowApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(statusBarColor: Colors.transparent),
    );

    return MultiBlocProvider(
      providers: const [],
      child: StreamBuilder<Locale>(
        stream: GetIt.I.get<AppController>().locateGlobal.stream,
        builder: (context, snapshot) {
          return MaterialApp(
            locale: snapshot.data,
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              useMaterial3: true,
              colorScheme: ColorScheme.fromSeed(seedColor: AppColors.orange),
              scaffoldBackgroundColor: AppColors.shape,
            ),
            localizationsDelegates: AppLocalizations.localizationsDelegates,
            supportedLocales: AppLocalizations.supportedLocales,
            initialRoute: Routes.login,
            routes: AppRoutes.pages,
          );
        },
      ),
    );
  }
}
