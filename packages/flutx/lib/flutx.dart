library flutx;

abstract class ActionContext {}

class Action<T> {
  Future action(ActionContext context) {}
}

class Mutation<T> {
  Stream<T> mutate(T state, Action action) {}
}

/// The contract between one piece of middleware and the next in the chain. Use
/// it to send the current action in your [Middleware] to the next piece of
/// [Middleware] in the chain.
///
/// Middleware can optionally pass the original action or a modified action to
/// the next piece of middleware, or never call the next piece of middleware at
/// all.
typedef void NextDispatcher(dynamic action);

abstract class Middleware<T> {
  /// Called before action reducer.
  T beforeAction(Action action, T state) => state;

  /// Called after action reducer.
  T afterAction(Action action, T state) => state;
}

class Store<T> {
  Store([T initialState]);

  /// List of middlewares to be applied.
  final List<Middleware<T>> middlewares = [];

  /// Dispatches actions that mutates the current state.
  Store<T> dispatch(Action action) {}

  T _computeBeforeMiddlewares(Action action, T state) => middlewares.fold<T>(
      state, (state, middleware) => middleware.beforeAction(action, state));

  T _foldAfterActionMiddlewares(T initialValue, Action action) =>
      middlewares.fold<T>(initialValue,
          (state, middleware) => middleware.afterAction(action, state));
}
// Actions

/*
// Middleware


// Init app
class MyApp extends StatelessWidget {
  final store = Store<AppState>(
    middlewares: [MyMiddleware()],
    modules: {
      'parcelState': ParcelState(),
    }
  );

  // You can dispatch here.
  store.dispatch(GetParcels());

  @override
  Widget build(BuildContext context) {
    return StoreProvider(
      store: store,
      child: MaterialApp(),
    );
  }
}

// Accessing state.
Provider.of<ParcelState>(builder: (BuildContext context, ParcelState state) {
  Text("We have parcels: ${state.hasParcels}")
});

// or
Consumer<ParcelState>(builder: (BuildContext context, ParcelState state) {
  Text("We have parcels: ${state.hasParcels}");
});

// Access whole app state. Not recommended, just access individual state.
Provider.of<AppState>(builder: (BuildContext context, AppState state) {
  Text("We have parcels: ${state.parcelState.hasParcels}")
});

// Call actions.
IconButton(
  icon: Icon(Icons.search),
  onPressed: () async {
    Provider.of<Store>(context).dispatch(GetParcels());
  },
)
*/
