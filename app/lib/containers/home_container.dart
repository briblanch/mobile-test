import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:supercode/redux/actions.dart';
import 'package:supercode/redux/app_state.dart';
import 'package:supercode/widgets/home.dart';

class HomeContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, _ViewModel>(
      converter: _ViewModel.fromStore,
      builder: (context, vm) {
        return Home(
          navigateToQrCode: vm.navigateToQRCode,
        );
      },
    );
  }
}

class _ViewModel {
  final Function() navigateToQRCode;

  static _ViewModel fromStore(Store<AppState> store) {
    return _ViewModel(
      navigateToQRCode: () {
        store.dispatch(NavigateToQRCode());
      },
    );
  }

  _ViewModel({this.navigateToQRCode});
}
