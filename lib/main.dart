import 'package:actionfigure_app/EditProduct.dart';
import 'package:actionfigure_app/addEditProduct.dart';
import 'package:actionfigure_app/cartPage.dart';
import 'package:actionfigure_app/detail_product.dart';
import 'package:actionfigure_app/home.dart';
import 'package:actionfigure_app/notification/push_notification.dart';
import 'package:actionfigure_app/product.dart';
import 'package:actionfigure_app/productAPI.dart';
import 'package:actionfigure_app/services/cart_provider.dart';
import 'package:actionfigure_app/services/product_provider.dart';
import 'package:actionfigure_app/setting.dart';
import 'package:actionfigure_app/sign_in.dart';
import 'package:actionfigure_app/signup_page.dart';
import 'package:actionfigure_app/splash_screen.dart';
import 'package:actionfigure_app/ui/theme.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();
  print('Handling a background message ${message.messageId}');
}

/// Create a [AndroidNotificationChannel] for heads up notifications
late AndroidNotificationChannel channel;

/// Initialize the [FlutterLocalNotificationsPlugin] package.
late FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin;

Future<void> _createAndroidNotification() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

  if (!kIsWeb) {
    channel = const AndroidNotificationChannel(
      'high_importance_channel', // id
      'High Importance Notifications', // title
      'This channel is used for important notifications.', // description
      importance: Importance.high,
    );

    flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

    await flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>()
        ?.createNotificationChannel(channel);

    await FirebaseMessaging.instance
        .setForegroundNotificationPresentationOptions(
      alert: true,
      badge: true,
      sound: true,
    );
  }
}

Future<void> main() async {
  await _createAndroidNotification();
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  debugPrint(
      "Token : ${(await FirebaseMessaging.instance.getToken()).toString()}");

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      RemoteNotification? notification = message.notification;
      AndroidNotification? android = message.notification?.android;
      if (notification != null && android != null && !kIsWeb) {
        flutterLocalNotificationsPlugin.show(
          notification.hashCode,
          notification.title,
          notification.body,
          NotificationDetails(
            android: AndroidNotificationDetails(
              channel.id,
              channel.name,
              channel.description,
              icon: 'launch_background',
            ),
          ),
        );
      }
    });

    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      debugPrint('A new onMessageOpenedApp event was published!');
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ProductProvider())
      ],
      child: MaterialApp(
        theme: ThemeData(scaffoldBackgroundColor: kbgColor),
        home: Scaffold(
          body: SignIn(),
        ),
      ),
    );
  }
}

class MyStatefulWidget extends StatefulWidget {
  MyStatefulWidget({
    Key? key,
  }) : super(key: key);

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  int _selectedIndex = 0;

  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);

  static List<Widget> _widgetOptions = <Widget>[
    HomePage(),
    // ProductPage(),
    ProductApiPage(),
    CartPage(),
    // addEditWidget(tittle: 'Tambahkan Produk'),
    // EditWidget(tittle: 'tittle'),
    SettingPage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => CartProvider()),
        ChangeNotifierProvider(create: (context) => ProductProvider())
      ],
      child: Scaffold(
        body: Center(
          child: _widgetOptions.elementAt(_selectedIndex),
        ),
        bottomNavigationBar: BottomNavigationBar(
          unselectedItemColor: kBlackColor.withOpacity(0.4),
          backgroundColor: kPurpleColor,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),

            // BottomNavigationBarItem(
            //   icon: Icon(Icons.smart_toy_outlined),
            //   label: 'Product',
            // ),

            BottomNavigationBarItem(
              icon: Icon(Icons.menu_book_rounded),
              label: 'Product',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart),
              label: 'Cart',
            ),
            //    BottomNavigationBarItem(
            //   icon: Icon(Icons.api_outlined),
            //   label: 'Add Product',
            // ),
            //                BottomNavigationBarItem(
            //   icon: Icon(Icons.api_outlined),
            //   label: 'Edit Product',
            // ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              label: 'Setting',
            ),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: kPurpleColor,
          onTap: _onItemTapped,
        ),
      ),
    );
  }
}
