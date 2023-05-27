import 'package:flutter/material.dart';

/// Public Method //////////////////////////////////////////////////////////////

getToggleButtons(List<String> toggleList, void Function(int) onToggleChangeCallback) {
  return TwoToggleButtons(toggleList: toggleList, onToggleChangeCallback: onToggleChangeCallback);
}

/// Widget /////////////////////////////////////////////////////////////////////
// Reference: https://api.flutter.dev/flutter/material/ToggleButtons-class.html

class TwoToggleButtons extends StatefulWidget {
  final List<String> toggleList;
  void Function(int) onToggleChangeCallback;

  TwoToggleButtons({required this.toggleList, required this.onToggleChangeCallback, Key? key}) : super(key: key);

  @override
  State<TwoToggleButtons> createState() => _TwoToggleButtonsState();
}

class _TwoToggleButtonsState extends State<TwoToggleButtons> {

  late int toggleListLength;
  late List<String> toggleList;
  late List<bool> selectedToggleBoolList = <bool>[true];
  late List<Widget> toggleListWidget=[];

  @override
  void initState() {
    super.initState();
    toggleListLength = widget.toggleList.length;
    toggleList = widget.toggleList;
    for(int i=0; i<toggleListLength; i++) {
      toggleListWidget.add(Text(toggleList[i]));
      if(i!=0) {
        selectedToggleBoolList.add(false);
      }
    }
  }


  @override
  Widget build(BuildContext context) {
    return ToggleButtons(
      direction: Axis.horizontal,
      onPressed: (int index) {
        widget.onToggleChangeCallback(index);
        setState(() {
          // The button that is tapped is set to true, and the others to false.
          for (int i = 0; i < toggleListLength ; i++) {
            selectedToggleBoolList[i] = i == index;
          }
        });},
      borderRadius: const BorderRadius.all(Radius.circular(8)),
      selectedBorderColor: Colors.red[700],
      selectedColor: Colors.white,
      fillColor: Colors.red[200],
      color: Colors.red[400],
      constraints: const BoxConstraints(
        minHeight: 40.0,
        minWidth: 80.0,
      ),
      isSelected: selectedToggleBoolList,
      children: toggleListWidget,
    );
  }
}
