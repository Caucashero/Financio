import '/backend/backend.dart';
import '/components/pair_categories_list_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'pair_cateogires_widget.dart' show PairCateogiresWidget;
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class PairCateogiresModel extends FlutterFlowModel<PairCateogiresWidget> {
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
