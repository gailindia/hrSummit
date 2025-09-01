import 'dart:async';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

 
class ViewModel extends ChangeNotifier {
  /// Generic error message shown when an unexpected error occurs
  static const String genericErrorMessage = "Something went wrong, Please try again later";
  
  /// Error message shown when device ID update fails
  static const String deviceErrorMessage = "Device Id updating failed";

  /// Error message shown when network connection fails
  static const String networkErrorMessage = "Please check your internet connection";

  /// Error message shown when request times out
  static const String timeoutErrorMessage = "Request timed out. Please try again";

  bool _isLoading = false;
  bool _isMounted = true;
  String? _lastError;

  /// Current loading state of the view model
  bool get isLoading => _isLoading;

  /// Sets the loading state and notifies listeners if changed
  set isLoading(bool value) {
    if (_isLoading != value) {
      _isLoading = value;
      callNotify();
    }
  }

  /// Last error message that occurred
  String? get lastError => _lastError;

  /// Callback for handling error messages
  ValueChanged<String?>? onError;

  /// Wraps an API call with loading state management and error handling
  /// 
  /// This method:
  /// 1. Sets loading state to true before the API call
  /// 2. Executes the API call
  /// 3. Sets loading state to false after completion
  /// 4. Handles various types of errors with appropriate messages
  /// 
  /// [api] The async function to execute
  /// [showLoading] Whether to show loading state (defaults to true)
  /// [onSuccess] Optional callback for successful completion
  Future<void> callApi(
    AsyncCallback api, {
    bool showLoading = true,
    VoidCallback? onSuccess,
  }) async{
    if (isLoading) return;
    
    if (showLoading) {
      isLoading = true;
    }

    _lastError = null;
    await api().then((_) {
      if (showLoading) {
        isLoading = false;
      }
      onSuccess?.call();
    }).catchError((error, stackTrace) {
      if (showLoading) {
        isLoading = false;
      }
      
      String errorMessage;
      if (error is SocketException) {
        errorMessage = networkErrorMessage;
      } else if (error is FormatException) {
        errorMessage = "Invalid data format: ${error.message}";
      } else if (error is HttpException) {
        errorMessage = error.message;
      } else if (error is TimeoutException) {
        errorMessage = timeoutErrorMessage;
      } else {
        errorMessage = genericErrorMessage;
      }

      _lastError = errorMessage;
      onError?.call(errorMessage);

      if (kDebugMode) {
        print('Error in ViewModel: $error');
        print('Stack trace: $stackTrace');
      }
    });
  }
//  Future<void> callApi(
//   AsyncCallback api, {
//   bool showLoading = true,
//   VoidCallback? onSuccess,
//   Function(String)? onError,
// }) async {
//   bool localLoading = false; // 👈 local per-API loading

//   if (localLoading) return;
//   if (showLoading) localLoading = true;

//   _lastError = null;

//   try {
//     await api();
//     if (showLoading) localLoading = false;
//     onSuccess?.call();
//   } catch (error, stackTrace) {
//     if (showLoading) localLoading = false;

//     String errorMessage;
//     if (error is SocketException) {
//       errorMessage = networkErrorMessage;
//     } else if (error is FormatException) {
//       errorMessage = "Invalid data format: ${error.message}";
//     } else if (error is HttpException) {
//       errorMessage = error.message;
//     } else if (error is TimeoutException) {
//       errorMessage = timeoutErrorMessage;
//     } else {
//       errorMessage = genericErrorMessage;
//     }

//     _lastError = errorMessage;
//     onError?.call(errorMessage);

//     if (kDebugMode) {
//       print('Error in ViewModel: $error');
//       print('Stack trace: $stackTrace');
//     }
//   }
// }

  /// Safely notifies listeners if the view model is still mounted
  void callNotify() {
    if (_isMounted) {
      notifyListeners();
    }
  }

  /// Resets the state of the view model
  /// 
  /// This method:
  /// 1. Resets loading state to false
  /// 2. Clears last error
  /// 3. Calls subclass-specific reset logic
  /// 
  /// Subclasses should override [onReset] to implement their own reset logic
  void invalidate() {
    _isLoading = false;
    _lastError = null;
    onReset();
    callNotify();
  }

  /// Called when the view model is reset
  /// Override this method to implement custom reset logic
  @protected
  void onReset() {}

  @override
  void dispose() {
    _isMounted = false;
    super.dispose();
  }
}

/// Helper function to safely access a ViewModel instance from a BuildContext
/// 
/// This function ensures that the view model is accessed after the widget is built
/// and provides a convenient way to call methods on the view model.
/// 
/// Example usage:
/// ```dart
/// withViewModel<MyViewModel>(context, (viewModel) {
///   viewModel.fetchData();
/// });
/// ```
/// 
/// [context] The build context to get the view model from
/// [function] The function to execute with the view model
void withViewModel<VIEW_MODEL extends ViewModel>(
  BuildContext context,
  void Function(VIEW_MODEL viewModel) function,
) {
  WidgetsBinding.instance.addPostFrameCallback((_) {
    if (context.mounted) {
      final provider = Provider.of<VIEW_MODEL>(context, listen: false);
      function.call(provider);
    }
  });
}
