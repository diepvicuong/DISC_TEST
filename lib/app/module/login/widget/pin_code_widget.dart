import 'package:disc_test/app/res/colors.dart';
import 'package:disc_test/app/module/login/widget/pin_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class PinCodeWidget extends StatefulWidget {
  final BuildContext context;
  final int length;
  final PinTheme pinTheme;
  final double spacing;
  final Function(String text)? onFinish;
  final double? width;

  const PinCodeWidget({
    Key? key,
    required this.context,
    required this.length,
    this.pinTheme = const PinTheme.defaults(),
    this.spacing = 10,
    this.onFinish,
    this.width,
  }) : super(key: key);

  @override
  _PinCodeWidgetState createState() => _PinCodeWidgetState();
}

class _PinCodeWidgetState extends State<PinCodeWidget> {
  TextEditingController? _textEditingController;
  late List<String> _inputList;
  late FocusNode? _focusNode;
  int _selectedIndex = 0;
  PinTheme get _pinTheme => widget.pinTheme;

  @override
  void initState() {
    super.initState();

    _inputList = List<String>.filled(widget.length, "");

    // If a default value is set in the TextEditingController, then set to UI
    _textEditingController = TextEditingController();
    _textEditingController!.addListener(() {
      print('Current text: ${_textEditingController!.text}');
      var currentText = _textEditingController!.text;

      if (_inputList.join("") != currentText) {
        if (currentText.length >= widget.length) {
          _focusNode!.unfocus();
          _textEditingController?.clear();
          widget.onFinish!(currentText);
        }
      }

      _setTextToInput(currentText);
    });
    _focusNode = FocusNode();
    _focusNode!.addListener(() {
      print('FocusNode changed: ${_focusNode!.hasFocus}');
      setState(() {});
    }); //

    if (_textEditingController!.text.isNotEmpty) {}
    // _setTextToInput(_textEditingController!.text);
  }

  @override
  void dispose() {
    _textEditingController?.dispose();
    _focusNode?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var textField = TextFormField(
      textInputAction: TextInputAction.done,
      controller: _textEditingController,
      focusNode: _focusNode,
      enabled: true,
      // autofillHints: widget.enablePinAutofill && widget.enabled
      //     ? <String>[AutofillHints.oneTimeCode]
      //     : null,
      autofocus: true,
      autocorrect: false,
      keyboardType: TextInputType.number,
      // keyboardAppearance: widget.keyboardAppearance,
      // textCapitalization: widget.textCapitalization,
      // validator: widget.validator,
      // onSaved: widget.onSaved,
      // autovalidateMode: widget.autovalidateMode,
      inputFormatters: [
        ...<TextInputFormatter>[],
        LengthLimitingTextInputFormatter(
          widget.length,
        ), // this limits the input length
      ],
      // trigger on the complete event handler from the keyboard
      // onFieldSubmitted: widget.onSubmitted,
      enableInteractiveSelection: false,
      showCursor: false,
      // using same as background color so tha it can blend into the view
      cursorWidth: 0.01,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.all(0),
        border: InputBorder.none,
        // fillColor: Colors.amber,
        enabledBorder: InputBorder.none,
        focusedBorder: InputBorder.none,
        disabledBorder: InputBorder.none,
      ),
      style: TextStyle(
        color: Colors.transparent,
        height: .01,
      ),
    );

    return Container(
      height: widget.pinTheme.fieldHeight,
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          AbsorbPointer(
            absorbing: true,
            child: AutofillGroup(child: textField),
          ),
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: GestureDetector(
              onTap: () {
                print('OnTap OTP Row');
                // if (widget.onTap != null) widget.onTap!();
                _onFocus();
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: _generateFields(),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _onFocus() {
    print('${widget.context.widget}');
    print('bottom: ${MediaQuery.of(widget.context).viewInsets.bottom}');
    print('-----------------');

    if (_focusNode!.hasFocus &&
        MediaQuery.of(widget.context).viewInsets.bottom == 0) {
      _focusNode!.unfocus();
      Future.delayed(
          const Duration(microseconds: 1), () => _focusNode!.requestFocus());
    } else {
      _focusNode!.requestFocus();
    }
  }

  List<Widget> _generateFields() {
    var result = <Widget>[];
    for (int i = 0; i < widget.length; i++) {
      result.add(
        Container(
          margin: EdgeInsets.symmetric(horizontal: widget.spacing),
          child: AnimatedContainer(
            curve: Curves.easeInOut,
            duration: const Duration(milliseconds: 150),
            width: widget.width != null
                ? widget.width! / widget.length
                : widget.pinTheme.fieldWidth,
            height: widget.pinTheme.fieldHeight,
            decoration: BoxDecoration(
                border: Border(
                    bottom: BorderSide(
                        width: widget.pinTheme.borderWidth,
                        color: _getColorFromIndex(i)))),
            child: Center(
              child: AnimatedSwitcher(
                switchInCurve: Curves.easeInOut,
                switchOutCurve: Curves.easeInOut,
                duration: const Duration(milliseconds: 150),
                transitionBuilder: (child, animation) {
                  return SlideTransition(
                    position: Tween<Offset>(
                      begin: const Offset(0, .5),
                      end: Offset.zero,
                    ).animate(animation),
                    child: child,
                  );
                },
                child: buildChild(i),
              ),
            ),
          ),
        ),
      );
    }
    return result;
  }

  void _setTextToInput(String data) async {
    var replaceInputList = List<String>.filled(widget.length, "");

    for (int i = 0; i < widget.length; i++) {
      replaceInputList[i] = data.length > i ? data[i] : "";
    }

    if (mounted)
      setState(() {
        _selectedIndex = data.length;
        _inputList = replaceInputList;
      });
  }

  /// Builds the widget to be shown
  Widget buildChild(int index) {
    return _renderPinField(
      index: index,
    );
  }

  Widget _renderPinField({
    required int index,
  }) {
    assert(index != null);

    return Text(
      _inputList[index],
      key: ValueKey(_inputList[index]),
      style: TextStyle(
          fontSize: 30, fontWeight: FontWeight.bold, color: Colors.white),
    );
  }

  // selects the right color for the field
  Color _getColorFromIndex(int index) {
    if (_selectedIndex > index) {
      return _pinTheme.activeColor;
    }
    return _pinTheme.inactiveColor;
  }
}
