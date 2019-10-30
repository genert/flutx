library flutx_logger;

import 'package:flutx/flutx.dart';

class LoggerMiddleware extends Middleware<RootState> {
  @override
  RootState beforeAction(Action action, RootState state) {
    print('dispatching $action');
    return state;
  }

  @override
  RootState afterAction(Action action, RootState state) {
    print('next state $state');
    return state;
  }
}
