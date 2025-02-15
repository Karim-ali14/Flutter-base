import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_base/core/Constants/Constants.dart';
import 'package:flutter_base/core/constants/eunms.dart';
import 'package:flutter_base/features/auth/presentation/screens/change_password_screen.dart';
import 'package:flutter_base/features/auth/presentation/screens/forget_password_screen.dart';
import 'package:flutter_base/features/location/presentation/screens/location_permission_screen.dart';
import 'package:flutter_base/features/location/presentation/screens/search_location_screen.dart';
import 'package:flutter_base/features/notification/presentation/screens/notification_permission_screen.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:timeago/timeago.dart' as ago;
import 'core/Theme/app_theme.dart';
import 'core/constants/app_routes.dart';
import 'features/auth/presentation/screens/login_screen.dart';
import 'features/auth/presentation/screens/otp_screen.dart';
import 'features/auth/presentation/screens/sign_up_screen.dart';
import 'features/home/presentation/screens/cuisines_screen.dart';

late SharedPreferences prefs;

/*@pragma('vm:entry-point')
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();
  print("Handling a background message: ${message.messageId} ${message.data}");

}


void getNotificationsOnForeground({WidgetRef? ref}){
  FirebaseMessaging.onMessage.listen((RemoteMessage message) {
    print('Got a message whilst in the foreground!');
    print('Message data: ${message.data}');

    if (message.notification != null) {
      print('Message also contained a notification: ${message.notification} ${message.data}');
      ref?.read(getNotificationsProvider.notifier).getNotifications();
      ref?.read(notificationsCountProvider.notifier).getNotifications();
      NotificationsUtils.showNotification(message.notification?.title ?? "N/A", message.notification?.body ?? "N/A");
    }
  });
}

void handlingNotificationPermission() async {


  try{
    NotificationSettings settings = await FirebaseMessaging.instance.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
      sound: true,
    );

    print('User granted permission: ${settings.authorizationStatus}');
  }catch(e){

  }

}

Future<void> setupInteractedMessage(BuildContext context) async {

  RemoteMessage? initialMessage = await FirebaseMessaging.instance.getInitialMessage();

  if (initialMessage != null) {
    _handleMessage(initialMessage,context);
  }

  FirebaseMessaging.onMessageOpenedApp.listen((message){
    _handleMessage(message,context);
  });
}

void _handleMessage(RemoteMessage message,BuildContext context) {
  print("Data Opened ${message.data}");
  GoRouter.of(context).push(R_Teams);
}*/

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  // await Firebase.initializeApp(
  //   options: DefaultFirebaseOptions.currentPlatform,
  // );
  //SharedPrefs
  prefs = await SharedPreferences.getInstance();
  //FCM
  //final fcmToken = await FirebaseMessaging.instance.getToken();
  //Notifications
  //handlingNotificationPermission();

  // FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  // await FirebaseMessaging.instance.subscribeToTopic("championship");

  // Check if you received the link via `getInitialLink` first

  ago.setLocaleMessages('ar', ago.ArMessages());
  //Main App
  runApp(ProviderScope(
      child: EasyLocalization(supportedLocales: const [
    Locale("en"),
    Locale("ar"),
  ], path: 'assets/translations', child: MyApp())));
}

class MyApp extends ConsumerWidget {
  final appLang;
  MyApp({Key? key, this.appLang}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ThemeProvider(
      initTheme: Theme.of(context),
      duration: const Duration(milliseconds: 500),
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        title: 'BaseFlutter',
        themeMode: ThemeMode.light,
        theme: AppTheme.lightTheme,
        darkTheme: AppTheme.darkTheme,
        localizationsDelegates: context.localizationDelegates,
        supportedLocales: context.supportedLocales,
        locale: context.locale,
        routerDelegate: _router.routerDelegate,
        routeInformationProvider: _router.routeInformationProvider,
        routeInformationParser: _router.routeInformationParser,
      ),
    );
  }

  final GoRouter _router = GoRouter(
    routes: <GoRoute>[
      GoRoute(
        path: splashScreenRoute,
        builder: (BuildContext context, GoRouterState state) =>
            CuisinesScreen(),
      ),
      GoRoute(
        path: loginScreenRoute,
        builder: (BuildContext context, GoRouterState state) => LoginScreen(),
      ),
      GoRoute(
        path: signUpScreenRoute,
        builder: (BuildContext context, GoRouterState state) => SignUpScreen(),
      ),
      GoRoute(
        path: changePasswordScreenRoute,
        builder: (BuildContext context, GoRouterState state) {
          var extra = state.extra as Map;
          return ChangePassword(
            Phone: extra[PHONE_KEY],
          );
        },
      ),
      GoRoute(
          path: otpScreenRoute,
          builder: (BuildContext context, GoRouterState state) {
            var extra = state.extra as Map;
            return OTPScreen(
              phone: extra[PHONE_KEY],
              otpType: extra[OTP_TYPE_KEY] as OTPType,
            );
          }),
      GoRoute(
        path: forgetPasswordScreenRoute,
        builder: (BuildContext context, GoRouterState state) =>
            ForgetPasswordScreen(),
      ),
      GoRoute(
        path: locationPermissionScreenRoute,
        builder: (BuildContext context, GoRouterState state) =>
            LocationPermissionScreen(),
      ),
      GoRoute(
        path: notificationPermissionScreenRoute,
        builder: (BuildContext context, GoRouterState state) =>
            NotificationPermissionScreen(),
      ),
      GoRoute(
        path: searchLocationScreenRoute,
        builder: (BuildContext context, GoRouterState state) =>
            SearchLocationScreen(),
      ),
      GoRoute(
        path: cuisinesScreenRoute,
        builder: (BuildContext context, GoRouterState state) =>
            CuisinesScreen(),
      ),
    ],
  );
}
