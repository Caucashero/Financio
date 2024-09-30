import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_web_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'gizlilik_politikasi_model.dart';
export 'gizlilik_politikasi_model.dart';

class GizlilikPolitikasiWidget extends StatefulWidget {
  /// GizlilikPolitikasi
  const GizlilikPolitikasiWidget({
    super.key,
    String? slug,
  }) : slug = slug ?? 'eurusd';

  final String slug;

  @override
  State<GizlilikPolitikasiWidget> createState() =>
      _GizlilikPolitikasiWidgetState();
}

class _GizlilikPolitikasiWidgetState extends State<GizlilikPolitikasiWidget> {
  late GizlilikPolitikasiModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => GizlilikPolitikasiModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<PairListsRecord>>(
      stream: queryPairListsRecord(
        queryBuilder: (pairListsRecord) => pairListsRecord.where(
          'slug',
          isEqualTo: widget.slug,
        ),
        singleRecord: true,
      ),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Scaffold(
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            body: Center(
              child: SizedBox(
                width: 50.0,
                height: 50.0,
                child: SpinKitCubeGrid(
                  color: FlutterFlowTheme.of(context).primary,
                  size: 50.0,
                ),
              ),
            ),
          );
        }
        List<PairListsRecord> gizlilikPolitikasiPairListsRecordList =
            snapshot.data!;
        // Return an empty Container when the item does not exist.
        if (snapshot.data!.isEmpty) {
          return Container();
        }
        final gizlilikPolitikasiPairListsRecord =
            gizlilikPolitikasiPairListsRecordList.isNotEmpty
                ? gizlilikPolitikasiPairListsRecordList.first
                : null;

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
                flexibleSpace: FlexibleSpaceBar(
                  title: Align(
                    alignment: const AlignmentDirectional(0.0, 0.0),
                    child: Text(
                      FFLocalizations.of(context).getText(
                        'dnf5je5n' /* Gizlilik Politikası */,
                      ),
                      style:
                          FlutterFlowTheme.of(context).headlineMedium.override(
                                fontFamily: 'Inter Tight',
                                color: FlutterFlowTheme.of(context).primaryText,
                                fontSize: 22.0,
                                letterSpacing: 0.0,
                              ),
                    ),
                  ),
                  centerTitle: true,
                  expandedTitleScale: 1.0,
                ),
                toolbarHeight: 40.0,
                elevation: 0.0,
              ),
            ),
            body: SafeArea(
              top: true,
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  FlutterFlowWebView(
                    content:
                        'https://financio.com.tr/mobile/privacy-policy.php',
                    bypass: false,
                    width: MediaQuery.sizeOf(context).width * 1.0,
                    height: MediaQuery.sizeOf(context).height * 1.0,
                    verticalScroll: true,
                    horizontalScroll: false,
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
