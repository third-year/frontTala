import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:firstflutterproject/constant.dart';
import 'package:firstflutterproject/modules/econo_project/profile/profile_cubit/profile_cubit.dart';
import 'package:firstflutterproject/modules/econo_project/profile/profile_cubit/profile_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EconoEditeProfileScreen extends StatelessWidget {
  var phonecontroller = TextEditingController();
  var fullnamecontroller = TextEditingController();
  var formkay = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProfileCubit, ProfileStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return ConditionalBuilder(
            condition:state is! ProfileEditeLoadingState,
            builder: (context) => Scaffold(
              appBar: AppBar(
                title: Text('EditeProfile'.toUpperCase(),
                    style: TextStyle(
                        fontSize: 30.0,
                        color: secondBackColor,
                        fontWeight: FontWeight.w500)),
                actions: [
                  Icon(
                    Icons.person,
                    color: secondBackColor,
                    size: 40.0,
                  )
                ],
                elevation: 0.0,
              ),
              body: Form(
                key: formkay,
                child: Center(
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Column(
                        children: [
                          // CircleAvatar(
                          //     radius: 100.0,
                          //     backgroundImage: NetworkImage(
                                  // ProfileCubit.get(context)
                                  //     .profilemodel!
                                  //     .user!
                                  //   .image
                                  //     .toString()
                               // ''     )
               //),
                          SizedBox(
                            height: 40.0,
                          ),
                          DefaultTextaField(
                            hint: 'FullName',
                            size: 26.0,
                            color: lightColor,
                            color1: Colors.white,
                            suffix: Icons.edit,
                            controller: fullnamecontroller,
                            validate1: (value) {
                              if (value == null || value.isEmpty) {
                                return 'please enter your new name';
                              }
                              return null;
                            },
                          ),
                          SizedBox(
                            height: 20.0,
                          ),
                          DefaultTextaField(
                            hint: 'Phone',
                            size: 26.0,
                            color: lightColor,
                            color1: Colors.white,
                            suffix: Icons.edit,
                            controller: phonecontroller,
                            validate1: (value) {
                              if (value == null || value.isEmpty) {
                                return 'enter your new phone';
                              }
                              return null;
                            },
                          ),
                          SizedBox(
                            height: 40.0,
                          ),
                          DefaultButton(
                              onTap: () {
                                if (formkay.currentState!.validate()) {
                                  ProfileCubit.get(context).update(
                                    phone: phonecontroller.text,
                                    fullName: fullnamecontroller.text,
                                    context: context
                                  );
                                }
                              },
                              text: 'edite'.toUpperCase(),
                              s: 20.0,
                              color: strongColor,
                              w: 250.0),
                          SizedBox(
                            height: 20,
                          ),
                          DefaultButton(
                              onTap: () {
                                ProfileCubit.get(context).toChangePass(context);
                              },
                              text: 'change Password'.toUpperCase(),
                              s: 20.0,
                              color: strongColor,
                              w: 250.0)
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
            fallback: (context) => Center(
                child: CircularProgressIndicator(
              color: strongColor,
            )),
          );
        });
  }
}
