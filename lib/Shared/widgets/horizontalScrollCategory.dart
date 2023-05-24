import 'package:budgetlab/BudgetModule/Budgets/Category/category_controller.dart';
import 'package:budgetlab/BudgetModule/Budgets/Category/category_entity.dart';
import 'package:flutter/material.dart';

/// Public Method //////////////////////////////////////////////////////////////

getHorizontalScrollCategory() {
  return const HorizontalScrollCategory();
}

/// Widget /////////////////////////////////////////////////////////////////////

class HorizontalScrollCategory extends StatefulWidget {
  const HorizontalScrollCategory({Key? key}) : super(key: key);

  @override
  State<HorizontalScrollCategory> createState() =>
      _HorizontalScrollCategoryState();
}

class Database {
  ValueNotifier<List<String>> dataListNotifier = ValueNotifier([]);

  Future<void> fetchDataFromDatabase() async {
    // Simulating fetching data from the database
    await Future.delayed(Duration(seconds: 2));

    // Dummy data
    List<String> dataList = ["asd", "sdf"];

    dataListNotifier.value = dataList;
  }
}

class _HorizontalScrollCategoryState extends State<HorizontalScrollCategory> {
  late int allCategoryListLength;
  late List<Category> allCategoryList;

  Database database = Database();
  CategoryController categoryController = CategoryController();

  @override
  void initState() {
    super.initState();
    fetchData();
    allCategoryList = categoryController.getAllCategoryList();
    allCategoryListLength = allCategoryList.length;
  }

  Future<void> fetchData() async {
    await database.fetchDataFromDatabase();
  }




  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: database.dataListNotifier,
      builder: (context, allCategoryList, _) {
        return ListView.builder(
          itemCount: allCategoryListLength,
          itemBuilder: (context, index) {
            final category = allCategoryList[index] as Category;
            return SizedBox(
              height: 70,
              child: Card(
                child: ListTile(
                  tileColor: Colors.white70,
                  leading: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      SizedBox(
                          height: 35,
                          width: 35,
                          child: Image.asset(
                            "",
                            fit: BoxFit.fill,
                          )),
                      Text(
                        category.name,
                      ),
                    ],
                  ),
                  trailing: IconButton(
                    icon: const Icon(Icons.edit),
                    onPressed: () {
                      null;
                    },
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }
}
