import 'package:cotwcastmate/generated/assets.gen.dart';
import 'package:cotwcastmate/interface/interface.dart';
import 'package:cotwcastmate/widgets/app/bar_app.dart';
import 'package:cotwcastmate/widgets/app/bar_scroll.dart';
import 'package:cotwcastmate/widgets/app/bar_search.dart';
import 'package:flutter/material.dart';

class WidgetScaffold extends StatelessWidget {
  final WidgetAppBar? _appBar;
  final String? _background;
  final List<Widget> _items;
  final TextEditingController? _searchController;

  const WidgetScaffold({
    super.key,
    WidgetAppBar? appBar,
    String? background,
    required List<Widget> children,
    TextEditingController? searchController,
  })  : _appBar = appBar,
        _background = background,
        _items = children,
        _searchController = searchController;

  Widget _buildAppBar() {
    return _appBar ?? const SizedBox.shrink();
  }

  Widget _buildSearchBar() {
    return WidgetSearchBar(
      controller: _searchController ?? TextEditingController(),
    );
  }

  Widget _buildBackground() {
    return Image.asset(
      _background ?? Assets.graphics.images.blue.path,
      fit: BoxFit.cover,
      alignment: Alignment.center,
    );
  }

  Widget _buildShadow() {
    return Container(color: Interface.primaryDark.withOpacity(0.4));
  }

  Widget _buildBody(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        _buildBackground(),
        _buildShadow(),
        Column(
          children: [
            Expanded(
              child: WidgetScrollBar(
                child: ListView.builder(
                  itemCount: 2 + _items.length,
                  itemBuilder: (context, int i) {
                    if (i == 0) return _buildAppBar();
                    if (i == 1) {
                      if (_searchController != null) return _buildSearchBar();
                      return const SizedBox.shrink();
                    }
                    return _items.elementAt(i - 2);
                  },
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildWidgets(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      extendBody: true,
      backgroundColor: Interface.transparent,
      body: _buildBody(context),
    );
  }

  @override
  Widget build(BuildContext context) => _buildWidgets(context);
}
