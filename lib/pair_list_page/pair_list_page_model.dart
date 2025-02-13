import '/components/pair_list_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'pair_list_page_widget.dart' show PairListPageWidget;
import 'package:flutter/material.dart';

class PairListPageModel extends FlutterFlowModel<PairListPageWidget> {
  ///  State fields for stateful widgets in this page.

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
