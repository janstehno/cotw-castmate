import 'dart:math';

import 'package:cotwcastmate/generated/assets.gen.dart';
import 'package:cotwcastmate/interface/interface.dart';
import 'package:cotwcastmate/widgets/app/error.dart';
import 'package:cotwcastmate/widgets/indicator/loading_indicator.dart';
import 'package:flutter/material.dart';

abstract class BuilderBuilder extends StatefulWidget {
  final String _builderId;

  const BuilderBuilder(
    String builderId, {
    super.key,
  }) : _builderId = builderId;

  String get builderId => _builderId;
}

abstract class BuilderBuilderState extends State<BuilderBuilder> {
  final Map<String, dynamic> loadedData = {};

  void updateProgress(String key, dynamic data) {
    loadedData.putIfAbsent(key, () => data);
  }

  void initializeData(AsyncSnapshot<Map<String, dynamic>> snapshot, BuildContext context);

  loadData();

  buildFutureWidget(BuildContext context);

  Widget _buildLoadingBackground() {
    ImageProvider background = AssetImage(Assets.graphics.images.cotw.path);
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: background,
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget _buildShadow() {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          transform: const GradientRotation(pi / 2),
          colors: [
            Interface.dark0D.withValues(alpha: 0.1),
            Interface.dark0D.withValues(alpha: 0.4),
            Interface.dark0D.withValues(alpha: 0.6),
          ],
        ),
      ),
    );
  }

  Widget _buildLoadingWidget() {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Expanded(
            child: Stack(
              children: [
                _buildLoadingBackground(),
                _buildShadow(),
                const Positioned(
                  right: 0,
                  bottom: 0,
                  child: WidgetLoadingIndicator(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildWidget(AsyncSnapshot<Map<String, dynamic>> snapshot, BuildContext context) {
    if (snapshot.hasError) {
      return WidgetError(
        code: "Ex${widget.builderId}001",
        error: "${snapshot.error}",
        stack: "${snapshot.stackTrace}",
      );
    } else if (!snapshot.hasData) {
      return WidgetError(
        code: "Ex${widget.builderId}002",
        error: "${snapshot.error}",
        stack: "${snapshot.stackTrace}",
      );
    } else if (snapshot.data!.length != loadedData.length) {
      return WidgetError(
        code: "Ex${widget.builderId}003",
        error: "${snapshot.error}",
        stack: "${snapshot.stackTrace}",
      );
    } else {
      initializeData(snapshot, context);
      return buildFutureWidget(context);
    }
  }

  Widget _buildWidgets(BuildContext context) {
    return FutureBuilder(
      future: loadData(),
      builder: (context, AsyncSnapshot<Map<String, dynamic>> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return _buildLoadingWidget();
        } else if (snapshot.connectionState != ConnectionState.done) {
          return const SizedBox.shrink();
        } else {
          return _buildWidget(snapshot, context);
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) => _buildWidgets(context);
}
