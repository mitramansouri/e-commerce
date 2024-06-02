import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

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
              width: 40.0, // Set the desired width
              height: 40.0, // Set the desired height
            ),
            const SizedBox(
              width: 10,
            ),
            // candleaf name icon
            SvgPicture.asset(
              'assets/icons/wordmark.svg',
              width: 20.0, // Set the desired width
              height: 20.0, // Set the desired height
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
            const SizedBox(
              height: 40.0,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  width: 40.0,
                ),
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
                        children: [
                          const Text(
                            '\$9.99',
                            style:
                                TextStyle(fontSize: 24.0, color: Colors.green),
                          ),
                          // insert the code here
                          const SizedBox(height: 10.0),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Radio<String>(
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
                            ],
                          ),
                          if (_selectedSubscription == 'subscribe')
                            Container(
                              margin: EdgeInsets.only(left: 50),
                              padding: EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.grey),
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Subscribe now and get the 10% of discount on every recurring order. The discount will be applied at checkout.',
                                    style: TextStyle(fontSize: 14),
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      // Handle "See details" tap
                                    },
                                    child: Text(
                                      'See details',
                                      style: TextStyle(
                                        fontSize: 14,
                                        color: Colors.green,
                                        decoration: TextDecoration.underline,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          // end of inserted code
                        ],
                      ),
                      const SizedBox(height: 10.0),
                      const Text(
                        'Quantity',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Row(
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
                      const SizedBox(height: 10.0),
                      const Text(
                        'Subscribe and delivery every',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      DropdownButton<String>(
                        value: selectedValue,
                        items: items
                            .map((item) => DropdownMenuItem<String>(
                                  value: item,
                                  child: Text(item),
                                ))
                            .toList(),
                        onChanged: (value) {
                          setState(() {
                            selectedValue = value;
                          });
                        },
                      ),
                      const SizedBox(height: 20.0),
                      ElevatedButton(
                        onPressed: () {},
                        child: const Text('+ Add to cart'),
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(vertical: 16.0),
                          backgroundColor: Colors.green,
                        ),
                      ),
                      const SizedBox(height: 20.0),
                      Container(
                        padding: const EdgeInsets.all(8.0),
                        color: Colors.grey.shade200,
                        child: const Text(
                          'Wax: Top grade Soy wax that delivers a smoke less, consistent burn\n'
                          'Fragrance: Premium quality ingredients with natural essential oils\n'
                          'Burning Time: 70-75 hours\n'
                          'Dimension: 10cm x 5cm\n'
                          'Weight: 400g',
                          style: TextStyle(fontSize: 14.0),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            // footer
            Container(
              height: MediaQuery.of(context).size.height * 0.3,
              width: MediaQuery.of(context).size.width,
              color: Colors.black87,
              child: Column(
                children: [
                  const SizedBox(
                    height: 20.0,
                  ),
                  const Divider(),
                  const SizedBox(
                    height: 20.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              //candleaf icon
                              const SizedBox(
                                width: 20.0,
                              ),
                              SvgPicture.asset(
                                'assets/icons/candleaf-icon.svg',
                                width: 40.0, // Set the desired width
                                height: 40.0, // Set the desired height
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              // candleaf name icon
                              SvgPicture.asset(
                                'assets/icons/wordmark.svg',
                                width: 20.0, // Set the desired width
                                height: 20.0, // Set the desired height
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
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                      const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Column(
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
                      ),
                      const Column(
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
