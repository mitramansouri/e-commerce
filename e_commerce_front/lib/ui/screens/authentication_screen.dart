import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: AuthenticationScreen(),
    );
  }
}

class AuthenticationScreen extends StatefulWidget {
  const AuthenticationScreen({super.key});

  @override
  _AuthenticationScreenState createState() => _AuthenticationScreenState();
}

class _AuthenticationScreenState extends State<AuthenticationScreen> {
  // Methods to handle button clicks
  void _handleCartClick() {
    print("Cart clicked");
  }

  void _handleLoginClick() {
    print("Login clicked");
  }

  void _handleGoToShipping() {
    print("Go to Shipping clicked");
  }

  void _addCodeClicked() {
    print("Add code clicked");
  }

  // States for checkboxes and dropdowns
  bool _saveInfoForFutureCheckout = false;
  bool _newsletterSubscription = false;
  String? _selectedProvince;
  String? _selectedCountry;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          // Left side of the screen
          Expanded(
            flex: 1,
            child: Container(
              color: Colors.white,
              child: Padding(
                padding:
                    const EdgeInsets.only(left: 165.0, right: 100.0, top: 20.0),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Logo and wordmark
                      Row(
                        children: [
                          SvgPicture.asset(
                            'assets/icons/candleaf-icon.svg',
                            width: 40.0,
                            height: 40.0,
                          ),
                          const SizedBox(width: 10),
                          SvgPicture.asset(
                            'assets/icons/wordmark.svg',
                            width: 100.0,
                            height: 20.0,
                          ),
                        ],
                      ),
                      const SizedBox(height: 20.0),
                      // Breadcrumb navigation
                      Wrap(
                        spacing: 12.0,
                        runSpacing: 4.0,
                        children: [
                          // make text clickable
                          MouseRegion(
                            cursor: SystemMouseCursors.click,
                            child: GestureDetector(
                              onTap: _handleCartClick,
                              child: const Text(
                                "Cart",
                                style: TextStyle(
                                  color: Color(0xFF56B280),
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                          const Text(
                            ">",
                            style: TextStyle(
                              color: Color(0xFF616161),
                            ),
                          ),
                          const Text(
                            "Details",
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const Text(
                            ">",
                            style: TextStyle(
                              color: Color(0xFF616161),
                            ),
                          ),
                          const Text(
                            "Shipping",
                            style: TextStyle(
                              color: Color(0xFF616161),
                            ),
                          ),
                          const Text(
                            ">",
                            style: TextStyle(
                              color: Color(0xFF616161),
                            ),
                          ),
                          const Text(
                            "Payment",
                            style: TextStyle(
                              color: Color(0xFF616161),
                            ),
                          ),
                        ],
                      ),
                      // Contact section
                      Padding(
                        padding: const EdgeInsets.only(top: 40.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              'Contact',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Row(
                              children: [
                                const Text(
                                  'Do you have an account? ',
                                  style: TextStyle(
                                    color: Color(0xFF616161),
                                    fontSize: 14.0,
                                  ),
                                ),
                                MouseRegion(
                                  cursor: SystemMouseCursors.click,
                                  child: GestureDetector(
                                    onTap: _handleLoginClick,
                                    child: const Text(
                                      'Login',
                                      style: TextStyle(
                                        color: Color(0xFF56B280),
                                        fontSize: 14.0,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 5.0),
                      // Email input field
                      const TextField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Email or mobile phone number',
                        ),
                      ),
                      // Checkbox for newsletter subscription
                      CheckboxListTile(
                        contentPadding: EdgeInsets.zero,
                        title: const Text(
                          "Add me to Candleaf newsletter for a 10% discount",
                          style: TextStyle(fontSize: 14.0),
                        ),
                        value: _newsletterSubscription,
                        onChanged: (newValue) {
                          setState(() {
                            _newsletterSubscription = newValue!;
                          });
                        },
                        controlAffinity: ListTileControlAffinity.leading,
                      ),
                      const SizedBox(height: 20.0),
                      // Shipping address section
                      const Text(
                        'Shipping Address',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 10.0),
                      // Name input fields
                      const Row(
                        children: [
                          Expanded(
                            child: TextField(
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: 'Name',
                              ),
                            ),
                          ),
                          SizedBox(width: 10.0),
                          Expanded(
                            child: TextField(
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: 'Second Name',
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10.0),
                      // Address input field
                      const TextField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Address and number',
                        ),
                      ),
                      const SizedBox(height: 10.0),
                      // Shipping note input field
                      const TextField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Shipping note (optional)',
                        ),
                      ),
                      const SizedBox(height: 10.0),
                      // City, postal code, and province input fields
                      Row(
                        children: [
                          const Expanded(
                            child: TextField(
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: 'City',
                              ),
                            ),
                          ),
                          const SizedBox(width: 10.0),
                          const Expanded(
                            child: TextField(
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: 'Postal Code',
                              ),
                            ),
                          ),
                          const SizedBox(width: 10.0),
                          Expanded(
                            child: DropdownButtonFormField<String>(
                              decoration: const InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: 'Province',
                              ),
                              value: _selectedProvince,
                              items: ['Province 1', 'Province 2', 'Province 3']
                                  .map((province) => DropdownMenuItem<String>(
                                        value: province,
                                        child: Text(province),
                                      ))
                                  .toList(),
                              onChanged: (newValue) {
                                setState(() {
                                  _selectedProvince = newValue;
                                });
                              },
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10.0),
                      // Country/Region dropdown field
                      DropdownButtonFormField<String>(
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Country/Region',
                        ),
                        value: _selectedCountry,
                        items: [
                          'Iran',
                          'Croatia',
                          'Germany',
                          'Canada',
                          'Palisrael',
                          'Australia'
                        ]
                            .map((country) => DropdownMenuItem<String>(
                                  value: country,
                                  child: Text(country),
                                ))
                            .toList(),
                        onChanged: (newValue) {
                          setState(() {
                            _selectedCountry = newValue;
                          });
                        },
                      ),
                      // Checkbox to save information for future checkout
                      CheckboxListTile(
                        contentPadding: EdgeInsets.zero,
                        title: const Text(
                          "Save this information for a future fast checkout",
                          style: TextStyle(fontSize: 14.0),
                        ),
                        value: _saveInfoForFutureCheckout,
                        onChanged: (newValue) {
                          setState(() {
                            _saveInfoForFutureCheckout = newValue!;
                          });
                        },
                        controlAffinity: ListTileControlAffinity.leading,
                      ),
                      const SizedBox(height: 20.0),
                      // Navigation buttons
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          TextButton(
                            onPressed: _handleCartClick,
                            child: const Text(
                              'Back to Cart',
                              style: TextStyle(
                                color: Color(0xFF56B280),
                                fontSize: 14.0,
                                decoration: TextDecoration.underline,
                                decorationColor: Color(0xFF56B280),
                              ),
                            ),
                          ),
                          ElevatedButton(
                            onPressed: _handleGoToShipping,
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFF56B280),
                            ),
                            child: const Text(
                              'Go to Shipping',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16.0,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20.0),
                    ],
                  ),
                ),
              ),
            ),
          ),
          // Right side of the scree
          Expanded(
            flex: 1,
            child: Container(
              color: const Color.fromARGB(255, 242, 242, 242),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 65.0, vertical: 60.0)
                        .copyWith(right: 165.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Product image with count
                        Stack(
                          children: [
                            Image.asset(
                              'assets/pictures/product_single.png',
                              width: 150.0,
                              height: 150.0,
                            ),
                            Positioned(
                              top: 0,
                              right: 0,
                              child: Container(
                                padding: const EdgeInsets.all(6.0),
                                decoration: const BoxDecoration(
                                  color: Colors.green,
                                  shape: BoxShape.circle,
                                ),
                                child: const Text(
                                  '1',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(width: 20.0),
                        // Product title and price
                        const Padding(
                          padding: EdgeInsets.only(top: 20.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Spiced Mint Candleaf®',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(height: 5.0),
                              Text(
                                '\$ 9.99',
                                style: TextStyle(
                                  fontSize: 21.0,
                                  color: Colors.green,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20.0),
                    // Divider line
                    Divider(color: Colors.grey.withOpacity(0.5)),
                    const SizedBox(height: 20.0),
                    // Coupon code section
                    Row(
                      children: [
                        const Expanded(
                          child: TextField(
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'Coupon code',
                            ),
                          ),
                        ),
                        const SizedBox(width: 10.0),
                        ElevatedButton(
                          onPressed: _addCodeClicked,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFFA8A8A8),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10.0, vertical: 15.0),
                          ),
                          child: const Text(
                            'Add code',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20.0),
                    // Divider line
                    Divider(color: Colors.grey.withOpacity(0.5)),
                    const SizedBox(height: 20.0),
                    // Subtotal and shipping information
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Subtotal',
                          style: TextStyle(
                            color: Color(0xFF616161),
                            fontSize: 14.0,
                          ),
                        ),
                        Text(
                          '\$ 9.99',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 14.0,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10.0),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Shipping',
                          style: TextStyle(
                            color: Color(0xFF616161),
                            fontSize: 14.0,
                          ),
                        ),
                        Text(
                          'Calculated at the next step',
                          style: TextStyle(
                            color: Color(0xFF616161),
                            fontSize: 14.0,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20.0),

                    Divider(color: Colors.grey.withOpacity(0.5)),
                    const SizedBox(height: 20.0),

                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Total',
                          style: TextStyle(
                            color: Color(0xFF616161),
                            fontSize: 16.0,
                          ),
                        ),
                        Text(
                          '\$ 9.99',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
