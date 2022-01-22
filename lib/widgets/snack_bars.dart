import 'package:covid_wallet_app/theme/values/colors.dart';
import 'package:flutter/material.dart';


class LoadingSnackBar extends SnackBar {
  LoadingSnackBar({Key? key,
    int duration = 60,
    required String text,
  }) : super(key: key,
    duration: Duration(seconds: duration),
    content: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(text,style: const TextStyle(color: colorTextSecondary),),
        const SizedBox(
          height: 20,
          width: 20,
          child: CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(colorTextSecondary),
          ),
        ),
      ],
    ),
  );
}

class SuccessSnackBar extends SnackBar {
  SuccessSnackBar({Key? key,
    required String text,
  }) : super(key: key,
    backgroundColor: colorSecondary,
    content: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Flexible(
            child: Text(
              text,
              style: const TextStyle(color: Colors.white),
            )),
        const Icon(
          Icons.check_circle_outline,
          color: Colors.white,
        )
      ],
    ),
  );
}

class ErrorSnackBar extends SnackBar {


  ErrorSnackBar({Key? key,
    required String text,
  }) : super(key: key,
    backgroundColor: colorError,
    duration: const Duration(seconds: 3),
    content: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Flexible(
            child: Text(
              text,
              style: const TextStyle(color: colorTextSecondary,),
            )),
        const Icon(Icons.error,color: colorTextSecondary,)
      ],
    ),
  );
}


showSuccessSnackBar({
  required BuildContext context,
  required String text,
}) {
  _showSnackBar(context, SuccessSnackBar(text: text));
}

showLoadingSnackBar({
  required BuildContext context,
  required String text,
}) {
  _showSnackBar(context,  LoadingSnackBar(text: text));
}

showErrorSnackBar({
  required BuildContext context,
  required String text,
}) {
  _showSnackBar(context,  ErrorSnackBar( text: text));
}


void _showSnackBar(BuildContext context,
    SnackBar snackBar) {
    ScaffoldMessenger.of(context)..hideCurrentSnackBar()..showSnackBar(snackBar);
}
