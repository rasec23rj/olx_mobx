import 'package:mobx/mobx.dart';
import 'package:olx_mobx/models/user_model.dart';
import 'package:olx_mobx/repositories/user_repository.dart';
part 'session_store_user.g.dart';

class SessionStoreUser = _SessionStoreUserBase with _$SessionStoreUser;

abstract class _SessionStoreUserBase with Store {
  _SessionStoreUserBase() {
    getCurrentUser();
  }

  @observable
  UserModel user = UserModel(name: '', email: '', celular: '');

  @action
  void setUser(UserModel value) => user = value;

  @computed
  bool get isLoggedIn => validUser;

  @observable
  bool validUser = false;

  Future<void> getCurrentUser() async {
    final user = await UserRepository().currentUser();
    if (user.name.isNotEmpty || user.name != '') {
      validUser = true;
    } else {
      validUser = false;
    }

    setUser(user);
  }
}
