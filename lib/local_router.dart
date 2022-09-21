import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:flutter_master/pages/home_page.dart';
import 'package:flutter_master/pages/main/index.dart';
import 'package:flutter_master/pages/main/mine.dart';
const PHOTO_PREVIEW_PAGE = '/photo-preview-page';


const HOME_PAGE = '/home-page';
const HOME_INDEX_PAGE = '/home-index-page';
const HOME_MINE_PAGE = '/home-mine-page';
const HOME_NEIGHBOR_PAGE = '/home-neighbor-page';
const WEB_PAGE = '/web-page';

class LocalRouter {
  List<GetPage> getPages() {
    return [
      GetPage(
        name: HOME_PAGE,
        page: () => HomePage(),
        children: [
          GetPage(name: HOME_INDEX_PAGE, page: () => Index()),
          GetPage(name: HOME_MINE_PAGE, page: () => Mine()),
        ],
      ),
    ];
  }
}
