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
  void initState() {
    super.initState();

    // Now you can use selectedYearNotifier, selectedMonthNotifier, and selectedDateNotifier as needed
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: ColorManager.PRIMARY_BLUE,
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.27,
      child: Column(
        children: [
          // Padding(padding: EdgeInsets.fromLTRB(0, height(0.06, context), 0, 0)),
          Padding(
            padding: EdgeInsets.fromLTRB(width(0.04, context),
                height(0.06, context), width(0.08, context), 0),
            child: Row(
              // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                // Padding(padding: EdgeInsets.fromLTRB(width(0.06, context), 0, 0, 0)),
                Text(
                  ConstantsManager.HISTORY,
                  style: TextStyle(
                      color: Colors.white, fontSize: height(0.03, context)),
                ),
                // Padding(padding: EdgeInsets.fromLTRB(width(0.4, context), 0, 0, 0)),
                Expanded(
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                        style: ButtonStyle(
                          shape: MaterialStateProperty.all<OutlinedBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(
                                  20.0), // Adjust the value for the desired oval shape
                              side: BorderSide(
                                  width: 2.0,
                                  color: ColorManager
                                      .CYAN), // Add this line for the border
                            ),
                          ),
                          foregroundColor: MaterialStateProperty.all<Color>(
                              ColorManager.CYAN),
                        ),
                        onPressed: () {
                          showScrollableNotifier.value =
                              (showScrollableNotifier.value + 1) % 3;
                        },
                        child: ValueListenableBuilder(
                            valueListenable: showScrollableNotifier,
                            builder: (context, value, widget) {
                              return Text(
                                buttonTexts[showScrollableNotifier.value],
                                style: TextStyle(fontWeight: FontWeight.bold),
                              );
                            })),
                  ),
                ),
                // Padding(padding: EdgeInsets.fromLTRB(0, 0, 0, width(0.06, context))),
              ],
            ),
          ),
          Padding(padding: EdgeInsets.fromLTRB(0, height(0.03, context), 0, 0)),
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
