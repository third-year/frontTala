import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:firstflutterproject/modules/econo_project/login_econo/login_cubit/states.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../Text1.dart';
import '../../../constant.dart';
import 'code.dart';
import 'login_cubit/cubit.dart';
import 'newpassword.dart';

class code extends StatelessWidget {
String email ;
  var codecontroller =TextEditingController();
  var formkay =GlobalKey<FormState>();
  code({
    required this.email
  });


  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (BuildContext context) =>ELoginCubit(),
        child: BlocConsumer<ELoginCubit,ELoginSates> (
        listener:(context,state){
      if(state is CodeSuccessState){
         Navigator.push(context,
           MaterialPageRoute(builder: (context) => newpassword(code1:codecontroller.text)),);
      }


    },
    builder:(context,state) {
    return Scaffold(
        body: Container(
          decoration: BoxDecoration(
              image: DecorationImage(image:  AssetImage('assets/images/12.png'),fit: BoxFit.cover)
          ),
          child: ListView(
              children:[ Padding(
                padding: const EdgeInsets.all(8.0),
                child: Form(
                  key: formkay,
                  child: Column(children: [
                    SizedBox(height: 200,),
                    Text1(text: "Password reset",size: 28,color: Colors.yellow,),
                    SizedBox(height: 30,),
                    Text1(text:'we sent a code to ',
                      fontWeight: FontWeight.w300,),
                    SizedBox(height: 20,),
                    DefaultTextaField(hint: 'Code*',icon: Icons.create_sharp,
                      controller:codecontroller,

                      color: Colors.grey[300],
                      color1: Color(0xFF439A97),

                      validate1:   ( value){
                        if(value==null ||value.isEmpty){ return 'please enter the code';}
                        return null;

                      },),
                    SizedBox(height: 30,),
                    ConditionalBuilder(
                      condition: state is! CodeLoadingState,
                      builder:(context)=> DefaultButton(text: 'Continue',s: 25,
                        onTap: (){
                        if(formkay.currentState!.validate()) {
                            ELoginCubit.get(context).codepaasswordc(
                              code:codecontroller.text);
                          };},
                        color: Color(0xFF439A97),w: 180,h: 50,),
                    fallback: (context)=>Center(child: CircularProgressIndicator(),),
                    ),
                    SizedBox(height: 10,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text1(text: "Didn't recieve the email?",fontWeight: FontWeight.w300,size: 18,),
                        textbutton(text: ' Click to resend',onTap: (){

                          ELoginCubit.get(context).forgetpaasswordc(email:email);

                          },
                                color: Colors.yellow,),

                      ],
                    )
                  ],),
                ),
              ),
              ]),



        ));
    }));
    }}
