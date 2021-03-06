import 'package:certificate_pass/pages/exam/exam_router.dart';
import 'package:certificate_pass/pages/home/home_page.dart';
import 'package:certificate_pass/pages/index/index_router.dart';
import 'package:certificate_pass/pages/login/login_router.dart';
import 'package:certificate_pass/pages/profile/profile_router.dart';
import 'package:certificate_pass/pages/resource/resource_router.dart';
import 'package:certificate_pass/routes/i_router.dart';
import 'package:certificate_pass/routes/not_found_page.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';

class Routes {
  static String home = '/home';
  static final List<IRouterProvider> _listRouter = [];
  static final FluroRouter router = FluroRouter();

  static void initRoutes() {
    router.notFoundHandler = Handler(
        handlerFunc: (BuildContext? context, Map<String, List<String>> params) {
      return const NotFoundPage();
    });

    router.define(home,
        handler: Handler(
            handlerFunc:
                (BuildContext? context, Map<String, List<String>> params) =>
                    Home(curPage: params["index"]?.first)));

    _listRouter.add(IndexRouter());
    _listRouter.add(ProfileRouter());
    _listRouter.add(ExamRouter());
    _listRouter.add(LoginRouter());
    _listRouter.add(ResourceRouter());

    /// 初始化路由
    void initRouter(IRouterProvider routerProvider) {
      routerProvider.initRouter(router);
    }

    _listRouter.forEach(initRouter);
  }
}
