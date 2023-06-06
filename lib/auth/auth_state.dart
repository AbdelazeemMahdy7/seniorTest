part of 'auth_cubit.dart';

abstract class AuthStates {}

class AuthInitial extends AuthStates {}

class LoginSuccessState extends AuthStates{}
class LoginFailureState extends AuthStates{
  final errorMessage;
  LoginFailureState(this.errorMessage);
}
class RegisterSuccessState extends AuthStates{}
class RegisterFailureState extends AuthStates{
  final errorMessage;
  RegisterFailureState(this.errorMessage);
}
