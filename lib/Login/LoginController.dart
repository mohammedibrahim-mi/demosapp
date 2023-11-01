

import 'dart:convert';

import 'package:bouncing_widget/bouncing_widget.dart';
import 'package:elegant_notification/elegant_notification.dart';
import 'package:flutter/material.dart';

import 'Api.dart';

class LoginController extends ChangeNotifier {


  final emailText = TextEditingController();
  final passText = TextEditingController();
  final emailNode = FocusNode();
  final passNode = FocusNode();
  final loginForm = GlobalKey<FormState>();
  final provider = LoginApi();
  bool isLoading = false;
  loader(bool value) {
    isLoading = value;
    notifyListeners();
  }

  Future login(String email, String pass, String deviceId, String deviceToken,
      String platform, bool isTwofa,BuildContext context) async {
    loader(true);
    await provider.login(email, pass, deviceId, deviceToken, platform,).then(
        (value) async {

          final parsed = json.decode(value.toString());
          print(parsed.toString());
          print(parsed['success'].toString());
         //  ElegantNotification.success(
         //    title: Text(
         //   "Alert",
         //      style: TextStyle(
         //        color: Colors.black,
         //        fontFamily: 'medium',
         //        fontSize: 18,
         //      ),
         //    ),
         //    description: Text(
         //      parsed['message'].toString(),
         //      style: TextStyle(
         //        color: Colors.black,
         //        fontFamily: 'regular',
         //        fontSize: 16,
         //      ),
         //      maxLines: 10,
         //      overflow: TextOverflow.ellipsis,
         //    ),
         //    toastDuration: const Duration(seconds: 18),
         //    onDismiss: () async {
         //       // Navigator.pop(context);
         //      }
         //
         //      ,
         //    onProgressFinished: () async {
         // //     Navigator.pop(context);
         //    },
         //  ).show(context);
          showDialog(
              context: context,
              barrierDismissible: true,
              builder: (BuildContext newContext) {
                return Dialog(
                    backgroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5)),
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width,

                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 20),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              'Login'.toUpperCase(),

                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                                parsed['message'].toString()

                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Column(
                              mainAxisAlignment:
                              MainAxisAlignment.spaceBetween,
                              children: [

                                BouncingWidget(
                                  duration:
                                  const Duration(milliseconds: 50),
                                  scaleFactor: 0.5,
                                  onPressed: () {
                                Navigator.pop(context);
                                  },
                                  child: Container(
                                    margin: const EdgeInsets.symmetric(
                                        horizontal: 20.0),
                                    height: 50,
                                    decoration: const BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(5))),
                                    child: const Align(
                                      alignment: Alignment.center,
                                      child: Text(
                                        'close',

                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ));
              });


        }

    ).catchError(
        (e){
          print(e.toString());
          showDialog(
              context: context,
              barrierDismissible: true,
              builder: (BuildContext newContext) {
                return Dialog(
                    backgroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5)),
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width,

                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 20),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              'Login'.toUpperCase(),

                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                               e.toString()

                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Column(
                              mainAxisAlignment:
                              MainAxisAlignment.spaceBetween,
                              children: [

                                BouncingWidget(
                                  duration:
                                  const Duration(milliseconds: 50),
                                  scaleFactor: 0.5,
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: Container(
                                    margin: const EdgeInsets.symmetric(
                                        horizontal: 20.0),
                                    height: 50,
                                    decoration: const BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(5))),
                                    child: const Align(
                                      alignment: Alignment.center,
                                      child: Text(
                                        'close',

                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ));
              });
        }
    );

  }





}