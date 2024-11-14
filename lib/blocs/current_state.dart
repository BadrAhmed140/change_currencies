part of 'current_cubit.dart';

@immutable
abstract class CurrentState {}

class CurrentInitial extends CurrentState{}
class SuccessState extends CurrentState{}
class LoadingState extends CurrentState{}
class ErrorState extends CurrentState{}
class DropDownValueState1 extends CurrentState{}
class DropDownValueState2 extends CurrentState{}
class DropDownResetState extends CurrentState{}

