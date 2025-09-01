import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hrsummit/data/model/archived_quiz_model_repo.dart';
import 'package:hrsummit/state/archiveQuizModel.dart';
import 'package:hrsummit/ui/quiz/quiz_list.dart';
import 'package:hrsummit/ui/quiz/quiz_screen.dart';
import 'package:hrsummit/utils/helper.dart';
import 'package:provider/provider.dart';

import '../../utils/app_constants.dart';
import '../../utils/header_widget.dart';
import '../../utils/viewModel.dart';
import '../../widgets/commonBG.dart';
import '../widgets/homeWidgets.dart';
import '../widgets/quizOptionsWidget.dart';

class ArchiveQuesScreen extends StatefulWidget {
  static const String route = '/archive_quiz';

  ArchiveQuesScreen({super.key,this.quizId});
  String? quizId;

  @override
  State<ArchiveQuesScreen> createState() => _ArchiveQuesScreenState();
}

class _ArchiveQuesScreenState extends State<ArchiveQuesScreen> {
  int? _radioSelected ;
  int? _radioCorrected ;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final args = ModalRoute.of(context)?.settings.arguments as String?;
      setState(() {
        print(args);
        widget.quizId = args;
        print("quizId :: ${widget.quizId}");
      });

    });
    withViewModel<ArchiveQuizModel>(context, (viewModel) async {
      viewModel.archiveQuizApi(widget.quizId??"0");
    });
  }

  @override
  Widget build(BuildContext context) {
    return MyAppBackGroundVM<ArchiveQuizModel>(
        child: Consumer<ArchiveQuizModel>(
            builder: (context, provider, child) {
              return Scaffold(
                body: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    HeaderWidget(),
                    CommonAppbar(
                      title: "QUIZ",
                      onBack: () {
                        Helper.goToNext(QuizListScreen.route);
                      },
                    ),
                    Image.asset(quizQuestion),
                    SizedBox(height: 10),
                    Text(
                      "Questions & Answers",
                      style: TextStyle(
                        color: Colors.brown[900],
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                    SizedBox(height: 10),
                    Expanded(
                      child: ListView.builder(
                        scrollDirection: Axis.vertical,
                        itemCount: provider.upCTrainingResult.data != null ? provider.upCTrainingResult.data!.length:0,
                        itemBuilder: (context, index) {
                          final item = provider.upCTrainingResult.data![index];
                          print(item.cORRECTANS);

                          _radioSelected = int.parse(item.oPTEDANS!);
                          // _radioSelected =1;
                          _radioCorrected = int.parse(item.cORRECTANS!);
                          // _radioCorrected = 1;
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
                                  Text(
                                    "${index + 1}. ${item.qUESNAME ?? ''}",
                                    style: const TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold),
                                    maxLines: 3,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  const SizedBox(height: 8),
                                  QuizOptionsWidget(
                                    text: item.oPTION1,
                                    selectedOption: _radioSelected,
                                    correctOption: _radioCorrected,
                                    selectValue: (_radioSelected == 1 && _radioCorrected == 1)
                                        ? "OP"
                                        : (_radioSelected == 1)
                                        ? "O"
                                        : (_radioCorrected == 1)
                                        ? "P"
                                        : "",
                                    toggleable: false,
                                    onPressed: (value) {
                                      // _radioSelected = value;
                                      // setState(() {});
                                    },
                                  ),
                                  QuizOptionsWidget(
                                    text: item.oPTION2,
                                    selectedOption: _radioSelected,
                                    correctOption: _radioCorrected,
                                    selectValue:(_radioSelected == 2 && _radioCorrected == 2)
                                        ? "OP"
                                        : (_radioSelected == 2)
                                        ? "O"
                                        : (_radioCorrected == 2)
                                        ? "P"
                                        : "",
                                    toggleable: false,
                                    onPressed: (value) {
                                      // _radioSelected = value;
                                      // setState(() {});
                                    },
                                  ),
                                  QuizOptionsWidget(
                                    text: item.oPTION3,
                                    selectedOption: _radioSelected,
                                    correctOption: _radioCorrected,
                                    selectValue: (_radioSelected == 3 && _radioCorrected == 3)
                                        ? "OP"
                                        : (_radioSelected == 3)
                                        ? "O"
                                        : (_radioCorrected == 3)
                                        ? "P"
                                        : "",
                                    toggleable: false,
                                    onPressed: (value) {
                                      // _radioSelected = value;
                                      // setState(() {});
                                    },
                                  ),
                                  QuizOptionsWidget(
                                    text: item.oPTION4,
                                    selectedOption: _radioSelected,
                                    correctOption: _radioCorrected,
                                    selectValue: (_radioSelected == 4 && _radioCorrected == 4)
                                        ? "OP"
                                        : (_radioSelected == 4)
                                        ? "O"
                                        : (_radioCorrected == 4)
                                        ? "P"
                                        : "",
                                    toggleable: false,
                                    onPressed: (value) {
                                      // _radioSelected = value;
                                      // setState(() {});
                                    },
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    SizedBox(height: 10),
                  ],
                ),
              );
            }
        )
    );
  }
}
