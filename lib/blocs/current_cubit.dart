import 'package:bloc/bloc.dart';
import 'package:change_currencies/modles/model_current.dart';
import 'package:change_currencies/service/dio_helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'current_state.dart';

class CurrentCubit extends Cubit<CurrentState> {
  CurrentCubit() : super(CurrentInitial());
  static CurrentCubit get(context) => BlocProvider.of(context);
  var itemss = [
    'EGP',
    'USD',

  ];
  CurrentModel ?currentModel;
  String dropdownValue1 = 'EGP';
  String dropdownValue2 = 'USD';
  var amount2 = TextEditingController();

  void DropDownValueFun1(String newValu) {
    dropdownValue1=newValu;
    emit(DropDownValueState1());
  }
  void DropDownValueFun2(String newValu) {
    dropdownValue2=newValu;
    emit(DropDownValueState2());
  }
  getAll({
    required String to,
    required String from,
    required int amount,
}) {
    emit(LoadingState());
    DioHelper.getData(
      query: {
        "from":from,"to":to,"amount":amount
      }
    ).then((value) {
      print('hello');
      print(value.data);

      currentModel= CurrentModel.fromJson(value.data);
      currentModel= CurrentModel.fromJson(value.data);
      currentModel= CurrentModel.fromJson(value.data);
      currentModel= CurrentModel.fromJson(value.data);

print("dd");
      emit(SuccessState());
    }).catchError((error) {
      print('error');
      print(error.toString());
      emit(ErrorState());
    });
  }
}
