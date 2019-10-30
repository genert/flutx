class Logger extends Middleware<AppState> {
  @override
  AppState beforeAction(Action action, AppState state) {
    if (action is GetParcels) {
      // Do something when event is 'GetParcels'.
    }

    return state;
  }

  @override
  AppState afterAction(Action action, AppState state) {
    return state;
  }
}
