import 'package:get/get.dart';
import 'package:zib/pages/HomePage.dart';
import 'package:zib/pages/MyWebViewPage.dart';

import '../pages/PlayerPage.dart';

final pages = <GetPage>[
  GetPage(name: "/", page: () => const HomePage()),
  // GetPage(name: "/explore", page: () => MainCentral()),
  // GetPage(name: "/highlight", page: () => const HighlightPage()),
  // GetPage(name: "/following", page: () => MainCentral()),
  GetPage(name: "/player", page: () => const PlayerPage()),
  GetPage(name: "/webview", page: () => const MyWebViewPage()),
];
