

import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:firstflutterproject/layout/home_lyout/home_lyout.dart';
import 'package:firstflutterproject/modules/econo_project/login_econo/login_cubit/states.dart';
import 'package:firstflutterproject/modules/econo_project/sign_up/sign_up.dart';
import 'package:firstflutterproject/shared/components/constants.dart';
import 'package:firstflutterproject/shared/network/local/cache_helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../Text1.dart';
import '../../../constant.dart';
import '../../../layout/home_lyout/cubite/cubite.dart';
import '../add_product/add_product.dart';
import 'login_cubit/cubit.dart';
import 'passwordforget.dart';

class sign extends StatelessWidget {
  bool passwordvisibale=false;
  var emailcontroller=TextEditingController();
  var passwordcontroller=TextEditingController();
  var formkay =GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) =>ELoginCubit(),
      child: BlocConsumer<ELoginCubit,ELoginSates> (
          listener:(context,state){
            if (state is LoginSuccessState) {
              if (state.loginModel.status=='success') {

                CacheHelper.saveData(key: 'password', value: passwordcontroller.text);
                print(state.loginModel.token);
                CacheHelper.saveData(key: 'token', value: state.loginModel.token.toString()).then((value) {
                  print ('save token');
                  token=state.loginModel.token.toString();
                  password1= passwordcontroller.text;
                  Navigator.push(context,MaterialPageRoute(builder: (context) => HomeLyoutScreen(),));
               //  token=CachHelper.gettoken(key: 'token');

                });
              }
              else
                print(state.loginModel.status);
            }},
          builder:(context,state) {
            return Scaffold(

              backgroundColor: Colors.transparent,
              body: SingleChildScrollView(
                child: Container(
                  constraints: BoxConstraints(),
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('images/logen.jpg'),
                          fit: BoxFit.cover)
                  ),

                  child: Padding(
                    padding: const EdgeInsets.only(top: 400.0),
                    child: Container(height: 480,


                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Form(
                          key: formkay,
                          child: Column(
                              children: [


                                Text1(text: 'Login',
                                  color: Color(0xFF439A97),
                                  fontWeight: FontWeight.bold,
                                  size: 35,),
                                SizedBox(height: 20,),

                                DefaultTextaField(
                                  hint: 'Enter Your Email',
                                  icon: Icons.person,
                                  color: Colors.grey[300],
                                  controller: emailcontroller,
                                  color1: Color(0xFF439A97),
                                  size: 18,
                                  validate1: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'please enter your email';
                                    }
                                    return null;
                                  },),


                                SizedBox(height: 10,),
                                DefaultTextaField(hint: 'enter your password',
                                  // icon: Icons.lock,
                                  color: Colors.grey[300],
                                  controller: passwordcontroller,
                                  color1: Color(0xFF439A97),
                                  size: 18,
                                  // obscure: true,
                                  validate1: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'please enter your password';
                                    }
                                    return null;
                                  },
                                  obscure:  ELoginCubit.get(context).ispassword,
                                  suffixPressed: (){
                                    ELoginCubit.get(context).changpassword();
                                  },
                                  type: TextInputType.visiblePassword,
                                  suffix: ELoginCubit.get(context).suffix,

                                ),

                                SizedBox(height: 25,),
                                ConditionalBuilder(
                                  condition: state is! LoginLoadingState,
                                 builder:(context)=> DefaultButton(text: 'LOGIN',
                                      color: Color(0xFF439A97), s: 25,r: 30,
                                      onTap: () {
                                        if (formkay.currentState!.validate()) {
                                          ELoginCubit.get(context).userlogin(
                                              email: emailcontroller.text,
                                              password: passwordcontroller.text,
                                            context: context
                                          );

                                          print('yas');
                                        };
                                      }),
                                  fallback: (context)=>Center(child: CircularProgressIndicator(),),
                                ),

                                SizedBox(height: 15),

                                Column(
                                  children: [
                                    Row(
//                                crossAxisAlignment: CrossAxisAlignment.start,

                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        textbutton(text: 'forget password?',
                                          color: Color(0xFF085F63),
                                          onTap: () {
                                            Navigator.push(context,
                                              MaterialPageRoute(builder: (context) =>
                                                  passwordForget()),);

                                            return print('sign ');
                                          },),
                                      ],
                                    ),




                                    Row(
                                      children: [
                                        Text1(text: "Don't You Have an account?",
                                            fontWeight: FontWeight.w300,
                                            size: 15,
                                            color: Color(0xFF000000)),
                                        textbutton(text: 'Sign Up ',
                                          color: Color(0xFF085F63),
                                          onTap: () {
                                            Navigator.push(context,
                                              MaterialPageRoute(builder: (context) =>
                                                  SigenUp()),);
                                            return print('sign ');
                                          },),
                                      ],
                                    ),],),


//439A97

                              ]),
                        ),
                      ),

                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(topLeft: Radius
                              .circular(30), topRight: Radius.circular(30))
                      ),

                    ),
                  ),
                ),
              ),

            );
          }),
    );
  }
}
