import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:budgetlab/Shared/constants_manager.dart';
import '../../SettingsModule/metadata_controller.dart';
import '../../Shared/color_manager.dart';
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
  String currentBalance = '0';
  String yourWorth = '0';

  MetaDataController metaDataController = MetaDataController();
  late ValueNotifier<List<MetaData>> metadata;

  @override
  void initState() {
    super.initState();
    metadata = ValueNotifier<List<MetaData>>([]);
    fetchData();
  }

  void fetchData() async {
    currentBalance = metaDataController.getCurrentBalance().toString();
    yourWorth = metaDataController.getYourWorth().toString();
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
            padding: EdgeInsets.fromLTRB(width(0.04, context),
                height(0.04, context), width(0.04, context), 0),
            child: _getForegroundWidget(context, currentBalance, yourWorth),
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

_getForegroundWidget(BuildContext context, String currentBalance, String yourWorth) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.stretch,
    children: [
      _getTopUserBar(context),
      Padding(padding: EdgeInsets.fromLTRB(0, height(0.04, context), 0, 0)),
      _getMoneyDisplayTile(context, currentBalance, yourWorth),
    ],
  );
}

_getTopUserBar(BuildContext context) {
  return Row(
    children: [
      CircleAvatar(
        radius: MediaQuery.of(context).size.width * 0.07,
        backgroundImage:
            AssetImage('assets/images/avatars/neutralGreenHair.jpg'),
      ),
      Expanded(
        child: Align(
          alignment: Alignment.centerRight,
          child: Text(
            ConstantsManager.APP_NAME,
            style:
                TextStyle(color: Colors.white, fontSize: height(0.03, context)),
          ),
        ),
      ),
    ],
  );
}

_getMoneyDisplayTile(BuildContext context, String currentBalance, String yourWorth) {
   String currencySymbol = ConstantsManager.currencies.firstWhere((currency) => currency['currencyCode'] == 'USD')['symbol'] ?? '';
   String currencyName = ConstantsManager.currencies.firstWhere((currency) => currency['currencyCode'] == 'USD')['currencyName'] ?? '';
   ExternalApiService externalApiService = ExternalApiService();
   // await externalApiService.getCountryFlag('US');

   return Container(
    height: height(0.2, context),
    width: MediaQuery.of(context).size.width * 0.9,
    padding: EdgeInsets.all(width(0.05, context)),
    decoration: BoxDecoration(
        color: Colors.white, borderRadius: BorderRadius.circular(20.0)),
    child: Row(
      children: [
        Expanded(
          flex: 7,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                ConstantsManager.AVAILABLE_BALANCE,
                style:
                TextStyle(color: ColorManager.DARK_GREY, fontSize: height(0.02, context)),
              ),
              Row(
                children: [
                  Container(
                    constraints: BoxConstraints(
                      maxHeight: height(0.048, context),
                    ),
                    child: FittedBox(
                      fit: BoxFit.fill,
                      child: Text(
                        currencySymbol,
                        style:
                        TextStyle(color: ColorManager.BLACK_VOID, fontSize: height(0.048, context), fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  Text(
                    currentBalance,
                    style:
                    TextStyle(color: ColorManager.BLACK_VOID, fontSize: height(0.048, context), fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              Padding(padding: EdgeInsets.fromLTRB(0, height(0.026, context), 0, 0)),
              Text(
                ConstantsManager.YOUR_WORTH,
                style:
                TextStyle(color: ColorManager.DARK_GREY, fontSize: height(0.02, context)),
              ),
              Row(
                children: [
                  Container(
                    constraints: BoxConstraints(
                        maxHeight: height(0.02, context),
                    ),
                    child: FittedBox(
                      fit: BoxFit.fill,
                      child: Text(
                        currencySymbol,
                        style:
                        TextStyle(color: ColorManager.BLACK_VOID, fontSize: height(0.02, context)),
                      ),
                    ),
                  ),
                  Text(
                    yourWorth,
                    style:
                    TextStyle(color: ColorManager.BLACK_VOID, fontSize: height(0.02, context)),
                  ),
                ],
              )
            ],
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            CircleAvatar(
              radius: MediaQuery.of(context).size.width * 0.07,
              backgroundImage:
              AssetImage('assets/images/avatars/neutralGreenHair.jpg'),
            ),
            Padding(padding: EdgeInsets.fromLTRB(0, height(0.04, context), 0, 0)),
            Container(
              constraints: BoxConstraints(
                maxWidth: width(0.4, context),
              ),
              child: FittedBox(
                fit: BoxFit.fill,
                child: Text(
                  currencyName,
                  style:
                  TextStyle(color: ColorManager.BLACK_VOID, fontSize: height(0.02, context)),
                ),
              ),
            ),
          ],
        ),
      ],
    ),
  );
}
