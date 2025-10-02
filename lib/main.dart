import 'package:flutter/material.dart';
import 'package:flutter/services.dart' as services;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smilecheck_ai/bloc/auth_bloc/auth_bloc.dart';
import 'package:smilecheck_ai/bloc/brushing_bloc/brushing_bloc.dart';
import 'package:smilecheck_ai/bloc/teeth_bloc/teeth_bloc.dart';
import 'package:smilecheck_ai/configs/configs.dart';
import 'package:smilecheck_ai/notifications/notification_service.dart';
import 'package:smilecheck_ai/routes/router.dart';
import 'package:smilecheck_ai/routes/routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  services.SystemChrome.setSystemUIOverlayStyle(
    const services.SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      systemNavigationBarColor: Colors.white,
      systemNavigationBarDividerColor: Colors.transparent,
    ),
  );
  services.SystemChrome.setEnabledSystemUIMode(
    services.SystemUiMode.edgeToEdge,
    overlays: [services.SystemUiOverlay.top],
  );
  await NotificationService().init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(414, 896),
      child: MultiBlocProvider(
        providers: [
          BlocProvider(create: (_) => AuthBloc()),
          BlocProvider(create: (_) => TeethBloc()),
          BlocProvider(create: (_) => BrushingBloc()),
        ],
        child: MaterialApp(
          builder: (context, child) {
            App.init(context);
            return child!;
          },
          title: 'Flutter Demo',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            scaffoldBackgroundColor: Colors.white,

            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          ),
          initialRoute: AppRoutes.login,
          onGenerateRoute: AppRouter.generateRoute,
        ),
      ),
    );
  }
}
