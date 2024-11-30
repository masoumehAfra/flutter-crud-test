import 'package:flutter/material.dart';
import '../../../../config/app_const_size/app_space.dart';

class RegisterButton extends StatelessWidget {
  final bool isLoading;
  final VoidCallback? onPressed;

  const RegisterButton(
      {super.key, required this.isLoading, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 40,
        width: 180,
        child: TextButton(
          style: ButtonStyle(
            padding: const WidgetStatePropertyAll(
                EdgeInsets.symmetric(horizontal: CrudTestSpace.margin14)),
            backgroundColor: const WidgetStatePropertyAll(Colors.blue),
            minimumSize: const WidgetStatePropertyAll(Size(0, 0)),
            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
            shape: WidgetStatePropertyAll(
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(4))),
          ),
          onPressed: isLoading ? () {} : onPressed,
          child: isLoading
              ? _loadingWidget(context)
              : const Text("Register",
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w400)),
        ));
  }

  _loadingWidget(BuildContext context) {
    return const SizedBox(
      width: 20,
      height: 20,
      child: CircularProgressIndicator(
        strokeWidth: 2,
        color: Colors.white,
      ),
    );
  }
}
