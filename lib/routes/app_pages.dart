import 'package:cappuccino/middleware/auth_middleware.dart';
import 'package:cappuccino/pages/app/app_binding.dart';
import 'package:cappuccino/pages/app/app_view.dart';
import 'package:cappuccino/pages/frame/frame_binding.dart';
import 'package:cappuccino/pages/frame/frame_view.dart';
import 'package:cappuccino/pages/home/article_detail/article_detail_binding.dart';
import 'package:cappuccino/pages/home/article_detail/article_detail_view.dart';
import 'package:cappuccino/pages/home/home_binding.dart';
import 'package:cappuccino/pages/home/home_view.dart';
import 'package:cappuccino/pages/home/video_detail/video_detail_binding.dart';
import 'package:cappuccino/pages/home/video_detail/video_detail_view.dart';
import 'package:cappuccino/pages/login/login_binding.dart';
import 'package:cappuccino/pages/login/login_view.dart';
import 'package:cappuccino/pages/login/other_login/other_login_binding.dart';
import 'package:cappuccino/pages/login/other_login/other_login_view.dart';
import 'package:cappuccino/pages/message/message_binding.dart';
import 'package:cappuccino/pages/message/message_detail/message_detail_binding.dart';
import 'package:cappuccino/pages/message/message_detail/message_detail_view.dart';
import 'package:cappuccino/pages/message/message_view.dart';
import 'package:cappuccino/pages/my/my_binding.dart';
import 'package:cappuccino/pages/my/my_view.dart';
import 'package:cappuccino/pages/my/scan/scan_binding.dart';
import 'package:cappuccino/pages/my/scan/scan_view.dart';
import 'package:cappuccino/pages/my/setting/setting_binding.dart';
import 'package:cappuccino/pages/my/setting/setting_view.dart';
import 'package:cappuccino/pages/my/setting/theme/theme_binding.dart';
import 'package:cappuccino/pages/my/setting/theme/theme_view.dart';
import 'package:cappuccino/pages/my/user/area/area_binding.dart';
import 'package:cappuccino/pages/my/user/area/area_view.dart';
import 'package:cappuccino/pages/my/user/nick_name/nick_name_binding.dart';
import 'package:cappuccino/pages/my/user/nick_name/nick_name_view.dart';
import 'package:cappuccino/pages/my/user/profile/profile_binding.dart';
import 'package:cappuccino/pages/my/user/profile/profile_view.dart';
import 'package:cappuccino/pages/my/user/user_binding.dart';
import 'package:cappuccino/pages/my/user/user_view.dart';
import 'package:cappuccino/pages/no_found/no_found_view.dart';
import 'package:cappuccino/pages/release/video_edit/video_edit_binding.dart';
import 'package:cappuccino/pages/release/video_edit/video_edit_view.dart';
import 'package:cappuccino/pages/search/search_binding.dart';
import 'package:cappuccino/pages/search/search_view.dart';
import 'package:cappuccino/pages/shop/cart/cart_binding.dart';
import 'package:cappuccino/pages/shop/cart/cart_view.dart';
import 'package:cappuccino/pages/shop/shop_binding.dart';
import 'package:cappuccino/pages/shop/shop_detail/shop_detail_binding.dart';
import 'package:cappuccino/pages/shop/shop_detail/shop_detail_view.dart';
import 'package:cappuccino/pages/shop/shop_view.dart';
import 'package:cappuccino/pages/shop/store/store_binding.dart';
import 'package:cappuccino/pages/shop/store/store_view.dart';
import 'package:cappuccino/pages/splash/splash_binding.dart';
import 'package:cappuccino/pages/splash/splash_view.dart';
import 'package:get/get.dart';
import 'app_routes.dart';

abstract class AppPages {
  static final routes = [
    GetPage(
        name: Routes.app,
        page: () => const AppPage(),
        binding: AppBinding(),
        middlewares: [
          AuthMiddleware(),
        ]),
    GetPage(
        name: Routes.login,
        transition: Transition.fadeIn,
        page: () => const LoginPage(),
        binding: LoginBinding(),
        children: [
          GetPage(
            name: Routes.otherLogin,
            transition: Transition.cupertino,
            page: () => const OtherLoginPage(),
            binding: OtherLoginBinding(),
          ),
        ]),
    GetPage(
      name: Routes.splash,
      transition: Transition.fadeIn,
      page: () => const SplashPage(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: Routes.frame,
      page: () => const FramePage(),
      binding: FrameBinding(),
      transition: Transition.fadeIn,
    ),
    GetPage(
        name: Routes.home,
        page: () => const HomePage(),
        binding: HomeBinding(),
        transition: Transition.fade,
        children: [
          GetPage(
              name: Routes.homeVideo,
              page: () => const VideoDetailPage(),
              binding: VideoDetailBinding(),
              transition: Transition.cupertino),
          GetPage(
              name: Routes.homeArticle,
              page: () => const ArticleDetailPage(),
              binding: ArticleDetailBinding(),
              transition: Transition.cupertino),
        ]),
    GetPage(
        name: Routes.shop,
        page: () => const ShopPage(),
        binding: ShopBinding(),
        transition: Transition.fade,
        children: [
          GetPage(
              name: Routes.shopDetail,
              page: () => const ShopDetailPage(),
              binding: ShopDetailBinding(),
              transition: Transition.cupertino),
          GetPage(
              name: Routes.shopStore,
              page: () => const StorePage(),
              binding: StoreBinding(),
              transition: Transition.cupertino),
          GetPage(
              name: Routes.shopCart,
              page: () => const CartPage(),
              binding: CartBinding(),
              transition: Transition.cupertino),
        ]),
    GetPage(
        name: Routes.message,
        page: () => const MessagePage(),
        binding: MessageBinding(),
        transition: Transition.fade,
        children: [
          GetPage(
              name: Routes.messageDetail,
              page: () => const MessageDetailPage(),
              binding: MessageDetailBinding(),
              transition: Transition.cupertino),
        ]),
    GetPage(
        name: Routes.search,
        page: () => const SearchPage(),
        binding: SearchBinding(),
        transition: Transition.cupertino),
    GetPage(
        name: Routes.homeVideoEdit,
        page: () => const VideoEditPage(),
        binding: VideoEditBinding(),
        transition: Transition.downToUp),
    GetPage(
        name: Routes.my,
        page: () => const MyPage(),
        binding: MyBinding(),
        transition: Transition.fade,
        children: [
          GetPage(
              name: Routes.mySetting,
              page: () => const SettingPage(),
              binding: SettingBinding(),
              transition: Transition.cupertino,
              children: [
                GetPage(
                    name: Routes.mySettingTheme,
                    page: () => const ThemePage(),
                    binding: ThemeBinding(),
                    transition: Transition.cupertino),
              ]),
          GetPage(
              name: Routes.myScan,
              page: () => const ScanPage(),
              binding: ScanBinding(),
              transition: Transition.cupertino),
          GetPage(
              name: Routes.myUser,
              page: () => const UserPage(),
              binding: UserBinding(),
              transition: Transition.cupertino,
              children: [
                GetPage(
                    name: Routes.myUserNickName,
                    page: () => const NickNamePage(),
                    binding: NickNameBinding(),
                    transition: Transition.cupertino),
                GetPage(
                    name: Routes.myUserProfile,
                    page: () => const ProfilePage(),
                    binding: ProfileBinding(),
                    transition: Transition.cupertino),
                GetPage(
                    name: Routes.myUserArea,
                    page: () => const AreaPage(),
                    binding: AreaBinding(),
                    transition: Transition.cupertino),
              ]
          ),
        ]),
  ];
  static final unknownRoute = GetPage(
    name: Routes.notFound,
    page: () => const NoFoundPage(),
  );
}
