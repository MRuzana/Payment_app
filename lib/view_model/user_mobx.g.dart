// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_mobx.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$UserMobx on _UserMobx, Store {
  late final _$usersAtom = Atom(name: '_UserMobx.users', context: context);

  @override
  ObservableList<UserModel> get users {
    _$usersAtom.reportRead();
    return super.users;
  }

  @override
  set users(ObservableList<UserModel> value) {
    _$usersAtom.reportWrite(value, super.users, () {
      super.users = value;
    });
  }

  late final _$visitorsAtom =
      Atom(name: '_UserMobx.visitors', context: context);

  @override
  ObservableList<VisitorModel> get visitors {
    _$visitorsAtom.reportRead();
    return super.visitors;
  }

  @override
  set visitors(ObservableList<VisitorModel> value) {
    _$visitorsAtom.reportWrite(value, super.visitors, () {
      super.visitors = value;
    });
  }

  late final _$currentUserAtom =
      Atom(name: '_UserMobx.currentUser', context: context);

  @override
  UserModel? get currentUser {
    _$currentUserAtom.reportRead();
    return super.currentUser;
  }

  @override
  set currentUser(UserModel? value) {
    _$currentUserAtom.reportWrite(value, super.currentUser, () {
      super.currentUser = value;
    });
  }

  late final _$isLoadingAtom =
      Atom(name: '_UserMobx.isLoading', context: context);

  @override
  bool get isLoading {
    _$isLoadingAtom.reportRead();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.reportWrite(value, super.isLoading, () {
      super.isLoading = value;
    });
  }

  late final _$errorMessageAtom =
      Atom(name: '_UserMobx.errorMessage', context: context);

  @override
  String? get errorMessage {
    _$errorMessageAtom.reportRead();
    return super.errorMessage;
  }

  @override
  set errorMessage(String? value) {
    _$errorMessageAtom.reportWrite(value, super.errorMessage, () {
      super.errorMessage = value;
    });
  }

  late final _$enteredAmountAtom =
      Atom(name: '_UserMobx.enteredAmount', context: context);

  @override
  String get enteredAmount {
    _$enteredAmountAtom.reportRead();
    return super.enteredAmount;
  }

  @override
  set enteredAmount(String value) {
    _$enteredAmountAtom.reportWrite(value, super.enteredAmount, () {
      super.enteredAmount = value;
    });
  }

  late final _$paymentMethodAtom =
      Atom(name: '_UserMobx.paymentMethod', context: context);

  @override
  String? get paymentMethod {
    _$paymentMethodAtom.reportRead();
    return super.paymentMethod;
  }

  @override
  set paymentMethod(String? value) {
    _$paymentMethodAtom.reportWrite(value, super.paymentMethod, () {
      super.paymentMethod = value;
    });
  }

  late final _$fetchUserAsyncAction =
      AsyncAction('_UserMobx.fetchUser', context: context);

  @override
  Future<void> fetchUser() {
    return _$fetchUserAsyncAction.run(() => super.fetchUser());
  }

  late final _$_UserMobxActionController =
      ActionController(name: '_UserMobx', context: context);

  @override
  void clearData() {
    final _$actionInfo =
        _$_UserMobxActionController.startAction(name: '_UserMobx.clearData');
    try {
      return super.clearData();
    } finally {
      _$_UserMobxActionController.endAction(_$actionInfo);
    }
  }

  @override
  void updateAmount(String newAmount) {
    final _$actionInfo =
        _$_UserMobxActionController.startAction(name: '_UserMobx.updateAmount');
    try {
      return super.updateAmount(newAmount);
    } finally {
      _$_UserMobxActionController.endAction(_$actionInfo);
    }
  }

  @override
  void updatePaymentMethod(String method) {
    final _$actionInfo = _$_UserMobxActionController.startAction(
        name: '_UserMobx.updatePaymentMethod');
    try {
      return super.updatePaymentMethod(method);
    } finally {
      _$_UserMobxActionController.endAction(_$actionInfo);
    }
  }

  @override
  void addVisitor() {
    final _$actionInfo =
        _$_UserMobxActionController.startAction(name: '_UserMobx.addVisitor');
    try {
      return super.addVisitor();
    } finally {
      _$_UserMobxActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
users: ${users},
visitors: ${visitors},
currentUser: ${currentUser},
isLoading: ${isLoading},
errorMessage: ${errorMessage},
enteredAmount: ${enteredAmount},
paymentMethod: ${paymentMethod}
    ''';
  }
}
