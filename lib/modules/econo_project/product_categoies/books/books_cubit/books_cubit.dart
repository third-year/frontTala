
import 'package:bloc/bloc.dart';
import 'package:firstflutterproject/constant.dart';
import 'package:firstflutterproject/layout/home_lyout/cubite/cubite.dart';
import 'package:firstflutterproject/layout/home_lyout/cubite/states.dart';
import 'package:firstflutterproject/models/econo_app/home_model.dart';
import 'package:firstflutterproject/modules/econo_project/product_categoies/books/books_screen.dart';
import 'package:firstflutterproject/shared/components/constants.dart';
import 'package:firstflutterproject/shared/network/remote/dio_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../models/econo_app/prod_cate_model.dart';
import '../../../../../shared/network/end_points.dart';
import 'books_states.dart';

class BooksCubite extends Cubit<BooksStates> {
  BooksCubite() : super(BooksInitialState());

  static BooksCubite get(context) => BlocProvider.of(context);

  ProCatModel ? procatmodel;

  void getBooksdata() {
    emit(BooksLodingHome());
    DioHelper.getData(
      url: '$PROCAT=books',
      token: 'Bearer $token',
    ).then((value) {
      procatmodel = ProCatModel.fromjson(value.data);
      printfulltext(procatmodel!.data!.resultProducts![0].name.toString());
      emit(BooksSuccessHome());
    }).catchError((error) {
      print(error.toString());
      emit(BooksErrorHome());
    });
  }
}