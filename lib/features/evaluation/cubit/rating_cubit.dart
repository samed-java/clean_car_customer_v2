import 'package:bloc/bloc.dart';
import 'package:clean_car_customer_v2/features/evaluation/data/model/req/rating_req_model.dart';
import 'package:clean_car_customer_v2/features/evaluation/data/repo/rating_repo.dart';
import 'package:clean_car_customer_v2/locator.dart';
import 'package:clean_car_customer_v2/utils/errors/base_error_handler.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';

import '../../../utils/snacks/snacks.dart';

part 'rating_state.dart';

class RatingCubit extends Cubit<RatingState> {
  RatingCubit(this.reservationId) : super(RatingInitial());

  final String reservationId;
  int score = 5;
  TextEditingController commentController = TextEditingController();

  void rate(){
    ErrorHandler(progressAction: () async {
      var result = await locator.get<RatingRepository>().send(RatingReqModel(
        reservationId: reservationId,
        rating: score.toString(),
        comment: commentController.text
      ));
      emit(RatingSuccess());
    },
        socketExceptionAction: (e) {
          emit(RatingFail());
          Snacks.showCustomSnack(message: "Connection error",isSucces: false);
        }, otherErrorAction: (e, s) {
          print(e);
          print(s);
          emit(RatingFail());
          Snacks.showCustomSnack(message: "Unknown error occured",isSucces: false);

        },
    dataIsNullErrorAction: (e) {
      emit(RatingFail());
      Snacks.showCustomSnack(message: "Unknown error occured",isSucces: false);
    },
      notSuccessErrorAction: (e) {
      emit(RatingFail());
      Snacks.showCustomSnack(message: "Fail",isSucces: false);
    },

      responseBodyIsNullErrorAction: (e) {
      emit(RatingFail());
      Snacks.showCustomSnack(message: "Unknown error occured",isSucces: false);
    },
    ).execute();
  }
}
