import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hrsummit/state/quizListModel.dart';
import 'package:hrsummit/ui/quiz/archived_%20quiz_screen.dart';
import 'package:hrsummit/ui/quiz/quiz_screen.dart';
import 'package:hrsummit/utils/viewModel.dart';
import 'package:hrsummit/widgets/primary_button.dart';
import 'package:provider/provider.dart';

import '../../state/homeModel.dart';
import '../../utils/app_constants.dart';
import '../../utils/header_widget.dart';
import '../../utils/helper.dart';
import '../../widgets/commonBG.dart';

class QuizListScreen extends StatefulWidget {
  static const String route = '/quizList';

  const QuizListScreen({super.key});

  @override
  State<QuizListScreen> createState() => _QuizListScreenState();
}

class _QuizListScreenState extends State<QuizListScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    withViewModel<QuizListModel>(context, (viewModel) async {
      viewModel.quizListApi();
    });
  }

  @override
  Widget build(BuildContext context) {
    return MyAppBackGroundVM<QuizListModel>(
      child: Consumer<QuizListModel>(
        builder: (context, provider, child) {
          return Scaffold(
            body: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                HeaderWidget(),
                Image.asset(quiz),
                SizedBox(height: 10),
                provider.upCTrainingResult.data != null ? Expanded(
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: 25,
                            height: 25,
                            child: Image.asset(activeQuiz),
                          ),
                          SizedBox(width: 10),
                          Text(
                            "Active Quiz",
                            style: TextStyle(
                              color: Colors.brown[900],
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                        ],
                      ),
                      Expanded(
                        child: ListView.builder(
                          itemCount: provider.upCTrainingResult.data != null
                              ? provider.upCTrainingResult.data!.length
                              : 0,
                          itemBuilder: (BuildContext context, int index) => Container(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: PrimaryButton(
                                btnColor: Colors.deepPurpleAccent[100],
                                text: provider.upCTrainingResult.data![index].qUIZNAME!,
                                onPressed: () {
                                  print("onclick on question :: ${ provider.upCTrainingResult.data![index].qUIZID!}");
                                  // Helper.goToNext(QuizScreen.route);
                                  Helper.goToNext(QuizScreen.route,argument: "${ provider.upCTrainingResult.data![index].qUIZID!}",);

                                },
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ):Container(),
                provider.ArcheiveQuesResult.data != null  ?  Expanded(
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: 25,
                            height: 25,
                            child: Image.asset(archivedQuiz),
                          ),
                          SizedBox(width: 10),
                          Text(
                            "Archived Quiz",
                            style: TextStyle(
                              color: Colors.brown[900],
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                        ],
                      ),
                      Expanded(
                        child: ListView.builder(
                          itemCount: provider.ArcheiveQuesResult.data != null
                              ? provider.ArcheiveQuesResult.data!.length
                              : 0,
                          itemBuilder: (BuildContext context, int index) => Container(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: PrimaryButton(
                                btnColor: Colors.deepPurpleAccent[100],
                                text: provider.ArcheiveQuesResult.data![index].qUIZNAME!,
                                onPressed: () {

                                  // Navigator.pushNamed(context, ArchiveQuesScreen.route, arguments: "2");
                                  Helper.goToNext(ArchiveQuesScreen.route,argument: "${ provider.ArcheiveQuesResult.data![index].qUIZID!}",);
                                },
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ) : Container()
              ],
            ),
          );
        },
      ),
    );
  }
}
