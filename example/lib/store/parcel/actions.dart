import 'package:flutx/flutx.dart';
import 'package:flutx_example/store/parcel/state.dart';

// Trigger just action.
class CheckParcels extends Action<ParcelState> {}

class SaveParcels extends Action<ParcelState> {
  final Map<String, dynamic> data;

  SaveParcels({this.data}) : assert(data != null);

  @override
  Future action(ActionContext context) async {
    await context.dispatch(this, data);
  }
}

class GetParcels extends Action<ParcelState> {
  // Where the magic happens.
  // All action mutations are by default asyncronious so no need to worry about that.
  @override
  Future action(ActionContext context) async {
    // We can do some API requests here for example and dispatch result to mutation handler.
    await Future.delayed(const Duration(seconds: 3));

    // Commit state change.
    await context.commit(this);

    // or
    await context.commit(this, true);

    // You can also access state if needed.
    print(context.state);

    // You can also access root state if needed.
    print(context.rootState);

    // You can also dispatch other events.
    // You can only commit 1 argument. If you need more arguments to pass, use map type to store these.
    // await conext.dispatch(this, {
    //  'first': 'value',
    //  'second': 'blabal'
    //})
    await context.dispatch(SaveParcels(data: {
      'first': 123,
      'second': true,
    }));
  }

  // Useful for logging middleware for example but not required.
  @override
  String toString() => 'GetParcels';
}
