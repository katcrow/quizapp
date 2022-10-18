import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/config.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:get/get.dart';
import '../../configs/themes/app_colors.dart';
import '../../configs/themes/app_icons.dart';
import '../../configs/themes/custom_text_styles.dart';
import '../../controllers/zoom_drawer_controller.dart';
import '../../widgets/app_circle_button.dart';
import '../home/menu_screen.dart';
import 'package:webview_flutter/webview_flutter.dart';

class HealthSurvey extends GetView<MyZoomDrawerController> {
  const HealthSurvey({Key? key}) : super(key: key);

  static const String routeName = "/survey";

  @override
  Widget build(BuildContext context) {
    final webController = Completer<WebViewController>();
    // var loadingPercentage = 0.obs;

    return Scaffold(
      body: GetBuilder<MyZoomDrawerController>(builder: (_) {
        return ZoomDrawer(
            menuScreenWidth: MediaQuery.of(context).size.width,
            borderRadius: 50.0,
            showShadow: false,
            moveMenuScreen: false,
            angle: 0.0,
            style: DrawerStyle.defaultStyle,
            menuBackgroundColor: Colors.transparent,
            menuScreenOverlayColor: Colors.transparent,
            slideWidth: MediaQuery.of(context).size.width * 0.7,
            controller: _.zoomDrawerController,
            menuScreen: MyMenuScreen(),
            mainScreen: SafeArea(
              child: Container(
                decoration: BoxDecoration(gradient: mainGradient()),
                child: Stack(
                  children: [
                    Positioned(
                      top: 20,
                      left: 20,
                      child: AppCircleButton(
                        onTap: controller.toggleDrawer,
                        child: Icon(AppIcons.menuLeft),
                      ),
                    ),
                    SizedBox(height: 15),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 50,
                        horizontal: 20,
                      ),
                      child: Row(
                        children: [
                          Icon(AppIcons.peace),
                          SizedBox(width: 5),
                          Text(
                            "전문가의 진정한 경험을 체험해보세요.",
                            style: detailText.copyWith(
                              color: onSurfaceTextColor,
                            ),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 80.0),
                      child: WebView(
                        initialUrl:
                            'https://landbot.pro/v3/H-1395626-BZBBU5WJNLDTJ3UQ/index.html',
                        onWebViewCreated: (webViewController) {
                          webController.complete(webViewController);
                        },
                        onPageStarted: (url) {
                          // setState(() {
                          //   loadingPercentage = 0;
                          // });
                        },
                        onProgress: (progress) {
                          // setState(() {
                          //   loadingPercentage = progress;
                          // });
                        },
                        onPageFinished: (url) {
                          // setState(() {
                          //   loadingPercentage = 100;
                          // });
                        },
                        navigationDelegate: (navigation) {
                          final host = Uri.parse(navigation.url).host;
                          if (host.contains('youtube.com')) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(
                                  'Blocking navigation to $host',
                                ),
                              ),
                            );
                            return NavigationDecision.prevent;
                          }
                          return NavigationDecision.navigate;
                        },
                        javascriptMode: JavascriptMode.unrestricted,
                        // Add this line
                        // javascriptChannels: _createJavascriptChannels(context),
                      ),
                    ),
                    // if (loadingPercentage< 100)
                    //   LinearProgressIndicator(
                    //     value: loadingPercentage / 100.0,
                    //     minHeight: 5,
                    //     color: Colors.redAccent,
                    //   ),
                  ],
                ),
              ),
            ));
      }),
    );
  }

// Set<JavascriptChannel> _createJavascriptChannels(BuildContext context) {
//   return {
//     JavascriptChannel(
//       name: 'SnackBar',
//       onMessageReceived: (message) {
//         ScaffoldMessenger.of(context)
//             .showSnackBar(SnackBar(content: Text(message.message)));
//       },
//     ),
//   };
// }
}
