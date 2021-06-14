import 'package:flutter/material.dart';
import 'package:square_in_app_payments/in_app_payments.dart';

class PaymentPage extends StatelessWidget {
  final bool _showAppBar;

  const PaymentPage(this._showAppBar);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _showAppBar ? AppBar() : null,
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Page ${_showAppBar ? 'with' : 'without'} AppBar',
                style: Theme.of(context).textTheme.headline6,
              ),
              TextButton(
                child: Text(
                  'Pay Now',
                ),
                onPressed: _payButtonPressed,
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _payButtonPressed() async {
    await InAppPayments.startCardEntryFlow(
      onCardNonceRequestSuccess: (_) {
        InAppPayments.completeCardEntry(
          onCardEntryComplete: () {
            debugPrint('Payment complete');
          },
        );
      },
      onCardEntryCancel: () {
        debugPrint('Card entry cancelled');
      },
      collectPostalCode: true,
    );
  }
}
