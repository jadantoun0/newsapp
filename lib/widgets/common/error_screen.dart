import 'package:flutter/material.dart';
import 'package:newsapp/utils/constants/constants.dart';
import 'package:newsapp/widgets/common/inkwell_with_opacity.dart';

class ErrorScreen extends StatefulWidget {
  final String errorMessage;
  final Function? onTap;
  const ErrorScreen({
    super.key,
    required this.errorMessage,
    this.onTap,
  });

  @override
  State<ErrorScreen> createState() => _ErrorScreenState();
}

class _ErrorScreenState extends State<ErrorScreen> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        children: [
          const SizedBox(height: 90),
          Image.asset(
            'assets/error.jpg',
            width: MediaQuery.of(context).size.width * .8,
          ),
          const Text(
            'Error!',
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 5),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Text(
              widget.errorMessage,
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(height: 20),
          if (widget.onTap != null)
            InkwellWithOpacity(
              onTap: () {
                widget.onTap!();
              },
              child: Container(
                height: 38,
                width: 110,
                margin: const EdgeInsets.only(bottom: 10),
                decoration: BoxDecoration(
                  color: mainColor,
                  borderRadius: BorderRadius.circular(5),
                ),
                child: const Center(
                  child: Text(
                    'Try again',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            )
        ],
      ),
    );
  }
}
