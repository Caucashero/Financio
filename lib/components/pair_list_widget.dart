import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'pair_list_model.dart';
export 'pair_list_model.dart';

class PairListWidget extends StatefulWidget {
  /// KhgVbPBTxSmWDu3N
  const PairListWidget({
    super.key,
    String? title,
    String? desc,
    this.banner,
    String? bid,
    String? daily,
    required this.id,
  })  : this.title = title ?? 'title',
        this.desc = desc ?? 'desc',
        this.bid = bid ?? 'bid',
        this.daily = daily ?? 'daily';

  final String title;
  final String desc;
  final String? banner;
  final String bid;
  final String daily;
  final int? id;

  @override
  State<PairListWidget> createState() => _PairListWidgetState();
}

class _PairListWidgetState extends State<PairListWidget>
    with TickerProviderStateMixin {
  late PairListModel _model;

  final animationsMap = <String, AnimationInfo>{};

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PairListModel());

    animationsMap.addAll({
      'containerOnPageLoadAnimation': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: Offset(0.0, 30.0),
            end: Offset(0.0, 0.0),
          ),
        ],
      ),
    });
    setupAnimations(
      animationsMap.values.where((anim) =>
          anim.trigger == AnimationTrigger.onActionTrigger ||
          !anim.applyInitialState),
      this,
    );
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 1.0),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).secondaryBackground,
          boxShadow: [
            BoxShadow(
              color: FlutterFlowTheme.of(context).primaryBackground,
              offset: Offset(
                0.0,
                1.0,
              ),
            )
          ],
          borderRadius: BorderRadius.circular(0.0),
          border: Border.all(
            color: FlutterFlowTheme.of(context).secondaryBackground,
            width: 0.0,
          ),
        ),
        child: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(12.0, 8.0, 12.0, 8.0),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(12.0),
                child: Image.network(
                  widget!.banner!,
                  width: 90.0,
                  height: 90.0,
                  fit: BoxFit.cover,
                ),
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.all(12.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget!.title,
                        style:
                            FlutterFlowTheme.of(context).headlineSmall.override(
                                  fontFamily: 'Inter Tight',
                                  letterSpacing: 0.0,
                                ),
                      ),
                      Align(
                        alignment: AlignmentDirectional(1.0, 0.0),
                        child: Text(
                          widget!.bid,
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Inter',
                                    letterSpacing: 0.0,
                                  ),
                        ),
                      ),
                      Text(
                        widget!.daily,
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Inter',
                              letterSpacing: 0.0,
                            ),
                      ),
                    ],
                  ),
                ),
              ),
              Icon(
                Icons.keyboard_arrow_right_rounded,
                color: FlutterFlowTheme.of(context).secondaryText,
                size: 24.0,
              ),
            ],
          ),
        ),
      ).animateOnPageLoad(animationsMap['containerOnPageLoadAnimation']!),
    );
  }
}
