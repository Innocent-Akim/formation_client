@JS()
library stringify;

import 'package:flutter/material.dart';
import 'package:js/js.dart';

import 'constants.dart';

void rederictToCheckout(BuildContext _) async {
  final stripe = Stripe(apiKey);
  stripe.rederictToCheckout(CheckoutOptions(
    lineItems: [
      LineItem(
        price: '10',
        quantity: 1,
      )
    ],
    mode: 'payment',
    successUrl: 'http://localhost:8080/#/success',
    cancelUrl: 'https://localhost:8080/#/cancel',
  ));
}

class Stripe {
  external Stripe(String key);
  external rederictToCheckout(CheckoutOptions options);
}

@JS()
@anonymous
class CheckoutOptions {
  external List<LineItem> get lineItems;
  external String get mode;
  external String get successUrl;
  external String get cancelUrl;
  external String get sessionId;
  external factory CheckoutOptions({
    List<LineItem> lineItems,
    String mode,
    String successUrl,
    String cancelUrl,
    String sessionId,
  });
}

@JS()
@anonymous
class LineItem {
  external String get price;
  external String get quantity;
  external factory LineItem({price, quantity});
}
