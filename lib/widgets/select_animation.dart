import 'package:flare_dart/math/mat2d.dart';
import 'package:flare_flutter/flare.dart';
import 'package:flare_flutter/flare_controller.dart';
import 'package:flutter/material.dart';
import 'package:flare_flutter/flare_actor.dart';

class SelectAnimation extends StatelessWidget {
  SelectAnimation({
    Key key,
    @required this.width,
    Widget child,
    bool isSelected,
    this.color,
    this.borderColor,
    this.selectedColor,
    this.selectedBorderColor,
    this.bottomDescription,
    SelectMode selectMode,
  })  : isSelected = isSelected ?? false,
        selectMode = selectMode ?? SelectMode.animatedCircle,
        child = child ?? Container(),
        _controller =
            MyFlareController(borderColor, selectedColor, selectedBorderColor),
        super(key: key);

  final double width;

  final Widget child;

  final bool isSelected;

  final Color color;

  final Color borderColor;

  final Color selectedColor;

  final Color selectedBorderColor;

  final Widget bottomDescription;

  final SelectMode selectMode;

  final FlareController _controller;

  static const checkAsset = "packages/malta/flare/check.flr";
  static const spinningAsset = "packages/malta/flare/spinning.flr";
  static const spinningAnimation = "Spinning Circle";
  static const idleAnimation = "idle";
  static const checkAnimation = "Check";

  @override
  Widget build(BuildContext context) {
    final c = isSelected && selectMode != SelectMode.check
        ? selectedColor ?? Theme.of(context).backgroundColor
        : color ?? Theme.of(context).scaffoldBackgroundColor;
    final bc = isSelected && selectMode != SelectMode.check
        ? selectedBorderColor ?? Theme.of(context).buttonColor
        : borderColor ?? Theme.of(context).textTheme.body1.color;
    final borderWidth =
        selectMode == SelectMode.simple && isSelected ? 3.0 : 1.5;

    return Column(
      children: [
        Stack(
          children: [
            if (selectMode == SelectMode.animatedCircle && isSelected)
              _buildSpinningCircle(spinningAnimation),
            if (selectMode != SelectMode.animatedCircle || !isSelected)
              _buildCircle(c, bc, borderWidth),
            Container(
              height: width,
              width: width,
              child: Center(child: child),
            ),
            if (selectMode == SelectMode.check && isSelected)
              Container(
                height: width,
                width: width,
                child: Align(
                  alignment: Alignment(0.80, 0.80),
                  child: _buildCheckAnimation(checkAnimation),
                ),
              ),
            _buildCheckAnimation(idleAnimation),
          ],
        ),
        if (bottomDescription != null) bottomDescription,
      ],
    );
  }

  Container _buildCircle(Color color, Color borderColor, double borderWidth) {
    return Container(
      padding: EdgeInsets.all(8.0),
      width: width,
      height: width,
      child: Center(
        child: Container(
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: color,
              border: Border.all(color: borderColor, width: borderWidth)),
        ),
      ),
    );
  }

  Widget _buildSpinningCircle(String animation) {
    final edgeinsets = (animation == 'idle') ? 10.0 : 4.0;
    return Container(
      padding: EdgeInsets.all(edgeinsets),
      width: width,
      height: width,
      child: Center(
        child: FlareActor(
          spinningAsset,
          // shouldClip: false,
          alignment: Alignment.center,
          fit: BoxFit.fitHeight,
          controller: _controller,
          animation: animation,
        ),
      ),
    );
  }

  Widget _buildCheckAnimation(
    String animation,
  ) {
    final width = (animation == 'idle') ? 0.0 : 30.0;
    return Container(
      width: width,
      height: width,
      child: Center(
        child: FlareActor(
          checkAsset,
          alignment: Alignment.center,
          fit: BoxFit.fitHeight,
          controller: _controller,
          animation: animation,
        ),
      ),
    );
  }
}

enum SelectMode { simple, animatedCircle, check }

class MyFlareController with FlareController {
  MyFlareController(
      this.borderColor, this.selectedColor, this.selectedBorderColor);

  final Color borderColor;
  final Color selectedColor;
  final Color selectedBorderColor;
  FlutterColorFill _fillSelected;
  FlutterColorStroke _strokeSelectedBorder;
  FlutterColorStroke _strokeBorder;

  static const checkShape = "Check";
  static const spinnerShape = "Loading Spinner";
  static const ellipseShape = "Green Ellipse";
  static const whiteCircleShape = "White Circle";
  static const clippingCircleShape = "Clipping Circle";

  void initialize(FlutterActorArtboard artboard) {
    // artboard.
    if (selectedColor != null) {
      FlutterActorShape shape = artboard.getNode(ellipseShape);
      _fillSelected = shape?.fill as FlutterColorFill;
      if (_fillSelected == null) {
        shape = artboard.getNode(clippingCircleShape);
        _fillSelected = shape?.fill as FlutterColorFill;
      }
    }
    if (selectedBorderColor != null) {
      FlutterActorShape shape = artboard.getNode(checkShape);
      _strokeSelectedBorder = shape?.stroke as FlutterColorStroke;
      if (_strokeSelectedBorder == null) {
        shape = artboard.getNode(spinnerShape);
        _strokeSelectedBorder = shape?.stroke as FlutterColorStroke;
      }
    }
    if (borderColor != null) {
      FlutterActorShape shape = artboard.getNode(whiteCircleShape);
      _strokeBorder = shape?.stroke as FlutterColorStroke;
    }
  }

  bool advance(FlutterActorArtboard artboard, double elapsed) {
    if (_fillSelected != null) {
      _fillSelected.uiColor = selectedColor;
    }
    if (_strokeSelectedBorder != null) {
      _strokeSelectedBorder.uiColor = selectedBorderColor;
    }
    if (_strokeBorder != null) {
      _strokeBorder.uiColor = borderColor;
    }

    return false;
  }

  @override
  void setViewTransform(Mat2D viewTransform) {}
}
