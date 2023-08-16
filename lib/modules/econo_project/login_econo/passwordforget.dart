

import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:firstflutterproject/modules/econo_project/login_econo/login_cubit/cubit.dart';
import 'package:firstflutterproject/modules/econo_project/login_econo/login_cubit/states.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../Text1.dart';
import '../../../constant.dart';
import 'code.dart';

class passwordForget extends StatelessWidget {
  var emailcontroller=TextEditingController();
  var formkay =GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (BuildContext context) =>ELoginCubit(),
        child: BlocConsumer<ELoginCubit,ELoginSates> (
            listener:(context,state){
              if(state is ForgetSuccessState){
                Navigator.push(context,
                  MaterialPageRoute(builder: (context) => code(email: emailcontroller.text)),);
                
              }
              
              
            },
            builder:(context,state) {
              return

                Scaffold(
                    body: Container(
                      decoration: BoxDecoration(
                          image: DecorationImage(image: AssetImage('assets/images/12.png'),
                              fit: BoxFit.cover)
                      ),
                      child: ListView(
                          children:[ Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Form(
                              key: formkay,
                              child: Column(children: [
                                SizedBox(height: 200,),
                                Text1(text: "Find your account",size: 28,color: Colors.yellow[700],),
                                SizedBox(height: 8,),
                                Center(
                                  child: Padding(
                                    padding: const EdgeInsets.all(20.0),
                                    child: Text1(text:"no worries , we'll send you reset instructions",
                                      fontWeight: FontWeight.w300,),
                                  ),
                                ),
                                SizedBox(height: 20,),
                                DefaultTextaField(hint: 'enter the email',
                                  controller:emailcontroller,
                                  icon: Icons.person,
                                  color: Colors.grey[300],
                                  color1: Color(0xFF439A97),
                                  size: 18,
                                  validate1: ( value){
                                    if(value==null ||value.isEmpty){ return 'please enter your email';}
                                    return null;

                                  },),
                                SizedBox(height: 40,),
                                ConditionalBuilder(
                                  condition: state is! ForgetLoadingState,
                                  builder:(context)=> DefaultButton(text: 'Reset password',s: 25,
                                    onTap: (){

                                      if(formkay.currentState!.validate()) {

                                        ELoginCubit.get(context).forgetpaasswordc(
                                            email: emailcontroller.text,
                                        );

                                      };},
                                    color: Color(0xFF439A97),w: 200,h: 50,),
                                fallback: (context)=>Center(child: CircularProgressIndicator(),),
                                )
                              ],),
                            ),
                          ),
                          ] ),


                    )
                );

            } ));
  }
}
