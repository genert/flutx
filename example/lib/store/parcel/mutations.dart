import 'package:flutx_example/store/parcel/actions.dart';
import 'package:flutx_example/store/parcel/state.dart';
import 'package:flutx/flutx.dart';

/// The only way to actually change state in a store is by committing a mutation.
/// Mutations are very similar to events: each mutation has a string type and a handler.
/// The handler function is where we perform actual state modifications, and it will receive the state as the first argument.
/// Mutations are streams, remember that!
/// Mutation only purpose is to change the state based on action if needed.
class ParcelMutations extends Mutations<ParcelState> {
  @override
  Stream<ParcelState> mutate(ParcelState state, Action action) async* {
    if (action is GetParcels) {
      // You can access action argument like this.
      state.hasParcels = action.arg as bool;
      state.parcels = [Parcel()];
    } else if (action is SaveParcels) {
      print(action.arg as Map<String, dynamic>);
    } else if (action is CheckParcels) {
      print("checking parcels");
    }

    // If yielded state differs from old state, then refresh is triggered for state consumers.
    yield state;
  }
}
