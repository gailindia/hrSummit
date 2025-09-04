import 'package:flutter/material.dart';
import 'package:hrsummit/state/quizQuestionsModel.dart';
import 'package:hrsummit/ui/quiz/quiz_list.dart';
import 'package:hrsummit/utils/app_constants.dart';
import 'package:hrsummit/utils/header_widget.dart';
import 'package:provider/provider.dart';

import '../../utils/helper.dart';
import '../../utils/viewModel.dart';
import '../../widgets/commonBG.dart';
import '../../widgets/primary_button.dart';
import '../widgets/homeWidgets.dart';
import '../widgets/quizOptionsWidget.dart';

class QuizScreen extends StatefulWidget {
  static const String route = '/quizScreen';

  QuizScreen({super.key, this.quizId});

  String? quizId;

  @override
  State<QuizScreen> createState() => _quizScreenState();
}

class _quizScreenState extends State<QuizScreen> {
  List<Map<String, String>> answers = [];

  @override
  initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      final args = ModalRoute.of(context)?.settings.arguments as String?;
      setState(() {
        print(args);
        widget.quizId = args;
        print("quizId :: ${widget.quizId}");
      });

    });
    withViewModel<QuizQuestionsModel>(context, (viewModel) async {
      viewModel.quizQuestionsApi(widget.quizId??"0");
    });
  }

  int? _radioSelected;

  @override
  Widget build(BuildContext context) {

    // final args = ModalRoute.of(context)?.settings.arguments as String?;


    return MyAppBackGroundVM<QuizQuestionsModel>(
      child: Consumer<QuizQuestionsModel>(
        builder: (context, provider, child) {
          return Scaffold(
            body: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                HeaderWidget(),
                CommonAppbar(
                  title: "QUIZ",
                  onBack: () {
                    Helper.goToRemoveUntil(QuizListScreen.route);
                  },
                ),
                // Image.asset(quizQuestion),
                SizedBox(height: 10),
                Text(
                  "Questions",
                  style: TextStyle(
                    color: Colors.brown[900],
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  "Associated with Creativity, curiosity, and willingness to explore new experiences.",
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w400,
                    fontSize: 12,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 10),
                Expanded(
                  child: ListView.builder(
                    scrollDirection: Axis.vertical,
                    itemCount: provider.upCTrainingResult.data != null
                        ? provider.upCTrainingResult.data!.length
                        : 0,
                    itemBuilder: (context, index) {
                      final item = provider.upCTrainingResult.data![index];
                      return Container(
                        margin: EdgeInsets.symmetric(horizontal: 8.0),
                        decoration: BoxDecoration(
                          // border: Border.all(
                          //     color: const Color(0xffAFAFAF).withOpacity(0.5)),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                margin: const EdgeInsets.all(8),
                                decoration: BoxDecoration(
                                  color: const Color(0xFFE6E6FA), // light purple
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: Row(
                                  children: [
                                    // Number on left
                                    Container(
                                      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
                                      decoration: const BoxDecoration(
                                        color: Color(0xFFB39DDB), // darker purple
                                        borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(12),
                                          bottomLeft: Radius.circular(12),
                                        ),
                                      ),
                                      child: Text(
                                        '${index + 1}.',
                                        style: const TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black,
                                        ),
                                      ),
                                    ),

                                    // Text content
                                    Expanded(
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
                                        child: Text(
                                          item.qUESNAME ?? '',
                                          style: const TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16,
                                            color: Colors.black,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),

                              // Text(
                              //   "${index + 1}. ${item.qUESNAME ?? ''}",
                              //   style: const TextStyle(
                              //     fontSize: 16,
                              //     fontWeight: FontWeight.bold,
                              //   ),
                              //   maxLines: 3,
                              //   overflow: TextOverflow.ellipsis,
                              // ),
                              const SizedBox(height: 8),
                              QuizOptionsWidget(
                                text: item.oPTION1,
                                selectedOption: 1,
                                toggleable: true,
                                groupVal: _radioSelected,
                                onPressed: (value) {
                                  _radioSelected = value;
                                  answers.add({
                                    "QUES_ID": item.qUESID.toString(),
                                    "CORRECT_ANS": value.toString(),
                                  });
                                  setState(() {});
                                },
                              ),
                              QuizOptionsWidget(
                                text: item.oPTION2,
                                selectedOption: 2,
                                toggleable: true,
                                groupVal: _radioSelected,
                                onPressed: (value) {
                                  _radioSelected = value;
                                  answers.add({
                                    "QUES_ID": item.qUESID.toString(),
                                    "CORRECT_ANS": value.toString(),
                                  });
                                  setState(() {});
                                },
                              ),
                              QuizOptionsWidget(
                                text: item.oPTION3,
                                selectedOption: 3,
                                groupVal: _radioSelected,
                                toggleable: true,
                                onPressed: (value) {
                                  _radioSelected = value;
                                  answers.add({
                                    "QUES_ID": item.qUESID.toString(),
                                    "CORRECT_ANS": value.toString(),
                                  });
                                  setState(() {});
                                },
                              ),
                              QuizOptionsWidget(
                                text: item.oPTION4,
                                selectedOption: 4,
                                toggleable: true,
                                groupVal: _radioSelected,
                                onPressed: (value) {
                                  _radioSelected = value;
                                  answers.add({
                                    "QUES_ID": item.qUESID.toString(),
                                    "CORRECT_ANS": value.toString(),
                                  });
                                  setState(() {});
                                },
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
                FilledSelectButton(
                  text: 'Submit',
                  onPressed: () {
                    withViewModel<QuizQuestionsModel>(context, (
                      viewModel,
                    ) async {
                      viewModel.submitQuizApi(
                        widget.quizId!,
                        answers,
                      );
                    });
                  },
                  buttonTextStyles: TextStyle(),
                ),
                SizedBox(height: 10),
              ],
            ),
          );
        },
      ),
    );
  }
}
