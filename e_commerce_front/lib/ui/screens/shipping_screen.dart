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
      home: ShippingScreen(),
    );
  }
}

class ShippingScreen extends StatelessWidget {
  const ShippingScreen({super.key});

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
                padding: const EdgeInsets.symmetric(
                    horizontal: 100.0, vertical: 20.0),
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
                    const BreadcrumbNavigation(),
                    const SizedBox(height: 40.0),
                    // Contact and Ship To Box
                    const ContactAndShipToBox(),
                    const SizedBox(height: 40.0),
                    // Shipping Method title
                    const Text(
                      'Shipping method',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 10.0),
                    // Shipping Method Box
                    const ShippingMethodBox(),
                    const Spacer(),
                    // Navigation buttons
                    const NavigationButtons(),
                    const SizedBox(height: 20.0),
                  ],
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
        const Text("Shipping",
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
        const Text(">", style: TextStyle(color: Color(0xFF616161))),
        const Text("Payment", style: TextStyle(color: Color(0xFF616161))),
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

class ContactAndShipToBox extends StatelessWidget {
  const ContactAndShipToBox({super.key});

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
        ],
      ),
    );
  }

  void _handleEdit(String field) {
    print("Edit $field clicked");
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

class ShippingMethodBox extends StatefulWidget {
  const ShippingMethodBox({super.key});

  @override
  _ShippingMethodBoxState createState() => _ShippingMethodBoxState();
}

class _ShippingMethodBoxState extends State<ShippingMethodBox> {
  String _selectedShippingMethod = 'standard_shipping';

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(5.0),
      ),
      child: RadioListTile<String>(
        activeColor: const Color(0xFF56B280),
        title: const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Standard Shipping'),
            Text(
              'Free',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.black,
                fontSize: 14.0,
              ),
            ),
          ],
        ),
        value: 'standard_shipping',
        groupValue: _selectedShippingMethod,
        onChanged: (value) {
          setState(() {
            _selectedShippingMethod = value!;
          });
        },
      ),
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
          onPressed: () => _handleNavigation("Back to details"),
          child: const Text(
            'Back to details',
            style: TextStyle(
              color: Color(0xFF56B280),
              fontSize: 14.0,
              decoration: TextDecoration.underline,
              decorationColor: Color(0xFF56B280),
            ),
          ),
        ),
        ElevatedButton(
          onPressed: () => _handleNavigation("Go to payment"),
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFF56B280),
          ),
          child: const Text(
            'Go to payment',
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
