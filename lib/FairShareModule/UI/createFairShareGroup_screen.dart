import 'package:budgetlab/FairShareModule/FairShare_Entities/group_entity.dart';
import 'package:budgetlab/FairShareModule/fairShare_controller.dart';
import 'package:budgetlab/Shared/color_manager.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:uuid/uuid.dart';

import '../../HomeModule/UI/homePage_screen.dart';
import '../../Shared/constants_manager.dart';
import '../../Shared/enums_manager.dart';
import '../../Shared/model/TextFormFieldConfig.dart';
import '../../Shared/routes_manager.dart';
import '../../Shared/service/common_service.dart';
import '../../Shared/service/gallery_service.dart';
import '../../Shared/widgets/widget_manager.dart';

import 'package:budgetlab/Shared/widgets/widget_manager.dart' as WidgetManager;
import 'package:budgetlab/Shared/helper/validator_helper.dart' as Validator;

class CreateFairShareGroupScreen extends StatefulWidget {
  const CreateFairShareGroupScreen({Key? key}) : super(key: key);

  @override
  State<CreateFairShareGroupScreen> createState() => _CreateFairShareGroupScreenState();
}

class _CreateFairShareGroupScreenState extends State<CreateFairShareGroupScreen> {
  GalleryService galleryService = GalleryService();
  FairShareController fairShareController = FairShareController();

  final formKey = GlobalKey<FormState>();
  late String groupName;
  FairShareGroupCategory category = FairShareGroupCategory.other;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: ColorManager.PRIMARY_BLUE,
          foregroundColor: Colors.white,
          title: const Text(ConstantsManager.CREATE_GROUP),
        ),
        body: StatefulBuilder(builder: (BuildContext context, StateSetter setState) {
          return Container(
            padding: EdgeInsets.fromLTRB(screenWidth(0.01, context), screenHeight(0.02, context), screenWidth(0.01, context), screenHeight(0.02, context)),
            child: Column(children: [
              GestureDetector(
                onTap: () async {
                  Map<Permission, PermissionStatus> statuses = await [
                    Permission.storage,
                  ].request();
                  if (statuses[Permission.storage]!.isGranted) {}
                  final xFile = await galleryService.getImageFromGallery(); // Open gallery when CircleAvatar is tapped
                  // provider.setUploadedImage(xFile.path);
                  // allIconsList.value.add(xFile.path);
                },
                child: Container(
                  margin: const EdgeInsets.all(6),
                  child: getLastIconEditButton(context),
                ),
              ),
              Container(padding: EdgeInsets.fromLTRB(screenWidth(0.02, context), screenHeight(0.03, context), screenWidth(0.02, context), screenHeight(0.04, context)),
                  child: WidgetManager.getTextFormField(
                  TextFormFieldConfig(
                      labelText: "Group Name",
                      hintText: " Switzerland Trip",
                      keyboardType: TextInputType.name,
                      maxLength: 100,
                      validatorCallback: Validator.validateNameField,
                      onSavedCallback: (value) => groupName = value!),
                  context),),

              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                padding: EdgeInsets.only(bottom: 4, right: 2),
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        category = FairShareGroupCategory.travel;
                      },
                      child: Container(
                        padding: EdgeInsets.fromLTRB(10, 3, 10, 6),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(6.0),
                          border: Border.all(),
                          boxShadow: [
                            BoxShadow(
                              color: ColorManager.BLUE.withOpacity(1),
                              blurRadius: 1,
                              offset: const Offset(1, 1), // shadow position
                            ),
                          ],
                        ),
                        child: Row(
                          children: [
                            Icon(Icons.flight),
                            Text(
                              " Travel ",
                              style: TextStyle(
                                fontSize: 20,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(padding: EdgeInsets.only(left: 10)),
                    GestureDetector(
                      onTap: () {
                        category = FairShareGroupCategory.dineOut;
                      },
                      child: Container(
                        padding: EdgeInsets.fromLTRB(10, 3, 10, 6),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(6.0),
                          border: Border.all(),
                          boxShadow: [
                            BoxShadow(
                              color: ColorManager.BLUE.withOpacity(1),
                              blurRadius: 1,
                              offset: const Offset(1, 1), // shadow position
                            ),
                          ],
                        ),
                        child: Row(
                          children: [
                            Icon(Icons.fastfood),
                            Text(
                              " Dine out ",
                              style: TextStyle(
                                fontSize: 20,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(padding: EdgeInsets.only(left: 10)),
                    GestureDetector(
                      onTap: () {
                        category = FairShareGroupCategory.home;
                      },
                      child: Container(
                        padding: EdgeInsets.fromLTRB(10, 3, 10, 6),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(6.0),
                          border: Border.all(),
                          boxShadow: [
                            BoxShadow(
                              color: ColorManager.BLUE.withOpacity(1),
                              blurRadius: 1,
                              offset: const Offset(1, 1), // shadow position
                            ),
                          ],
                        ),
                        child: Row(
                          children: [
                            Icon(Icons.home),
                            Text(
                              " Home ",
                              style: TextStyle(
                                fontSize: 20,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(padding: EdgeInsets.only(left: 10)),
                    GestureDetector(
                      onTap: () {
                        category = FairShareGroupCategory.couple;
                      },
                      child: Container(
                        padding: EdgeInsets.fromLTRB(10, 3, 10, 6),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(6.0),
                          border: Border.all(),
                          boxShadow: [
                            BoxShadow(
                              color: ColorManager.BLUE.withOpacity(1),
                              blurRadius: 1,
                              offset: const Offset(1, 1), // shadow position
                            ),
                          ],
                        ),
                        child: Row(
                          children: [
                            Icon(Icons.people_rounded),
                            Text(
                              " Couple ",
                              style: TextStyle(
                                fontSize: 20,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(padding: EdgeInsets.only(left: 10)),
                    GestureDetector(
                      onTap: () {
                        category = FairShareGroupCategory.other;
                      },
                      child: Container(
                        padding: EdgeInsets.fromLTRB(10, 3, 10, 6),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(6.0),
                          border: Border.all(),
                          boxShadow: [
                            BoxShadow(
                              color: ColorManager.BLUE.withOpacity(1),
                              blurRadius: 1,
                              offset: const Offset(1, 1), // shadow position
                            ),
                          ],
                        ),
                        child: Row(
                          children: [
                            Icon(Icons.list_alt),
                            Text(
                              " Other ",
                              style: TextStyle(
                                fontSize: 20,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              Padding(
                padding: EdgeInsets.only(top: screenHeight(0.1, context)),
                child: SizedBox(
                  width: screenWidth(0.9, context),
                  child: FloatingActionButton.extended(
                      label: Text("SAVE", style: TextStyle(color: Colors.white, fontSize: screenHeight(0.02, context))),
                      backgroundColor: ColorManager.PRIMARY_BLUE,
                      onPressed: () {
                        formKey.currentState!.save();
                        if (formKey.currentState!.validate()) {
                          Group group = Group(name: groupName, isGroup: true, amountStatus: 0, icon: getFairShareGroupIcon(category), groupUniqueId: Uuid().v4());
                          fairShareController.addNewGroup(group);
                          GoRouter.of(context).pushNamed(AppRouteConstants.groupScreen, extra: group);
                        }
                      }),
                ),
              ),
            ]),
          );
        }),
      ),
    );
  }
}
