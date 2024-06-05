import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: PaymentScreen(),
    );
  }
}

class PaymentScreen extends StatelessWidget {
  const PaymentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          // Left side of the screen
          Expanded(
            flex: 1,
            child: SingleChildScrollView(
              child: Container(
                color: Colors.white,
                child: const Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 100.0, vertical: 20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      LogoAndWatermark(),
                      SizedBox(height: 20.0),
                      BreadcrumbNavigation(),
                      SizedBox(height: 40.0),
                      ContactAndShipToAndMethodBox(),
                      SizedBox(height: 40.0),
                      PaymentMethodBox(),
                      SizedBox(height: 40.0),
                      TaxInformationBox(),
                      SizedBox(height: 40.0),
                      BillingAddressBox(),
                      SizedBox(height: 20.0),
                      NavigationButtons(),
                    ],
                  ),
                ),
              ),
            ),
          ),
          // Right side of the screen
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
                    const ProductOverview(),
                    const SizedBox(height: 20.0),
                    Divider(color: Colors.grey.withOpacity(0.5)),
                    const SizedBox(height: 20.0),
                    const CouponCodeSection(),
                    const SizedBox(height: 20.0),
                    Divider(color: Colors.grey.withOpacity(0.5)),
                    const SizedBox(height: 20.0),
                    const SubtotalAndShippingInfo(),
                    const SizedBox(height: 20.0),
                    Divider(color: Colors.grey.withOpacity(0.5)),
                    const SizedBox(height: 20.0),
                    const TotalInfo(),
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

// Widgets for different sections

class LogoAndWatermark extends StatelessWidget {
  const LogoAndWatermark({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
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
    );
  }
}

class BreadcrumbNavigation extends StatelessWidget {
  const BreadcrumbNavigation({super.key});

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 12.0,
      runSpacing: 4.0,
      children: [
        // Clickable breadcrumb text
        BreadcrumbItem(text: "Cart", onTap: () => _handleNavigation("Cart")),
        const Text(">", style: TextStyle(color: Color(0xFF616161))),
        BreadcrumbItem(
            text: "Details", onTap: () => _handleNavigation("Details")),
        const Text(">", style: TextStyle(color: Color(0xFF616161))),
        BreadcrumbItem(
            text: "Shipping", onTap: () => _handleNavigation("Shipping")),
        const Text(">", style: TextStyle(color: Color(0xFF616161))),
        const Text("Payment",
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
      ],
    );
  }

  void _handleNavigation(String destination) {
    print("$destination clicked");
  }
}

class BreadcrumbItem extends StatelessWidget {
  final String text;
  final VoidCallback onTap;

  const BreadcrumbItem({required this.text, required this.onTap, super.key});

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: onTap,
        child: Text(
          text,
          style: const TextStyle(
            color: Color(0xFF56B280),
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}

class ContactAndShipToAndMethodBox extends StatelessWidget {
  const ContactAndShipToAndMethodBox({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15.0),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(5.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ContactInfoRow(
            label: 'Contact',
            value: 'joe.spagnuolo@uxbly.com',
            onEdit: () => _handleEdit("Contact"),
          ),
          const Divider(color: Colors.grey),
          ContactInfoRow(
            label: 'Ship to',
            value: 'Via Firenze 23, 92023, Campobello di Licata AG, Italia',
            onEdit: () => _handleEdit("Ship to"),
          ),
          const Divider(color: Colors.grey),
          ContactInfoRow(
            label: 'Method',
            value: 'Standard Shipping - FREE',
            onEdit: () => _handleEdit("Method"),
          ),
        ],
      ),
    );
  }

  void _handleEdit(String field) {
    print("Edit $field clicked");
  }
}

class PaymentMethodBox extends StatelessWidget {
  const PaymentMethodBox({super.key});

  void _handleIconTap(String action) {
    print("$action clicked");
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Payment method',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 10.0),
        Container(
          padding: const EdgeInsets.symmetric(vertical: 10.0),
          decoration: BoxDecoration(
            color: Colors.green[100],
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(5.0),
              topRight: Radius.circular(5.0),
            ),
          ),
          child: Row(
            children: [
              const SizedBox(width: 20.0),
              Icon(
                Icons.credit_card,
                color: Colors.green[700],
                size: 30.0,
              ),
              const SizedBox(width: 20.0),
              Text(
                'Credit Card',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.green[700],
                ),
              ),
            ],
          ),
        ),
        Container(
          padding: const EdgeInsets.all(15.0),
          decoration: const BoxDecoration(
            // remove top side of the border
            border: Border(
              right: BorderSide(color: Colors.grey),
              bottom: BorderSide(color: Colors.grey),
              left: BorderSide(color: Colors.grey),
            ),
            color: Colors.white,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 10.0),
              TextField(
                decoration: InputDecoration(
                  border: const OutlineInputBorder(),
                  labelText: 'Card Number',
                  suffixIcon: IconButton(
                    onPressed: () => _handleIconTap("Lock icon"),
                    icon: const Icon(Icons.lock),
                  ),
                ),
              ),
              const SizedBox(height: 10.0),
              const TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Holder Name',
                ),
              ),
              const SizedBox(height: 10.0),
              Row(
                children: [
                  const Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Expiration (MM/YY)',
                      ),
                    ),
                  ),
                  const SizedBox(width: 10.0),
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'CVV',
                        suffixIcon: IconButton(
                          onPressed: () => _handleIconTap("info icon"),
                          icon: const Icon(Icons.info_outline),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class ContactInfoRow extends StatelessWidget {
  final String label;
  final String value;
  final VoidCallback onEdit;

  const ContactInfoRow(
      {required this.label,
      required this.value,
      required this.onEdit,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: const TextStyle(color: Color(0xFF616161)),
        ),
        const SizedBox(width: 20.0),
        Expanded(
          child: Text(
            value,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(color: Colors.black),
          ),
        ),
        TextButton(
          onPressed: onEdit,
          child: const Text(
            'Edit',
            style: TextStyle(color: Color(0xFF56B280)),
          ),
        ),
      ],
    );
  }
}

class TaxInformationBox extends StatelessWidget {
  const TaxInformationBox({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Tax Information',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 10.0),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'VAT number  (optional)',
              ),
            ),
            SizedBox(height: 10.0),
            TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'PEC (optional)',
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class BillingAddressBox extends StatefulWidget {
  const BillingAddressBox({super.key});

  @override
  _BillingAddressBoxState createState() => _BillingAddressBoxState();
}

class _BillingAddressBoxState extends State<BillingAddressBox> {
  String _selectedBillingAddress = 'same_as_shipping';

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Billing address',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 10.0),
        Container(
          padding: const EdgeInsets.all(8.0),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.circular(5.0),
          ),
          child: Column(
            children: [
              RadioListTile<String>(
                activeColor: const Color(0xFF56B280),
                title: const Text('Same as the shipping address'),
                value: 'same_as_shipping',
                groupValue: _selectedBillingAddress,
                onChanged: (value) {
                  setState(() {
                    _selectedBillingAddress = value!;
                  });
                },
              ),
              const Divider(),
              RadioListTile<String>(
                activeColor: const Color(0xFF56B280),
                title: const Text('Use a different address for billing'),
                value: 'different_address',
                groupValue: _selectedBillingAddress,
                onChanged: (value) {
                  setState(() {
                    _selectedBillingAddress = value!;
                  });
                },
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class NavigationButtons extends StatelessWidget {
  const NavigationButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        TextButton(
          onPressed: () => _handleNavigation("Back to shipping"),
          child: const Text(
            'Back to shipping',
            style: TextStyle(
              color: Color(0xFF56B280),
              fontSize: 14.0,
              decoration: TextDecoration.underline,
              decorationColor: Color(0xFF56B280),
            ),
          ),
        ),
        ElevatedButton(
          onPressed: () => _handleNavigation("Pay now"),
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFF56B280),
          ),
          child: const Text(
            'Pay now',
            style: TextStyle(
              color: Colors.white,
              fontSize: 16.0,
            ),
          ),
        ),
      ],
    );
  }

  void _handleNavigation(String action) {
    print("$action clicked");
  }
}

class ProductOverview extends StatelessWidget {
  const ProductOverview({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
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
        // Product description
        const Expanded(
          child: Padding(
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
        ),
      ],
    );
  }
}

class CouponCodeSection extends StatelessWidget {
  const CouponCodeSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
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
            padding:
                const EdgeInsets.symmetric(horizontal: 10.0, vertical: 15.0),
          ),
          child: const Text(
            'Add code',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }

  static void _addCodeClicked() {
    print("Add code clicked");
  }
}

class SubtotalAndShippingInfo extends StatelessWidget {
  const SubtotalAndShippingInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Row(
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
        SizedBox(height: 10.0),
        Row(
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
              'Free Shipping',
              style: TextStyle(
                color: Colors.black,
                fontSize: 14.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class TotalInfo extends StatelessWidget {
  const TotalInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
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
    );
  }
}
