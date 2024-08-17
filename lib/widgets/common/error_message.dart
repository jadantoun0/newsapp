import 'dart:async';
import 'package:flutter/material.dart';

Future<void> showErrorMessage({
  required BuildContext context,
  required String content,
}) {
  return showGeneralDialog<void>(
    context: context,
    barrierDismissible: true,
    transitionDuration: const Duration(milliseconds: 500),
    barrierLabel: MaterialLocalizations.of(context).alertDialogLabel,
    barrierColor: Colors.black.withOpacity(0.5),
    pageBuilder: (context, animation, secondaryAnimation) {
      return ErrorMessageDialog(
        content: content,
      );
    },
    transitionBuilder: (context, animation, secondaryAnimation, child) {
      return SlideTransition(
        position: CurvedAnimation(
          parent: animation,
          curve: Curves.easeOut,
        ).drive(
          Tween<Offset>(
            begin: const Offset(0, -1.0),
            end: Offset.zero,
          ),
        ),
        child: child,
      );
    },
  );
}

class ErrorMessageDialog extends StatefulWidget {
  final String content;

  const ErrorMessageDialog({
    super.key,
    required this.content,
  });

  @override
  State<ErrorMessageDialog> createState() => _ErrorMessageDialogState();
}

class _ErrorMessageDialogState extends State<ErrorMessageDialog> {
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _timer = Timer(const Duration(seconds: 3), () {
      if (mounted) {
        Navigator.pop(context);
      }
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return Center(
      child: Column(
        children: [
          Container(
            width: width,
            color: Colors.red,
            child: SafeArea(
              bottom: false,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(Icons.warning, color: Colors.white),
                        const SizedBox(width: 5),
                        Expanded(
                          child: Text(
                            widget.content,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
