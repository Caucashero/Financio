import '/backend/backend.dart';
import '/components/pair_categories_list_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'pair_cateogires_page_model.dart';
export 'pair_cateogires_page_model.dart';

class PairCateogiresPageWidget extends StatefulWidget {
  const PairCateogiresPageWidget({super.key});

  @override
  State<PairCateogiresPageWidget> createState() =>
      _PairCateogiresPageWidgetState();
}

class _PairCateogiresPageWidgetState extends State<PairCateogiresPageWidget> {
  late PairCateogiresPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PairCateogiresPageModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
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
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(40.0),
          child: AppBar(
            backgroundColor: FlutterFlowTheme.of(context).primary,
            automaticallyImplyLeading: false,
            leading: Align(
              alignment: const AlignmentDirectional(0.0, -1.0),
              child: FlutterFlowIconButton(
                borderColor: Colors.transparent,
                borderRadius: 30.0,
                borderWidth: 1.0,
                buttonSize: 30.0,
                icon: Icon(
                  Icons.arrow_back_rounded,
                  color: FlutterFlowTheme.of(context).primaryText,
                  size: 20.0,
                ),
                onPressed: () async {
                  context.pop();
                },
              ),
            ),
            actions: const [],
            toolbarHeight: 40.0,
            elevation: 0.0,
          ),
        ),
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
                    primary: false,
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
