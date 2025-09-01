import 'package:flutter/material.dart';
import 'package:hrsummit/state/dignitarieModel.dart';
import 'package:hrsummit/ui/widgets/homeWidgets.dart';
import 'package:hrsummit/ui/widgets/profileCard_widget.dart';
import 'package:hrsummit/utils/app_constants.dart';
import 'package:hrsummit/utils/header_widget.dart';
import 'package:hrsummit/utils/viewModel.dart';
import 'package:hrsummit/widgets/commonBG.dart';
import 'package:provider/provider.dart';

class DignitariesScreen extends StatefulWidget {
  static const String route = '/dignitaries';
  const DignitariesScreen({super.key});

  @override
  State<DignitariesScreen> createState() => _DignitariesScreenState();
}

class _DignitariesScreenState extends State<DignitariesScreen> {
  @override
  void initState() {
    withViewModel<DignitariesModel>(context, (viewModel) async {
      viewModel.calldignApi();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MyAppBackGroundVM<DignitariesModel>(
      child: Consumer<DignitariesModel>(
        builder: (context, provider, child) {
          return Scaffold(
            backgroundColor: Colors.transparent,
            body: Column(
              children: [
                HeaderWidget(),
                CommonAppbar(title: "Dignitaries"),
                provider.dignRespDto.isNotEmpty
                    ? ListView.builder(
                        itemCount: provider.dignRespDto.length,
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,

                        itemBuilder: (context, index) {
                          return ProfileContentWidget(
                            name: provider.dignRespDto[index].nAME.toString(),
                            designation: provider.dignRespDto[index].dESIGNATION
                                .toString(),
                            imagePath: kIconLogo,
                            // imagePath: baseImg + provider.dignRespDto.data![index].pHOTO.toString(),
                            onViewMore:  provider.dignRespDto[index].cONTENT.toString(),
                          );
                        },
                      )
                    : Center(child: Text("No dignitaries found")),
              ],
            ),
          );
        },
      ),
    );
  }
}
