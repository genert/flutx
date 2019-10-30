# flutx_flutter

A set of utilities that allow you to easily consume a [Flutx](https://pub.dartlang.org/packages/flutx) Store to build Flutter Widgets.

## Widgets

- `StoreProvider` - The base Widget. It will pass the given Flutx Store to all descendants that request it.
- `StoreConnector` - A descendant Widget that gets the Store from the nearest `StoreProvider` ancestor, converts the `Store` into a `ViewModel` with the given `converter` function, and passes the `ViewModel` to a `builder` function. Any time the Store emits a change event, the Widget will automatically be rebuilt. No need to manage subscriptions!
