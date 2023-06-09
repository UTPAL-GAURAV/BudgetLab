
import 'package:budgetlab/SettingsModule/metadata_controller.dart';
import 'package:flutter/material.dart';

/// Public Method //////////////////////////////////////////////////////////////

getPiggyBalanceTile() {
  return const PiggyBalanceTile();
}


/// Widget /////////////////////////////////////////////////////////////////////

class PiggyBalanceTile extends StatefulWidget {
  const PiggyBalanceTile({Key? key}) : super(key: key);

  @override
  State<PiggyBalanceTile> createState() => _PiggyBalanceTileState();
}

class _PiggyBalanceTileState extends State<PiggyBalanceTile> {
  MetaDataController metaDataController = MetaDataController();

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Stack(children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(
                  left: 20.0, top: 10.0, right: 20.0),
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.18,
                decoration: BoxDecoration(
                  gradient: const LinearGradient(colors: [
                    Colors.lightBlueAccent,
                    Colors.blueAccent
                  ]),
                  borderRadius: BorderRadius.circular(40),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.lightBlueAccent.withOpacity(0.5),
                      blurRadius: 7,
                      offset: const Offset(4, 8), // shadow position
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    Image.asset('assets/images/piggy.png'),
                    Column(
                      crossAxisAlignment:
                      CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: MediaQuery.of(context)
                              .size
                              .height *
                              0.045,
                        ),
                        const Text(
                          "Current balance",
                          style: TextStyle(color: Colors.white),
                        ),
                         Text(
                          metaDataController.getCurrentBalance().toString(),
                          style: TextStyle(
                              fontSize: 30,
                              color: Colors.white),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context)
                              .size
                              .height *
                              0.03,
                        ),
                        const Text(
                          "Your Worth: ",
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        )
      ]),
    );
  }
}
