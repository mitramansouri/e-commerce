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
      home: ThanksScreen(),
    );
  }
}

class ThanksScreen extends StatelessWidget {
  const ThanksScreen({super.key});

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
                    horizontal: 100.0, vertical: 30.0),
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
                    // Green check button centered
                    const Center(
                      child: Column(
                        children: [
                          Icon(
                            Icons.check_circle,
                            color: Colors.green,
                            size: 100.0,
                          ),
                          SizedBox(height: 20.0),
                          Text(
                            'Payment Confirmed',
                            style: TextStyle(
                              fontSize: 24.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 10.0),
                          Text(
                            'ORDER #2039',
                            style: TextStyle(
                              color: Colors.green,
                              fontSize: 16.0,
                            ),
                          ),
                          SizedBox(height: 20.0),
                          Text(
                            'Thank you Joe for buying Candleaf. The nature is grateful to you. Now that your order is confirmed it will be ready to ship in 2 days. Please check your inbox in the future for your order updates.',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Color(0xFFA8A8A8),
                              fontSize: 16.0,
                            ),
                          ),
                          SizedBox(height: 30.0),
                          const NavigationButtons(),
                        ],
                      ),
                    ),
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
                    const SizedBox(height: 80.0),
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
                fontWeight: FontWeight.bold,
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
          'Paid',
          style: TextStyle(
            color: Color(0xFF56B280),
            fontSize: 16.0,
          ),
        ),
        Text(
          '\$ 9.99',
          style: TextStyle(
            color: Color(0xFF56B280),
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
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
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        ElevatedButton(
          onPressed: () => _handleNavigation("Back to shopping"),
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFF56B280),
          ),
          child: const Text(
            'Back to Shopping',
            style: TextStyle(
              color: Colors.white,
              fontSize: 18.0,
            ),
          ),
        ),
        const SizedBox(height: 10.0),
        TextButton(
          onPressed: () => _handleNavigation("Print receipt"),
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
      ],
    );
  }

  void _handleNavigation(String action) {
    print("$action clicked");
  }
}
