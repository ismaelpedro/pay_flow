import 'package:mobx/mobx.dart';

part 'home_store.g.dart';

class HomeStore = HomeStoreBase with _$HomeStore;

abstract class HomeStoreBase with Store {
  @observable
  int currentIndex = 0;

  @action
  void setIndex(int newIndex) => currentIndex = newIndex;

  @observable
  bool isLoading = false;
}
