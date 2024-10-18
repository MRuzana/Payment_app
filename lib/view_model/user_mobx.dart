import 'dart:math';

import 'package:mobx/mobx.dart';
import 'package:payment_app/model/user_model.dart';
import 'package:payment_app/model/visitor_model.dart';
import 'package:payment_app/services/user_service.dart';

part 'user_mobx.g.dart';


class UserMobx = _UserMobx with _$UserMobx;

abstract class _UserMobx with Store{
  final UserService _userService = UserService();

  @observable
  ObservableList<UserModel>users = ObservableList<UserModel>();
  @observable
  ObservableList<VisitorModel>visitors = ObservableList<VisitorModel>();

  @observable
  UserModel? currentUser;
  @observable
  bool isLoading = false;
  @observable
  String? errorMessage;
  @observable
  String enteredAmount = '2500';
  @observable
  String? paymentMethod;

  @action
  Future<void> fetchUser() async{
   isLoading = true; // Set loading to true
   errorMessage = null;
     try {
      final fetchedUsers = await _userService.fetchUser();
      users = ObservableList.of(fetchedUsers);

       if (users.isNotEmpty) {
      // Select a random user from the list
      final randomIndex = Random().nextInt(users.length);
      currentUser = users[randomIndex];
   
    }
    } catch (error) {
      errorMessage = 'Failed to fetch users: $error';
    } finally {
      isLoading = false;
    }
  }

  @action
  void clearData() {
    enteredAmount = '2500';
    paymentMethod = null;
    visitors.clear();

  }

  @action
  void updateAmount(String newAmount){
    if (int.parse(newAmount)<=2500 && int.parse(newAmount)>=0) {
      enteredAmount = newAmount;
    }
  }
  @action
  void updatePaymentMethod(String method) {
    paymentMethod = method;
  }

  @action
  void addVisitor() {
 
  double amount = 1000; 
  final newVisitor = VisitorModel(visitorName: 'Visitor ${visitors.length + 1}', amount: amount);
  visitors.add(newVisitor);
  }
}