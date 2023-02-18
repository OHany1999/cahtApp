import 'package:flutter/material.dart';

void showLoading(String message, BuildContext context) {
  showDialog(
    //ده يخلي الشاشة دي متقفلش ابدا
    barrierDismissible: false,
      context: context,
      builder: (context) => Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: AlertDialog(
              actions: [
                Text(message),
                CircularProgressIndicator(),
              ],
            ),
          )
        )
        );
}

void showMessage(
    String message,
    BuildContext context
    ,String posBtn,
    VoidCallback posAction,
    {
      String? negBtn,
      VoidCallback? negAction,
    }
    ){
  showDialog(context: context, builder: (context){
    List<Widget>actions=[
      TextButton(onPressed: posAction, child: Text(posBtn)),
    ];
    if(negBtn != null){
      actions.add(TextButton(onPressed: negAction, child: Text(negBtn)));
    }
    return AlertDialog(
      title: Text(message),
      actions: actions,
    );
  });
}
void hideLoading(BuildContext context){
Navigator.pop(context);
}
