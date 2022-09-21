import 'package:color_app/paint_util/sketcher.dart';
import 'package:color_app/paint_util/stroke.dart';
import 'package:color_app/util/custom_decoration.dart';
import 'package:color_app/views/home/home_controller.dart';
import 'package:color_app/widget/app_bar_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  static final routeName = '/HomeScreen';
  final homeController = Get.put(HomeController());
  CustomDecoration _customDecoration = CustomDecoration();
  late PreferredSizeWidget _preferredSizeWidget;
  var mq;

  @override
  Widget build(BuildContext context) {
    homeController.context.value = context;
    mq = MediaQuery.of(context);
    return GetX<HomeController>(
        builder: (controller) {
          return Scaffold(
            backgroundColor: Colors.white,
            appBar: _preferredSizeWidget = AppBarWidget('Fill the color !!'),
            body: SafeArea(
              child: Stack(
                children: [
                  Positioned(
                    top: -(mq.padding.top + _preferredSizeWidget.preferredSize.height), bottom: -(mq.padding.top + _preferredSizeWidget.preferredSize.height), left: 0, right: 0,
                    child: RepaintBoundary(
                      child: StreamBuilder<List<Stroke>>(
                        stream: controller.linesStreamController.value.stream,
                        builder: (context, snapshot) {
                          return CustomPaint(
                            painter: Sketcher(
                              lines: controller.lines.value,
                              options: controller.options.value,
                            ),
                            child: Column(
                              children: [
                                Expanded(child: Container(color: Colors.white,)),
                                Container(
                                  color: Colors.transparent,
                                  height: mq.size.width,
                                  width: mq.size.width,
                                  child: SvgPicture.asset('assets/images/n_icon.svg', color: Colors.red,),
                                ),
                                Expanded(child: Container(color: Colors.white,)),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                  Positioned(
                    top: -(mq.padding.top + _preferredSizeWidget.preferredSize.height), bottom: -(mq.padding.top + _preferredSizeWidget.preferredSize.height), left: 0, right: 0,
                    child: Listener(
                      onPointerDown: controller.onPointerDown,
                      onPointerMove: controller.onPointerMove,
                      onPointerUp: controller.onPointerUp,
                      child: RepaintBoundary(
                        child: StreamBuilder<Stroke>(
                            stream: controller.currentLineStreamController.value.stream,
                            builder: (context, snapshot) {
                              return CustomPaint(
                                painter: Sketcher(
                                  lines: [controller.line.value],
                                  options: controller.options.value,
                                ),
                                child: Column(
                                  children: [
                                    Expanded(child: Container(color: Colors.white,)),
                                    Container(
                                      color: Colors.transparent,
                                      height: mq.size.width,
                                      width: mq.size.width,
                                      child: SvgPicture.asset('assets/images/n_icon.svg', color: Colors.red,),
                                    ),
                                    Expanded(child: Container(color: Colors.white,)),
                                  ],
                                ),
                              );
                            },
                        ),
                      ),
                    ),
                  )
                  /*buildToolbar(),*/
                ],
              ),
            ),
            floatingActionButton: FloatingActionButton(
              onPressed: controller.clear,
              child: const Icon(Icons.replay),
            ),
          );
        }
    );
  }
}
