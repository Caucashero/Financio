import '/components/pair_list_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dashboard_page_widget.dart' show DashboardPageWidget;
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class DashboardPageModel extends FlutterFlowModel<DashboardPageWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for Carousel widget.
  CarouselController? carouselController;
  int carouselCurrentIndex = 1;

  // Models for PairList dynamic component.
  late FlutterFlowDynamicModels<PairListModel> pairListModels;

  @override
  void initState(BuildContext context) {
    pairListModels = FlutterFlowDynamicModels(() => PairListModel());
  }

  @override
  void dispose() {
    pairListModels.dispose();
  }
}
