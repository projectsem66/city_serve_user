import 'package:flutter/material.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Razorpay Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late Razorpay _razorpay;

  @override
  void initState() {
    super.initState();
    _razorpay = Razorpay();
    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
  }

  @override
  void dispose() {
    super.dispose();
    _razorpay.clear();
  }

  void _handlePaymentSuccess(PaymentSuccessResponse response) {
    print("Payment Successful: ${response.paymentId}");
    // Add your logic for successful payment here
  }

  void _handlePaymentError(PaymentFailureResponse response) {
    print("Error: ${response.code.toString()} - ${response.message}");
    // Add your logic for payment failure here
  }

  void _startPayment() async {
    var options = {
      'key': 'rzp_test_1D5mm0lF5G5ag', // Replace with your Razorpay API key
      'amount': 100, // Amount in the smallest currency unit (e.g., paisa for INR)
      'timeout': 180, // Timeout in seconds
      'currency': 'INR',
      'name': 'City Serve',
      'description': 'Payment for the service',
      'prefill': {'contact': '7016199407', 'email': 'projectsem66@gmail.com'},
      'external': {
        'wallets': ['paytm']
      }
    };

    try {
      _razorpay.open(options);
    } catch (e) {
      print("Error starting payment: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Razorpay Demo'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: _startPayment,
          child: Text('Make Payment'),
        ),
      ),
    );
  }
}
