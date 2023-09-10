import 'package:flutter/material.dart';

import '../../../HomeModule/UI/homePage_screen.dart';
import '../../../Shared/color_manager.dart';
import '../../../Shared/constants_manager.dart';
import '../../../Shared/widgets/scrollableDays.dart';

/// Public Method //////////////////////////////////////////////////////////////
getUpperHistoryBody() {
  return UpperHistoryBody();
}

/// Widget /////////////////////////////////////////////////////////////////////
class UpperHistoryBody extends StatefulWidget {
  const UpperHistoryBody({Key? key}) : super(key: key);

  @override
  State<UpperHistoryBody> createState() => _UpperHistoryBodyState();
}

class _UpperHistoryBodyState extends State<UpperHistoryBody> {
  ValueNotifier<int> showScrollableNotifier = ValueNotifier<int>(0);
  List<String> buttonTexts = ["Weekly", "Monthly", "Yearly"];

  @override
  Widget build(BuildContext context) {
    return Container(
      color: ColorManager.PRIMARY_BLUE,
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.30,
      child: Column(
        children: [
          Padding(padding: EdgeInsets.fromLTRB(0, height(0.06, context), 0, 0)),
          Row(
            children: [
              Text(
                ConstantsManager.HISTORY,
                style: TextStyle(
                    color: Colors.white, fontSize: height(0.04, context)),
              ),
              TextButton(
                  style: ButtonStyle(
                    foregroundColor:
                        MaterialStateProperty.all<Color>(Colors.blue),
                  ),
                  onPressed: () {
                    showScrollableNotifier.value =
                        (showScrollableNotifier.value + 1) % 3;
                    print(showScrollableNotifier);
                  },
                  child: ValueListenableBuilder(
                      valueListenable: showScrollableNotifier,
                      builder: (context, value, widget) {
                        return Text(buttonTexts[showScrollableNotifier.value]);
                      }))
            ],
          ),
          ValueListenableBuilder(
              valueListenable: showScrollableNotifier,
              builder: (context, value, widget) {
                return getHistoryDateScrollableFormat(
                    showScrollableNotifier.value as int);
              })
          // getHistoryDateScrollableFormat(showScrollable),
        ],
      ),
    );
  }
}
