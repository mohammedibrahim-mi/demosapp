import 'package:demosapp/Custom/images.dart';
import 'package:demosapp/Login/LoginController.dart';
import 'package:demosapp/Custom/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:provider/provider.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {

  LoginController loginctrl = LoginController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    Future.delayed(Duration.zero).whenComplete(() {
      // loginctrl.login("", "","dsfdggr", 'fb', "ios", true,context);
    });


  }


  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => LoginController(),
      child: Consumer<LoginController>(
        builder: (context,model,child) {
          loginctrl = model;
          Future.delayed(Duration.zero).whenComplete(() {
            if (model.isLoading) {
              context.loaderOverlay.show();
            } else {
              context.loaderOverlay.hide();
            }
          });
          return Scaffold(
            body: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              color: Appcolors.bgHeader,
              child: Center(
                child: Form(
                  key: model.loginForm,
                  child: Column(

                    children: [

                      SizedBox(height: 50,),

                      SvgPicture.asset(appimage.welcome,height: 250,width: 250,),
                      SizedBox(height: 50,),

                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: TextFormField(
                          controller: model.emailText,
                          focusNode: model.emailNode,
                          textInputAction: TextInputAction.next,
                          keyboardType: TextInputType.emailAddress,
                          style: const TextStyle(
                            fontSize: 15,
                            color: Colors.black
                          ),
                          cursorColor: Colors.red,
                          validator: (email) {
                            if (email!.isEmpty) {
                              return "Email is Empty";
                            }
                            return null;
                          },
                          decoration:  InputDecoration(
                            fillColor: Colors.grey.shade50,
                            filled: true,
                            hintText: "Email",
                            hintStyle: TextStyle(
                              fontSize: 14,
                              color: Colors.grey
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              borderSide: BorderSide(
                                color: Colors.grey,
                              )
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              borderSide: BorderSide(
                                  color: Colors.grey,
                                  width: 0.8),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              borderSide: BorderSide(
                                  color: Colors.grey,
                                  width: 0.8),
                            ),

                              errorBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                                borderSide: BorderSide(
                                    color: Colors.grey,
                                    width: 0.8),
                              ),
                              focusedErrorBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                                borderSide: BorderSide(
                                    color: Colors.grey,
                                    width: 0.8),
                              ),
                              contentPadding: const EdgeInsets.symmetric(
                                  vertical: 0, horizontal: 10.0)
                          ),

                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: TextFormField(

                          controller: model.passText,
                          focusNode: model.passNode,
                          textInputAction: TextInputAction.next,
                          keyboardType: TextInputType.emailAddress,
                          style: const TextStyle(
                              fontSize: 15,
                              color: Colors.black
                          ),
                          cursorColor: Colors.red,
                          validator: (pass) {
                            if (pass!.isEmpty) {
                              return "Password is Empty";
                            }
                            return null;
                          },
                          decoration:  InputDecoration(
                              fillColor: Colors.grey.shade50,
                              filled: true,
                              hintText: "Password",
                              hintStyle: TextStyle(
                                  fontSize: 14,
                                  color: Colors.grey
                              ),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                  borderSide: BorderSide(
                                    color: Colors.grey,
                                  )
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                                borderSide: BorderSide(
                                    color: Colors.grey,
                                    width: 0.8),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                                borderSide: BorderSide(
                                    color: Colors.grey,
                                    width: 0.8),
                              ),

                              errorBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                                borderSide: const BorderSide(
                                    color: Colors.grey,
                                    width: 0.8),
                              ),
                              focusedErrorBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                                borderSide: const BorderSide(
                                    color: Colors.grey,
                                    width: 0.8),
                              ),
                              contentPadding: const EdgeInsets.symmetric(
                                  vertical: 0, horizontal: 10.0)
                          ),

                        ),
                      ),

                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: GestureDetector(
                          onTap: (){
                        if (model.loginForm.currentState!.validate()) {

                         model.login(model.emailText.text, model.passText.text,
                           "dsfdggr", 'fb', "ios", true,context);
                          }
                        else{
                          print("dddddd");
                        }
                          },
                          child: Container(
                            height: 40,
                              width: 85,
                              color: Colors.grey,
                              child: Center(child: Text("Login"))),
                        ),
                      )

                    ],
                  ),
                ),
              ),
            ),
          );
        },


      ),
    );
  }
}
