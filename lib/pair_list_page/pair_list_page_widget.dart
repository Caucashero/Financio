import '/backend/backend.dart';
import '/components/pair_list_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'pair_list_page_model.dart';
export 'pair_list_page_model.dart';

class PairListPageWidget extends StatefulWidget {
  const PairListPageWidget({
    super.key,
    int? pair,
    String? name,
  })  : pair = pair ?? 1,
        name = name ?? 'name';

  final int pair;
  final String name;

  @override
  State<PairListPageWidget> createState() => _PairListPageWidgetState();
}

class _PairListPageWidgetState extends State<PairListPageWidget> {
  late PairListPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PairListPageModel());

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
          child: StreamBuilder<List<PairListsRecord>>(
            stream: queryPairListsRecord(
              queryBuilder: (pairListsRecord) => pairListsRecord
                  .where(
                    'category_id',
                    isEqualTo: widget.pair,
                  )
                  .orderBy('sort_order'),
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
              List<PairListsRecord> listViewPairListsRecordList =
                  snapshot.data!;

              return ListView.builder(
                padding: EdgeInsets.zero,
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                itemCount: listViewPairListsRecordList.length,
                itemBuilder: (context, listViewIndex) {
                  final listViewPairListsRecord =
                      listViewPairListsRecordList[listViewIndex];
                  return wrapWithModel(
                    model: _model.pairListModels.getModel(
                      listViewPairListsRecord.id.toString(),
                      listViewIndex,
                    ),
                    updateCallback: () => safeSetState(() {}),
                    child: PairListWidget(
                      key: Key(
                        'Keym0n_${listViewPairListsRecord.id.toString()}',
                      ),
                      title: listViewPairListsRecord.name,
                      desc: listViewPairListsRecord.description,
                      banner: listViewPairListsRecord.banner,
                      bid: listViewPairListsRecord.bid,
                      daily: listViewPairListsRecord.ask,
                      id: listViewPairListsRecord.id,
                      ask: listViewPairListsRecord.ask,
                      direction: listViewPairListsRecord.daily,
                      slug: listViewPairListsRecord.slug,
                    ),
                  );
                },
              );
            },
          ),
        ),
      ),
    );
  }
}
