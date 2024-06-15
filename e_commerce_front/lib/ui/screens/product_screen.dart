import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({super.key});

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  final List<String> items = [
    'Every week',
    'Every 2 weeks',
    'Every 4 weeks',
    'Every month',
  ];
  String? selectedValue = 'Every 4 weeks';
  int quantity = 1;
  String _selectedSubscription = 'one-time';
  String _selectedDelivery = 'Every 4 weeks';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
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
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                PopupMenuButton<String>(
                  onSelected: (value) {
                    // Handle navigation based on the selected value
                    if (value == 'New Season') {
                      // Navigate to New Season page
                    } else if (value == 'Most Searched') {
                      // Navigate to Most Searched page
                    } else if (value == 'Most Sold') {
                      // Navigate to Most Sold page
                    }
                  },
                  itemBuilder: (BuildContext context) {
                    return [
                      const PopupMenuItem(
                        value: 'New Season',
                        child: Text('New Season'),
                      ),
                      const PopupMenuItem(
                        value: 'Most Searched',
                        child: Text('Most Searched'),
                      ),
                      const PopupMenuItem(
                        value: 'Most Sold',
                        child: Text('Most Sold'),
                      ),
                    ];
                  },
                  child: const Row(
                    children: [
                      Text(
                        'Discovery',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                        ),
                      ),
                      Icon(Icons.keyboard_arrow_down)
                    ],
                  ),
                ),
                const SizedBox(width: 20),
                NavBarItem('About', () {
                  // Navigate to About page
                }),
                const SizedBox(width: 20),
                NavBarItem('Contact us', () {
                  // Navigate to Contact us page
                }),
              ],
            ),
            const Spacer(),
            const Spacer(),
            IconButton(
              icon: const Icon(Icons.person),
              onPressed: () {},
            ),
            IconButton(
              icon: const Icon(Icons.shopping_cart),
              onPressed: () {},
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 40.0),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(width: 40.0),
                Expanded(
                  flex: 2,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset(
                        'assets/pictures/product_single.png',
                        width: MediaQuery.of(context).size.width * 0.2,
                        height: MediaQuery.of(context).size.width * 0.2,
                        fit: BoxFit.cover,
                      ),
                      const SizedBox(height: 30.0),
                      const Text(
                        'All hand-made with natural soy wax, Candleaf is made for your pleasure moments.',
                        textAlign: TextAlign.center,
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 30.0),
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Icon(Icons.local_shipping),
                          Text(
                            ' FREE SHIPPING',
                            style: TextStyle(color: Colors.green),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 150.0),
                Expanded(
                  flex: 3,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Spiced Mint Candleaf®',
                        style: TextStyle(
                            fontSize: 24.0, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 10.0),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            '\$9.99',
                            style: TextStyle(
                                fontSize: 24.0,
                                color: Colors.green,
                                fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(width: 100.0),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Radio<String>(
                                      activeColor: Colors.green,
                                      value: 'one-time',
                                      groupValue: _selectedSubscription,
                                      onChanged: (value) {
                                        setState(() {
                                          _selectedSubscription = value!;
                                        });
                                      },
                                    ),
                                    const Text('One time purchase'),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Radio<String>(
                                      activeColor: Colors.green,
                                      value: 'subscribe',
                                      groupValue: _selectedSubscription,
                                      onChanged: (value) {
                                        setState(() {
                                          _selectedSubscription = value!;
                                        });
                                      },
                                    ),
                                    const Text('Subscribe and delivery every'),
                                    const SizedBox(width: 10),
                                    DropdownButton<String>(
                                      value: _selectedDelivery,
                                      onChanged: (String? newValue) {
                                        setState(() {
                                          _selectedDelivery = newValue!;
                                        });
                                      },
                                      items: <String>[
                                        'Every week',
                                        'Every 2 weeks',
                                        'Every 4 weeks',
                                        'Every month'
                                      ].map<DropdownMenuItem<String>>(
                                          (String value) {
                                        return DropdownMenuItem<String>(
                                          value: value,
                                          child: Text(value),
                                        );
                                      }).toList(),
                                    ),
                                  ],
                                ),
                                if (_selectedSubscription == 'subscribe')
                                  Container(
                                    margin: const EdgeInsets.only(top: 10),
                                    padding: const EdgeInsets.all(8),
                                    decoration: BoxDecoration(
                                      border: Border.all(color: Colors.grey),
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const Text(
                                          'Subscribe now and get the 10% of discount on every recurring order. The discount will be applied at checkout.',
                                          style: TextStyle(fontSize: 14),
                                        ),
                                        GestureDetector(
                                          onTap: () {
                                            // Handle "See details" tap
                                          },
                                          child: const Text(
                                            'See details',
                                            style: TextStyle(
                                              fontSize: 14,
                                              color: Colors.green,
                                              decoration:
                                                  TextDecoration.underline,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10.0),
                      const Text(
                        'Quantity',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 10.0),
                      Container(
                        width: 100,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.green),
                          borderRadius: BorderRadius.circular(1.0),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            IconButton(
                              icon: const Icon(Icons.remove),
                              onPressed: () {
                                setState(() {
                                  if (quantity > 1) quantity--;
                                });
                              },
                            ),
                            Text('$quantity'),
                            IconButton(
                              icon: const Icon(Icons.add),
                              onPressed: () {
                                setState(() {
                                  quantity++;
                                });
                              },
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 10.0),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ElevatedButton.icon(
                            onPressed: () {
                              // Button press action
                            },
                            style: ElevatedButton.styleFrom(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 16.0, horizontal: 24.0),
                              backgroundColor: Colors.green,
                              shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.zero,
                              ),
                            ),
                            icon: const Icon(Icons.add_shopping_cart_outlined,
                                color: Colors.white),
                            label: const Text(
                              '+ Add to cart',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20.0),
                      Container(
                        padding: const EdgeInsets.all(8.0),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(color: Colors.black, width: 1.0),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        child: RichText(
                          text: const TextSpan(
                            style: TextStyle(fontSize: 14.0, color: Colors.black),
                            children: [
                              TextSpan(
                                text: 'Wax: ',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              TextSpan(
                                  text:
                                      'Top grade Soy wax that delivers a smokeless, consistent burn\n'),
                              TextSpan(
                                text: 'Fragrance: ',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              TextSpan(
                                  text:
                                      'Premium quality ingredients with natural essential oils\n'),
                              TextSpan(
                                text: 'Burning Time: ',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              TextSpan(text: '70-75 hours\n'),
                              TextSpan(
                                text: 'Dimension: ',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              TextSpan(text: '10cm x 5cm\n'),
                              TextSpan(
                                text: 'Weight: ',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              TextSpan(text: '400g'),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            // footer
            Container(
              height: MediaQuery.of(context).size.height * 0.4, // Make the footer height responsive
              width: MediaQuery.of(context).size.width,
              color: Colors.black87,
              child: Column(
                children: [
                  const SizedBox(height: 20.0),
                  const Divider(color: Colors.white),
                  const SizedBox(height: 20.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              const SizedBox(width: 20.0),
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
                          Container(
                            width: 300,
                            padding: const EdgeInsets.all(20.0),
                            child: const Text(
                              'Your natural candle made for your home and for your wellness.',
                              style: TextStyle(color: Colors.white60),
                            ),
                          ),
                        ],
                      ),
                      const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Discovery',
                            style: TextStyle(color: Colors.green),
                          ),
                          Text(
                            'New season',
                            style: TextStyle(color: Colors.white60),
                          ),
                          Text(
                            'Most searched',
                            style: TextStyle(color: Colors.white60),
                          ),
                          Text(
                            'Most selled',
                            style: TextStyle(color: Colors.white60),
                          ),
                        ],
                      ),
                      const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'About',
                            style: TextStyle(color: Colors.green),
                          ),
                          Text(
                            'Company',
                            style: TextStyle(color: Colors.white60),
                          ),
                          Text(
                            'Team',
                            style: TextStyle(color: Colors.white60),
                          ),
                          Text(
                            'Careers',
                            style: TextStyle(color: Colors.white60),
                          ),
                        ],
                      ),
                      const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Help',
                            style: TextStyle(color: Colors.green),
                          ),
                          Text(
                            'Contact us',
                            style: TextStyle(color: Colors.white60),
                          ),
                          Text(
                            'FAQs',
                            style: TextStyle(color: Colors.white60),
                          ),
                          Text(
                            'Shipping',
                            style: TextStyle(color: Colors.white60),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class NavBarItem extends StatelessWidget {
  final String title;
  final VoidCallback onTap;

  NavBarItem(this.title, this.onTap);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Text(
        title,
        style: const TextStyle(
          color: Colors.black,
          fontSize: 18,
        ),
      ),
    );
  }
}
