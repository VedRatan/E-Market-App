import 'package:emarket/common/widgets/custom_button.dart';
import 'package:emarket/common/widgets/custom_text_field.dart';
import 'package:emarket/constants/global_variables.dart';
import 'package:emarket/features/auth/services/auth_service.dart';
import 'package:flutter/material.dart';

enum Auth{
  signin,
  signup,
}

class AuthScreen extends StatefulWidget {
  static const String routeName = '/auth-screen';
  const AuthScreen({Key? key}) : super(key: key);
  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  Auth _auth = Auth.signup;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final _signupFormKey = GlobalKey<FormState>();
  final _signinFormKey = GlobalKey<FormState>();
  final AuthService authService = AuthService();
  
  @override
  void dispose() {
    // TODO: implement dispose
    _emailController.dispose();
    _passwordController.dispose();
    _nameController.dispose();
  }

  void signUpUser(){
    authService.signUpUser(context: context,
        email: _emailController.text,
        password: _passwordController.text,
        name: _nameController.text);
  }

  void signInUser(){
    authService.signInUser(context: context,
        email: _emailController.text,
        password: _passwordController.text,);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: GlobalVariables.greyBackgroundCOlor,
      body: SafeArea(child: Padding(
        padding: EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Welcome',
              style: TextStyle(fontWeight: FontWeight.w500,
              fontSize: 22),
            ),

            ListTile(
              tileColor: _auth == Auth.signup?GlobalVariables.backgroundColor:GlobalVariables.greyBackgroundCOlor,
              title: const Text(
                'Create Account',
                style: TextStyle(
                  fontWeight:  FontWeight.bold
                ),
              ),
              leading: Radio(
                activeColor: GlobalVariables.secondaryColor,
                onChanged: (Auth? auth) {
                  setState(() {
                    _auth = auth!;
                  });
                },
               value: Auth.signup,
                groupValue: _auth,
              ),
            ),

            if(_auth == Auth.signup)
              Container(
                padding: const EdgeInsets.all(8),
                color: GlobalVariables.backgroundColor,
                child: Form(
                      key:   _signupFormKey,
                    child: Column(
                        children: [
                          CustomTextField(controller: _nameController,
                              hintText: "Name"),
                          SizedBox(height: 10,),
                          CustomTextField(controller: _emailController,
                              hintText: "Email"),
                          SizedBox(height: 10,),
                          CustomTextField(controller: _passwordController,
                              hintText: "Password"),
                          SizedBox(height: 10,),
                          CustomButton(hinttext: 'SignUp',
                          color: GlobalVariables.secondaryColor,
                              onTap: (){
                                  if(_signupFormKey.currentState!.validate()){
                                    signUpUser();
                                  }
                          })
                        ],
                    ),
                    ),
              ),


            ListTile(
              tileColor: _auth == Auth.signin?GlobalVariables.backgroundColor:GlobalVariables.greyBackgroundCOlor,
              title: const Text(
                'Sign-In',
                style: TextStyle(
                    fontWeight:  FontWeight.bold
                ),
              ),
              leading: Radio(
                activeColor: GlobalVariables.secondaryColor,
                onChanged: (Auth? auth) {
                  setState(() {
                    _auth = auth!;
                  });
                },
                value: Auth.signin,
                groupValue: _auth,
              ),
            ),
            if(_auth == Auth.signin)
              Container(
                padding: const EdgeInsets.all(8),
                color: GlobalVariables.backgroundColor,
                child: Form(
                  key:   _signinFormKey,
                  child: Column(
                    children: [
                      CustomTextField(controller: _emailController,
                          hintText: "Email"),
                      SizedBox(height: 10,),
                      CustomTextField(controller: _passwordController,
                          hintText: "Password"),
                      SizedBox(height: 10,),
                      CustomButton(color: GlobalVariables.secondaryColor,hinttext: 'SignIn', onTap: (){
                            if(_signinFormKey.currentState!.validate()) {
                              signInUser();
                            }
                      })
                    ],
                  ),
                ),
              ),

          ],
        ),
      )),
    );
  }
}
