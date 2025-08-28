import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hrsummit/utils/colors.dart';
import 'package:hrsummit/utils/viewModel.dart';  
import 'package:provider/provider.dart';


class LoadingIndicatorConsumer<V extends ViewModel> extends StatelessWidget {
  const LoadingIndicatorConsumer({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      child: Selector<V, bool>(
        selector: (_, V state) => state.isLoading,
        builder: (_, bool isLoading, __) => isLoading
            ? Container(               
                color: Colors.white.withOpacity(0.7),
                child: const Center(child: LoadingIndicator()),
              )
            : const SizedBox.shrink(),
      ),
    );
  }
}


class LoadingIndicator extends StatelessWidget {
  const LoadingIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Mytheme.black,
        borderRadius: BorderRadius.circular(8),
      ), // Dialog background
      child: const CupertinoActivityIndicator(
        color: Mytheme.white,
      ),
    );
  }
}