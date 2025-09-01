// ignore_for_file: must_be_immutable
import 'package:flutter/material.dart';
import 'package:flutter/services.dart'; 
import 'package:hrsummit/utils/colors.dart';
import 'package:hrsummit/utils/helper.dart';
import 'package:hrsummit/utils/loader.dart';
import 'package:hrsummit/utils/viewModel.dart'; 
 
 
class MyAppBackGroundVM<VIEW_MODEL extends ViewModel> extends StatefulWidget {
  final Widget child;

  const MyAppBackGroundVM({
    required this.child,
    super.key,
  });

  @override
  State<MyAppBackGroundVM<VIEW_MODEL>> createState() =>
      _MyAppBackGroundVMState<VIEW_MODEL>();
}

class _MyAppBackGroundVMState<VIEW_MODEL extends ViewModel>
    extends State<MyAppBackGroundVM<VIEW_MODEL>> {
  @override
  void initState() {
    super.initState();
    withViewModel<VIEW_MODEL>(context, (viewModel) {
      viewModel.onError = viewModel.onError ??
          (String? msg) {
            if (msg != null) showFlutterToast(message: msg);
          };
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.dark.copyWith(
        statusBarColor: Colors.white,
      ),
      child: SafeArea(
        child: Stack(
          alignment: Alignment.center,
          children: [
            Container( 
              height: double.infinity,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Mytheme.white
                // image: DecorationImage(image: AssetImage(bgImage), fit: BoxFit.cover),
              ), 
              child: widget.child,
            ),
            
            LoadingIndicatorConsumer<VIEW_MODEL>(),
          ],
        ),
      ),
    );
  }
}
