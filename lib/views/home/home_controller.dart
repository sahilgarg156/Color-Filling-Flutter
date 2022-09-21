import 'dart:async';
import 'dart:ui';
import 'package:color_app/paint_util/stroke.dart';
import 'package:color_app/paint_util/stroke_options.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:perfect_freehand/perfect_freehand.dart';

class HomeController extends GetxController {
  Rx<BuildContext> context = Rx<BuildContext>(Get.context!);
  Rx<List<Stroke>> lines = Rx<List<Stroke>>([]);
  Rx<Stroke> line = Rx<Stroke>(Stroke([]));
  Rx<StrokeOptions> options = Rx<StrokeOptions>(StrokeOptions());
  Rx<StreamController<Stroke>> currentLineStreamController = Rx<StreamController<Stroke>>(StreamController<Stroke>.broadcast());
  Rx<StreamController<List<Stroke>>> linesStreamController = Rx<StreamController<List<Stroke>>>(StreamController<List<Stroke>>.broadcast());

  @override
  void onInit() {
    super.onInit();
  }

  void clear() {
    lines.value = [];
    line.value = Stroke([]);
    linesStreamController.refresh();
    currentLineStreamController.refresh();
    print('clear called');
  }

  Future<void> updateSizeOption(double size) async {
      options.value.size = size;
  }

  void onPointerDown(PointerDownEvent details) {
    options.value = StrokeOptions(
      simulatePressure: details.kind != PointerDeviceKind.stylus,
    );

    final box = context.value.findRenderObject() as RenderBox;
    final offset = box.globalToLocal(details.position);
    late final Point point;
    if (details.kind == PointerDeviceKind.stylus) {
      point = Point(
        offset.dx,
        offset.dy,
        (details.pressure - details.pressureMin) / (details.pressureMax - details.pressureMin),
      );
    } else {
      point = Point(offset.dx, offset.dy);
    }
    final points = [point];
    line.value = Stroke(points);
    currentLineStreamController.value.add(line.value);
    print('onPointerDown called');
  }

  void onPointerMove(PointerMoveEvent details) {
    final box = context.value.findRenderObject() as RenderBox;
    final offset = box.globalToLocal(details.position);
    late final Point point;
    if (details.kind == PointerDeviceKind.stylus) {
      point = Point(
        offset.dx,
        offset.dy,
        (details.pressure - details.pressureMin) / (details.pressureMax - details.pressureMin),
      );
    } else {
      point = Point(offset.dx, offset.dy);
    }
    final points = [...line.value.points, point];
    line.value = Stroke(points);
    currentLineStreamController.value.add(line.value);
    print('onPointerMove called');
  }

  void onPointerUp(PointerUpEvent details) {
    lines.value = List.from(lines.value)..add(line.value);
    linesStreamController.value.add(lines.value);
    print('onPointerUp called');
  }
}