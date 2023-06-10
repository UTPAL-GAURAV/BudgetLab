import 'package:budgetlab/BudgetModule/Budgets/Category/category_controller.dart';
import 'package:budgetlab/BudgetModule/Budgets/Category/category_entity.dart';
import 'package:budgetlab/SettingsModule/metadata_controller.dart';
import 'package:budgetlab/SettingsModule/metadata_entity.dart';
import 'package:budgetlab/Shared/constants_manager.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'DB/ObjectBoxManager.dart';
import 'HomeModule/UI/homePage_screen.dart';

Future<void> main() async {
  // Open DB
  await ObjectBoxManager.openObjectBoxStore();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: ConstantsManager.APP_NAME,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: ConstantsManager.APP_NAME),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

/**
 * WidgetsBindingObserver keeps track of lifecycle.
 */
class _MyHomePageState extends State<MyHomePage> with WidgetsBindingObserver{
  // This method is required for lifecycle management
  @override
  void initState() {
    super.initState();
    setOnFirstRun();
    WidgetsBinding.instance.addObserver(this);
  }

  // Opens ObjectBox store when app is opened/resumed and closes store when app is inactive.
  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.paused) {
      ObjectBoxManager.closeObjectBoxStore();
    } else if (state == AppLifecycleState.resumed) {
      ObjectBoxManager.openObjectBoxStore();
    }
  }

  @override
  Widget build(BuildContext context) {
    return const HomePageScreen();
  }



  /// These data should be set on First run of the app
  void setOnFirstRun() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if(prefs.getBool('firstRun') ?? true) {
      print("This part is executed because the app run for the very first time.");
      await prefs.setBool('firstRun', false);

      CategoryController categoryController = CategoryController();
      MetaDataController metaDataController = MetaDataController();

      categoryController.addCategory(Category(isExpense: false, name: "Salary", icon: 'assets/images/icons/salary.png'));
      categoryController.addCategory(Category(isExpense: true, name: "Food", icon: 'assets/images/icons/fast-food.png'));
      categoryController.addCategory(Category(isExpense: true, name: "Shopping", icon: 'assets/images/icons/trolley.png'));
      categoryController.addCategory(Category(isExpense: true, name: "Fuel", icon: 'assets/images/icons/fuel.png'));
      categoryController.addCategory(Category(isExpense: true, name: "Rent", icon: 'assets/images/icons/house.png'));
      categoryController.addCategory(Category(isExpense: true, name: "Entertainment", icon: 'assets/images/icons/theater.png'));

      metaDataController.updateMetadata(Metadata(currentBalance: 0, yourWorth: 0, userName: "Hello User", currency: "", country: "", countryCode: 0, password: "", hideOn: false, readMessage: false));
    }
  }
}
