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
import '../widgets/homeWidgets.dart';

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
                CommonAppbar(
                  title: "QUIZ",
                  
                ),
                SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.asset(quiz),
                      SizedBox(height: 10),
                      /// Active Quiz Section
                      provider.upCTrainingResult.data != null
                          ? Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                width: 25,
                                height: 25,
                                child: Image.asset(activeQuiz),
                              ),
                              const SizedBox(width: 10),
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
                          ListView.builder(
                            shrinkWrap: true, // ✅ important
                            physics: const NeverScrollableScrollPhysics(), // ✅ let parent scroll
                            itemCount: provider.upCTrainingResult.data?.length ?? 0,
                            itemBuilder: (BuildContext context, int index) => Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: QuizCard(
                                quizName: provider.upCTrainingResult.data![index].qUIZNAME!,
                                onStart: () {
                                  print("Quiz Started!");
                                  Helper.goToNext(
                                    QuizScreen.route,
                                    argument:
                                    "${provider.upCTrainingResult.data![index].qUIZID!}",
                                  );
                                },
                              ),
                            ),
                          ),
                        ],
                      )
                          : Container(),

                      /// Archived Quiz Section
                      provider.ArcheiveQuesResult.data != null
                          ? Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                width: 25,
                                height: 25,
                                child: Image.asset(archivedQuiz),
                              ),
                              const SizedBox(width: 10),
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
                          ListView.builder(
                            shrinkWrap: true, // ✅ important
                            physics: const NeverScrollableScrollPhysics(), // ✅ let parent scroll
                            itemCount: provider.ArcheiveQuesResult.data?.length ?? 0,
                            itemBuilder: (BuildContext context, int index) => Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: QuizCard(
                                quizName: provider.ArcheiveQuesResult.data![index].qUIZNAME!,
                                onStart: () {
                                  print("Quiz Started!");
                                  Helper.goToNext(
                                    QuizScreen.route,
                                    argument:
                                    "${provider.ArcheiveQuesResult.data![index].qUIZID!}",
                                  );
                                },
                              ),
                            ),
                          ),
                        ],
                      )
                          : Container(),
                    ],
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
