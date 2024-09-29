import '/components/pair_categories_list_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'pair_cateogires_page_widget.dart' show PairCateogiresPageWidget;
import 'package:flutter/material.dart';

class PairCateogiresPageModel
    extends FlutterFlowModel<PairCateogiresPageWidget> {
  ///  State fields for stateful widgets in this page.

  // Models for PairCategoriesList dynamic component.
  late FlutterFlowDynamicModels<PairCategoriesListModel>
      pairCategoriesListModels;

  @override
  void initState(BuildContext context) {
    pairCategoriesListModels =
        FlutterFlowDynamicModels(() => PairCategoriesListModel());
  }

  @override
  void dispose() {
    pairCategoriesListModels.dispose();
  }
}
