import 'package:flutter/material.dart';

import 'package:flutx/flutx.dart';
import 'package:flutx_example/store/parcel/parcel.dart';
import 'package:flutx_logger/flutx_logger.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final store = Store<RootState>(
      {
        'parcelState': ParcelState(),
      },
      middlewares: [
        LoggerMiddleware(),
      ],
    );

    // You can dispatch here.
    store.dispatch(GetParcels());

    return StoreProvider(
      store: store,
      child: MaterialApp(),
    );
  }
}
