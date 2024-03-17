import 'package:budgetlab/SettingsModule/metadata_controller.dart';
import 'package:budgetlab/SettingsModule/metadata_entity.dart';
import 'package:budgetlab/Shared/constants_manager.dart';
import 'package:currency_picker/currency_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../HomeModule/UI/homePage_screen.dart';
import '../../Shared/color_manager.dart';
import '../../Shared/model/TextFormFieldConfig.dart';
import '../../Shared/routes_manager.dart';
import 'package:budgetlab/Shared/widgets/widget_manager.dart' as WidgetManager;
import 'package:budgetlab/Shared/helper/validator_helper.dart' as Validator;

class IntroQuestionareScreen extends StatefulWidget {
  const IntroQuestionareScreen({Key? key}) : super(key: key);

  @override
  State<IntroQuestionareScreen> createState() => _IntroQuestionareScreenState();
}

class _IntroQuestionareScreenState extends State<IntroQuestionareScreen> {
  MetaDataController metaDataController = MetaDataController();

  final formKey = GlobalKey<FormState>();
  late String userName, currency = "USD";
  bool gender = false;
  Currency selectedCurrency = Currency(
    code: 'USD',
    name: 'United States Dollar',
    symbol: '\$',
    flag: 'US', // This is the ISO 3166-1 alpha-2 country code for the United States
    number: 840, // This is the ISO 4217 currency code number for USD
    decimalDigits: 2,
    namePlural: 'United States Dollars',
    symbolOnLeft: true,
    decimalSeparator: '.',
    thousandsSeparator: ',',
    spaceBetweenAmountAndSymbol: false,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: formKey,
        child: Container(
          child: Column(
            children: [
              Row(
                children: [
                  Text(
                    ConstantsManager.APP_NAME,
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.w500),
                  ),
                  CircleAvatar(
                    radius: 50,
                    backgroundImage: AssetImage('assets/images/avatars/neutralGreenHair.jpg'),
                  ),
                ],
              ),
              Column(
                children: [
                  WidgetManager.getTextFormField(
                      TextFormFieldConfig(
                          labelText: "Name",
                          hintText: " John",
                          keyboardType: TextInputType.name,
                          maxLength: 12,
                          validatorCallback: Validator.validateNameField,
                          onSavedCallback: (value) => userName = value!),
                      context),
                  ElevatedButton(
                    onPressed: () {
                      showCurrencyPicker(
                        context: context,
                        showFlag: true,
                        showSearchField: true,
                        showCurrencyName: true,
                        showCurrencyCode: true,
                        onSelect: (Currency currency) {
                          this.currency = currency.code;
                          selectedCurrency = currency;
                        },
                      );
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Text(
                              CurrencyUtils.currencyToEmoji(selectedCurrency), // Example flag code
                              style: TextStyle(fontSize: 40),
                            ),
                            Padding(padding: EdgeInsets.only(right: 20)),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      selectedCurrency.code,
                                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                                    ),
                                    Padding(padding: EdgeInsets.only(left: 20)),
                                    Text(
                                      selectedCurrency.symbol,
                                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                                    ),
                                  ],
                                ),
                                Text(
                                  selectedCurrency.name,
                                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                                ),
                              ],
                            ),

                          ],
                        ),
                        Icon(Icons.arrow_forward_ios),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(80.0),
                    child: SizedBox(
                      width: screenWidth(0.9, context),
                      child: FloatingActionButton.extended(
                          label: Text("SAVE",
                              style: TextStyle(color: Colors.white, fontSize: screenHeight(0.02, context))),
                          backgroundColor: ColorManager.PRIMARY_BLUE,
                          onPressed: () async {
                            formKey.currentState!.save();
                            if (formKey.currentState!.validate()) {
                              Metadata? currentMetadata = metaDataController.getAllMetadata();
                              currentMetadata ??= Metadata(); // Assign default metadata if fetched is null
                              currentMetadata.userName = userName;
                              currentMetadata.gender = gender;
                              currentMetadata.currency = currency;
                              currentMetadata.country = selectedCurrency.flag!;
                              metaDataController.updateMetadata(currentMetadata);
                              SharedPreferences prefs = await SharedPreferences.getInstance();
                              await prefs.setBool('introQuestionnairePending', false);
                              GoRouter.of(context).pushNamed(AppRouteConstants.home);
                            }
                          }),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
