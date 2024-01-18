import 'package:get/get.dart';
import 'package:zib/pages/FullScreenPlayer.dart';
import 'package:zib/pages/HomePage.dart';
import 'package:zib/pages/MyWebViewPage.dart';

import '../pages/player_page/player_page_view.dart';


final pages = <GetPage>[
  GetPage(name: "/", page: () => const HomePage()),
  // GetPage(name: "/explore", page: () => MainCentral()),
  // GetPage(name: "/highlight", page: () => const HighlightPage()),
  // GetPage(name: "/following", page: () => MainCentral()),
  GetPage(name: "/player", page: () => const PlayerPage(),transition: Transition.topLevel),
  GetPage(name: "/full_screen_player", page: () =>  const FullScreenPlayer(),transition: Transition.topLevel),
  GetPage(name: "/webview", page: () => const MyWebViewPage()),
];
