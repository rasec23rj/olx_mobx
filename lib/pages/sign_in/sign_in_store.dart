import 'package:mobx/mobx.dart';
part 'sign_in_store.g.dart';

class SignInStore = _SignInStore with _$SignInStore;

abstract class _SignInStore with Store {
  @observable
  bool obscuretxt = true;

  @action
  bool setObscuretxt() {
    return obscuretxt = !obscuretxt;
  }
}
