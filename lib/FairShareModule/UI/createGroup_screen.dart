import 'package:budgetlab/FairShareModule/FairShare_Entities/group_entity.dart';
import 'package:budgetlab/FairShareModule/fairShare_controller.dart';
import 'package:budgetlab/Shared/color_manager.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../HomeModule/UI/homePage_screen.dart';
import '../../Shared/constants_manager.dart';
import '../../Shared/model/TextFormFieldConfig.dart';
import '../../Shared/routes_manager.dart';
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
  String icon = 'assets/images/icons/budgetCategory/piggy.png';

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: ColorManager.PRIMARY_BLUE,
          foregroundColor: Colors.white,
          title: const Text(ConstantsManager.ADD_SAVINGS),
        ),
        body: StatefulBuilder(builder: (BuildContext context, StateSetter setState) {
          return Column(children: [
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
            WidgetManager.getTextFormField(
                TextFormFieldConfig(
                    labelText: "Group Name",
                    hintText: " Switzerland Trip",
                    keyboardType: TextInputType.name,
                    maxLength: 100,
                    validatorCallback: Validator.validateNothing,
                    onSavedCallback: (value) => groupName = value!),
                context),
            // getGroupTypeList(); // for icon
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                width: screenWidth(0.9, context),
                child: FloatingActionButton.extended(
                    label: Text("SAVE", style: TextStyle(color: Colors.white, fontSize: screenHeight(0.02, context))),
                    backgroundColor: ColorManager.PRIMARY_BLUE,
                    onPressed: () {
                      formKey.currentState!.save();
                      if (formKey.currentState!.validate()) {
                        fairShareController
                            .addNewGroup(Group(name: groupName, isGroup: true, amountStatus: 0, icon: icon));
                        GoRouter.of(context).pushNamed(AppRouteConstants.fairShare);
                      }
                    }),
              ),
            ),
          ]);
        }),
      ),
    );
  }
}
