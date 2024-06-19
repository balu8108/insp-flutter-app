import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:redux_thunk/redux_thunk.dart';

StoreProvider<State> getBaseScreen<State, Screen extends StatelessWidget>(
    Reducer<State> reducer, State initialState, Screen screen) {
  final Store<State> store = Store<State>(reducer,
      initialState: initialState, middleware: [thunkMiddleware]);
  return StoreProvider<State>(
    store: store,
    child: screen,
  );
}

void baseDispatch<State>(BuildContext context, dynamic action) {
  StoreProvider.of<State>(context).dispatch(action);
}
