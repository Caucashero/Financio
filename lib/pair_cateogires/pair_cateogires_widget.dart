import '/backend/backend.dart';
import '/components/pair_categories_list_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'pair_cateogires_model.dart';
export 'pair_cateogires_model.dart';

class PairCateogiresWidget extends StatefulWidget {
  const PairCateogiresWidget({super.key});

  @override
  State<PairCateogiresWidget> createState() => _PairCateogiresWidgetState();
}

class _PairCateogiresWidgetState extends State<PairCateogiresWidget> {
  late PairCateogiresModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PairCateogiresModel());
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: SafeArea(
          top: true,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              StreamBuilder<List<PairCategoriesRecord>>(
                stream: queryPairCategoriesRecord(
                  queryBuilder: (pairCategoriesRecord) =>
                      pairCategoriesRecord.orderBy('id'),
                ),
                builder: (context, snapshot) {
                  // Customize what your widget looks like when it's loading.
                  if (!snapshot.hasData) {
                    return Center(
                      child: SizedBox(
                        width: 50.0,
                        height: 50.0,
                        child: SpinKitCubeGrid(
                          color: FlutterFlowTheme.of(context).primary,
                          size: 50.0,
                        ),
                      ),
                    );
                  }
                  List<PairCategoriesRecord> listViewPairCategoriesRecordList =
                      snapshot.data!;

                  return ListView.builder(
                    padding: EdgeInsets.zero,
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    itemCount: listViewPairCategoriesRecordList.length,
                    itemBuilder: (context, listViewIndex) {
                      final listViewPairCategoriesRecord =
                          listViewPairCategoriesRecordList[listViewIndex];
                      return InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {
                          context.pushNamed(
                            'PairListPage',
                            queryParameters: {
                              'pair': serializeParam(
                                listViewPairCategoriesRecord.id,
                                ParamType.int,
                              ),
                              'name': serializeParam(
                                listViewPairCategoriesRecord.name,
                                ParamType.String,
                              ),
                            }.withoutNulls,
                          );
                        },
                        child: wrapWithModel(
                          model: _model.pairCategoriesListModels.getModel(
                            listViewPairCategoriesRecord.id.toString(),
                            listViewIndex,
                          ),
                          updateCallback: () => safeSetState(() {}),
                          child: PairCategoriesListWidget(
                            key: Key(
                              'Keya2f_${listViewPairCategoriesRecord.id.toString()}',
                            ),
                            banner: listViewPairCategoriesRecord.banner,
                            name: listViewPairCategoriesRecord.name,
                            description:
                                listViewPairCategoriesRecord.description,
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
