import 'package:disc_test/app/res/colors.dart';
import 'package:flutter/material.dart';

class PinTheme {
  /// Colors of the input fields which have inputs. Default is [Colors.green]
  final Color activeColor;

  /// Color of the input field which is currently selected. Default is [Colors.blue]
  final Color selectedColor;

  /// Colors of the input fields which don't have inputs. Default is [Colors.red]
  final Color inactiveColor;

  /// Colors of the input fields if the [PinCodeTextField] is disabled. Default is [Colors.grey]
  final Color disabledColor;

  /// Colors of the input fields which have inputs. Default is [Colors.green]
  final Color activeFillColor;

  /// Color of the input field which is currently selected. Default is [Colors.blue]
  final Color selectedFillColor;

  /// Colors of the input fields which don't have inputs. Default is [Colors.red]
  final Color inactiveFillColor;

  /// Border radius of each pin code field
  final BorderRadius borderRadius;

  /// [height] for the pin code field. default is [50.0]
  final double fieldHeight;

  /// [width] for the pin code field. default is [40.0]
  final double fieldWidth;

  /// Border width for the each input fields. Default is [2.0]
  final double borderWidth;

  /// this defines the padding of each enclosing container of an input field. Default is [0.0]
  final EdgeInsetsGeometry fieldOuterPadding;

  const PinTheme.defaults({
    this.borderRadius = BorderRadius.zero,
    this.fieldHeight = 50,
    this.fieldWidth = 40,
    this.borderWidth = 4,
    this.fieldOuterPadding = EdgeInsets.zero,
    this.activeColor = AppColor.kprimaryColor,
    this.selectedColor = Colors.blue,
    this.inactiveColor = Colors.white,
    this.disabledColor = Colors.grey,
    this.activeFillColor = Colors.green,
    this.selectedFillColor = Colors.blue,
    this.inactiveFillColor = Colors.red,
  });

  factory PinTheme(
      {Color? activeColor,
      Color? selectedColor,
      Color? inactiveColor,
      Color? disabledColor,
      Color? activeFillColor,
      Color? selectedFillColor,
      Color? inactiveFillColor,
      BorderRadius? borderRadius,
      double? fieldHeight,
      double? fieldWidth,
      double? borderWidth,
      EdgeInsetsGeometry? fieldOuterPadding}) {
    final defaultValues = PinTheme.defaults();
    return PinTheme.defaults(
      activeColor:
          activeColor == null ? defaultValues.activeColor : activeColor,
      activeFillColor: activeFillColor == null
          ? defaultValues.activeFillColor
          : activeFillColor,
      borderRadius:
          borderRadius == null ? defaultValues.borderRadius : borderRadius,
      borderWidth:
          borderWidth == null ? defaultValues.borderWidth : borderWidth,
      disabledColor:
          disabledColor == null ? defaultValues.disabledColor : disabledColor,
      fieldHeight:
          fieldHeight == null ? defaultValues.fieldHeight : fieldHeight,
      fieldWidth: fieldWidth == null ? defaultValues.fieldWidth : fieldWidth,
      inactiveColor:
          inactiveColor == null ? defaultValues.inactiveColor : inactiveColor,
      inactiveFillColor: inactiveFillColor == null
          ? defaultValues.inactiveFillColor
          : inactiveFillColor,
      selectedColor:
          selectedColor == null ? defaultValues.selectedColor : selectedColor,
      selectedFillColor: selectedFillColor == null
          ? defaultValues.selectedFillColor
          : selectedFillColor,
      fieldOuterPadding: fieldOuterPadding == null
          ? defaultValues.fieldOuterPadding
          : fieldOuterPadding,
    );
  }
}
