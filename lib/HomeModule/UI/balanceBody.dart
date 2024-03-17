import 'dart:collection';

import 'package:budgetlab/HomeModule/UI/homePage_screen.dart';
import 'package:currency_picker/currency_picker.dart';
import 'package:flutter/material.dart';
import 'package:budgetlab/Shared/constants_manager.dart';
import 'package:go_router/go_router.dart';
import '../../SettingsModule/metadata_controller.dart';
import '../../Shared/color_manager.dart';
import '../../Shared/routes_manager.dart';
import '../../Shared/service/common_service.dart';
import '../../Shared/service/external_api_service.dart';

/// Public Method //////////////////////////////////////////////////////////////

getBalanceBody() {
  return const BalanceBody();
}

/// Widget /////////////////////////////////////////////////////////////////////
class BalanceBody extends StatefulWidget {
  const BalanceBody({Key? key}) : super(key: key);

  @override
  State<BalanceBody> createState() => _BalanceBodyState();
}

class _BalanceBodyState extends State<BalanceBody> {
  late ValueNotifier<List<MetaData>> metadata;

  @override
  void initState() {
    super.initState();
    metadata = ValueNotifier<List<MetaData>>([]);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        color: ColorManager.PRIMARY_BACKGROUND,
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height * 0.35,
        child: Stack(children: [
          _getBackgroundWidget(context),
          Padding(
            padding: EdgeInsets.fromLTRB(
                screenWidth(0.04, context), screenHeight(0.04, context), screenWidth(0.04, context), 0),
            child: _getForegroundWidget(context),
          ),
        ]));
  }
}

_getBackgroundWidget(BuildContext context) {
  return Column(
    children: [
      Container(
        height: MediaQuery.of(context).size.height * 0.25,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            color: ColorManager.PRIMARY_BLUE,
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(35.0),
              bottomRight: Radius.circular(35.0),
            )),
      ),
      Container(
        color: ColorManager.LIGHT_PURPLE,
      )
    ],
  );
}

_getForegroundWidget(BuildContext context) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.stretch,
    children: [
      _getTopUserBar(context),
      Padding(padding: EdgeInsets.fromLTRB(0, screenHeight(0.04, context), 0, 0)),
      _getMoneyDisplayTile(context),
    ],
  );
}

_getTopUserBar(BuildContext context) {
  return Row(
    children: [
      GestureDetector(
        child: CircleAvatar(
          radius: MediaQuery.of(context).size.width * 0.07,
          backgroundImage: AssetImage('assets/images/avatars/neutralGreenHair.jpg'),
        ),
        onTap: () {
          GoRouter.of(context).pushNamed(AppRouteConstants.settings);
        },
      ),
      Expanded(
        child: Align(
          alignment: Alignment.centerRight,
          child: Text(
            ConstantsManager.APP_NAME,
            style: TextStyle(color: Colors.white, fontSize: screenHeight(0.03, context)),
          ),
        ),
      ),
    ],
  );
}

_getMoneyDisplayTile(BuildContext context) {
  String currentBalance = '0', yourWorth = '0', expendableAmount = '0';
  MetaDataController metaDataController = MetaDataController();
  currentBalance = metaDataController.getCurrentBalance().toString();
  yourWorth = metaDataController.getYourWorth().toString();
  expendableAmount = metaDataController.getExpendableAmount().toString();

  String currencyCode = metaDataController.getAllMetadata()?.currency ?? 'USD';
  Currency selectedCurrency = CurrencyService().findByCode(currencyCode)!;

  return Container(
    height: screenHeight(0.2, context),
    width: screenWidth(0.9, context),
    padding: EdgeInsets.fromLTRB(screenWidth(0.05, context), screenHeight(0.02, context), screenWidth(0.05, context),
        screenHeight(0.01, context)),
    decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(20.0)),
    child: Row(
      children: [
        Expanded(
          flex: 7,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                ConstantsManager.AVAILABLE_BALANCE,
                style: TextStyle(color: ColorManager.DARK_GREY, fontSize: screenHeight(0.02, context)),
              ),
              Row(
                children: [
                  Container(
                    constraints: BoxConstraints(
                      maxHeight: screenHeight(0.048, context),
                    ),
                    child: FittedBox(
                      fit: BoxFit.fill,
                      child: Text(
                        selectedCurrency.symbol,
                        style: TextStyle(
                            color: ColorManager.BLACK_VOID,
                            fontSize: screenHeight(0.048, context),
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  SizedBox(width: 6,),
                  Text(
                    currentBalance,
                    style: TextStyle(
                        color: ColorManager.BLACK_VOID,
                        fontSize: screenHeight(0.048, context),
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              Padding(padding: EdgeInsets.fromLTRB(0, screenHeight(0.008, context), 0, 0)),
              Text(
                ConstantsManager.YOUR_WORTH,
                style: TextStyle(color: ColorManager.DARK_GREY, fontSize: screenHeight(0.02, context)),
              ),
              Row(
                children: [
                  Container(
                    constraints: BoxConstraints(
                      maxHeight: screenHeight(0.02, context),
                    ),
                    child: FittedBox(
                      fit: BoxFit.fill,
                      child: Text(
                        selectedCurrency.symbol,
                        style: TextStyle(color: ColorManager.BLACK_VOID, fontSize: screenHeight(0.02, context)),
                      ),
                    ),
                  ),
                  SizedBox(width: 10,),
                  Text(
                    yourWorth,
                    style: TextStyle(color: ColorManager.BLACK_VOID, fontSize: screenHeight(0.02, context)),
                  ),
                ],
              )
            ],
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Padding(
              padding: EdgeInsets.only(right: screenWidth(0.01, context)),
              child: Text(
                CurrencyUtils.currencyToEmoji(selectedCurrency),
                style: TextStyle(fontSize: MediaQuery.of(context).size.width * 0.094),
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(0, screenHeight(0.004, context), screenWidth(0.026, context), 0),
              child: Text(
                selectedCurrency.code,
                style: TextStyle(color: ColorManager.BLACK_VOID, fontSize: screenHeight(0.02, context)),
              ),
            ),
            Padding(padding: EdgeInsets.fromLTRB(0, screenHeight(0.008, context), 0, 0)),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  ConstantsManager.EXPENDABLE_AMOUNT,
                  style: TextStyle(color: ColorManager.DARK_GREY, fontSize: screenHeight(0.02, context)),
                ),
                Row(
                  children: [
                    Container(
                      constraints: BoxConstraints(
                        maxHeight: screenHeight(0.02, context),
                      ),
                      child: FittedBox(
                        fit: BoxFit.fill,
                        child: Text(
                          selectedCurrency.symbol,
                          style: TextStyle(color: ColorManager.BLACK_VOID, fontSize: screenHeight(0.02, context)),
                        ),
                      ),
                    ),
                    SizedBox(width: 10,),
                    Text(
                      expendableAmount,
                      style: TextStyle(color: ColorManager.BLACK_VOID, fontSize: screenHeight(0.02, context)),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ],
    ),
  );
}
