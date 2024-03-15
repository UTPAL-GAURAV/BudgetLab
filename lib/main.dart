import 'package:budgetlab/BudgetModule/Budgets/Category/category_controller.dart';
import 'package:budgetlab/BudgetModule/Budgets/Category/category_entity.dart';
import 'package:budgetlab/SettingsModule/metadata_controller.dart';
import 'package:budgetlab/SettingsModule/metadata_entity.dart';
import 'package:budgetlab/Shared/constants_manager.dart';
import 'package:budgetlab/Shared/enums_manager.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'DB/ObjectBoxManager.dart';
import 'HomeModule/UI/homePage_screen.dart';
import 'Shared/routes_manager.dart';

Future<void> main() async {
  // Open DB
  await ObjectBoxManager.openObjectBoxStore();
  //TODO: Shift to fairshare
  // await Firebase.initializeApp(
  //   options: DefaultFirebaseOptions.currentPlatform,
  // );
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // Create an instance of RoutesManager to access the router

    return MaterialApp.router(
      title: ConstantsManager.APP_NAME,
      debugShowCheckedModeBanner: false,
      routerDelegate: RoutesManager.goRouter.routerDelegate,
      routeInformationProvider: RoutesManager.goRouter.routeInformationProvider,
      routeInformationParser: RoutesManager.goRouter.routeInformationParser,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // home: const MyHomePage(title: ConstantsManager.APP_NAME),
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
    _loadPreferences();
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

  Future<void> _loadPreferences() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (prefs.getBool('introQuestionnairePending') ?? true) {
      GoRouter.of(context).pushReplacementNamed(AppRouteConstants.introQuestionnaire);
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
      categoryController.addCategory(Category(transactionType: TransactionType.expense.name, name: "Entertainment", icon: 'assets/images/icons/budgetCategory/theater.png', isCap: false, cycle: BudgetCycle.none.name, cycleBudget: 0, addToNextCycle: false, currentCycleAmountLeft: 0, totalCycleAmount: 0, totalAmountSpent: 0));
      categoryController.addCategory(Category(transactionType: TransactionType.expense.name, name: "Food", icon: 'assets/images/icons/budgetCategory/fast-food.png', isCap: false, cycle: BudgetCycle.none.name, cycleBudget: 0, addToNextCycle: false, currentCycleAmountLeft: 0, totalCycleAmount: 0, totalAmountSpent: 0));
      categoryController.addCategory(Category(transactionType: TransactionType.expense.name, name: "Fuel", icon: 'assets/images/icons/budgetCategory/fuel.png', isCap: false, cycle: BudgetCycle.none.name, cycleBudget: 0, addToNextCycle: false, currentCycleAmountLeft: 0, totalCycleAmount: 0, totalAmountSpent: 0));
      categoryController.addCategory(Category(transactionType: TransactionType.expense.name, name: "Rent", icon: 'assets/images/icons/budgetCategory/house.png', isCap: false, cycle: BudgetCycle.none.name, cycleBudget: 0, addToNextCycle: false, currentCycleAmountLeft: 0, totalCycleAmount: 0, totalAmountSpent: 0));
      categoryController.addCategory(Category(transactionType: TransactionType.income.name, name: "Salary", icon: 'assets/images/icons/budgetCategory/salary.png', isCap: false, cycle: BudgetCycle.none.name, cycleBudget: 0, addToNextCycle: false, currentCycleAmountLeft: 0, totalCycleAmount: 0, totalAmountSpent: 0));
      categoryController.addCategory(Category(transactionType: TransactionType.expense.name, name: "Shopping", icon: 'assets/images/icons/budgetCategory/trolley.png', isCap: false, cycle: BudgetCycle.none.name, cycleBudget: 0, addToNextCycle: false, currentCycleAmountLeft: 0, totalCycleAmount: 0, totalAmountSpent: 0));

      metaDataController.updateMetadata(Metadata(currentBalance: 0, yourWorth: 0, userName: "User", currency: "", country: "", countryCode: 0, password: "", hideOn: false, readMessage: false));
    }
  }
}
