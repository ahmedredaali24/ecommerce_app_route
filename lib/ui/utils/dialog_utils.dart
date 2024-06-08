import 'package:e_commerce_route/ui/utils/my_colors.dart';
import 'package:flutter/material.dart';

class DialogUtils {
  static void showLoading(
      {required BuildContext context,
      required String massage,
      bool isDismissible = true}) {
    showDialog(
        barrierDismissible: isDismissible,
        context: context,
        builder: (context) {
          return AlertDialog(
            content: Row(
              children: [
                const CircularProgressIndicator(
                  color: AppColors.primaryColor,
                ),
                const SizedBox(
                  width: 15,
                ),
                Text(massage)
              ],
            ),
          );
        });
  }

  static void hideLoading(BuildContext context) {
    Navigator.pop(context);
  }

  static void showMessage(
      {required BuildContext context,
      bool isDismissible = false,
      required String massage,
      String? title,
      String? posActionName,
      Function? posAction,
      String? nagActionName,
      Function? nagAction}) {
    List<Widget> actions = [];
    if (posActionName != null) {
      actions.add(
        TextButton(
            onPressed: () {
              Navigator.pop(context);
              if (posAction != null) {
                posAction.call(context);
              }
              // posAction?.call();
            },
            child: Text(posActionName)),
      );
    }
    if (nagActionName != null) {
      actions.add(
        TextButton(
            onPressed: () {
              Navigator.pop(context);
              // if(nagAction!=null){
              //    nagAction.call();
              // }
              nagAction?.call();
            },
            child: Text(nagActionName)),
      );
    }
    showDialog(
        barrierDismissible: isDismissible,
        context: context,
        builder: (context) {
          return AlertDialog(
            content: Text(massage),
            title: Text(title ?? ""),
            actions: actions,
          );
        });
  }
}
