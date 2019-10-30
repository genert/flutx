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
  Stream<ParcelState> mutate(ParcelState state, Action action) {
    if (action is GetParcels) {
      // You can access action argument like this.
      state.hasParcels = action.arg as bool;
      state.parcels = [Parcel()];

      // State is different therefore refresh will be triggered for those who listen.
      yield state;
    } else if (action is SaveParcels) {
      print(action.arg as Map<String, dynamic>);
      yield state;
    } else {
      // This will not refresh state since nothing has changed.
      yield state;
    }

    // You can only yield 1 state change! If more is yielded, these will be
    // discared and you will receive warning!
  }
}
