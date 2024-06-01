import 'dart:ui';

import 'package:e_commerce_front/ui/widgets/product_single.dart';
import 'package:e_commerce_front/ui/widgets/testemonial_single.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:dropdown_button2/dropdown_button2.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<String> items = [
    'Item1',
    'Item2',
    'Item3',
    'Item4',
    'Item5',
    'Item6',
    'Item7',
    'Item8',
  ];

  final List<Map<String, dynamic>> products = [
    {
      'title': 'Candle1',
      'picture': 'assets/pictures/candle1.png',
      'price': '9.99'
    },
    {
      'title': 'Candle2',
      'picture': 'assets/pictures/candle2.png',
      'price': '9.99'
    },
    {
      'title': 'Candle3',
      'picture': 'assets/pictures/candle3.png',
      'price': '9.99'
    },
    {
      'title': 'Candle1',
      'picture': 'assets/pictures/candle1.png',
      'price': '9.99'
    },
    {
      'title': 'Candle1',
      'picture': 'assets/pictures/candle1.png',
      'price': '9.99'
    },
    {
      'title': 'Candle1',
      'picture': 'assets/pictures/candle1.png',
      'price': '9.99'
    },
    {
      'title': 'Candle2',
      'picture': 'assets/pictures/candle2.png',
      'price': '9.99'
    },
    {
      'title': 'Candle3',
      'picture': 'assets/pictures/candle3.png',
      'price': '9.99'
    },
    {
      'title': 'Candle2',
      'picture': 'assets/pictures/candle2.png',
      'price': '9.99'
    },
    {
      'title': 'Candle3',
      'picture': 'assets/pictures/candle3.png',
      'price': '9.99'
    },
  ];

  final List<Map<String, dynamic>> testimonials = [
    {
      'profilePicture': 'assets/pictures/profilepic.jpg',
      'name': 'John Doe',
      'review': 'Great service and friendly staff!',
      'rating': 5,
    },
    {
      'profilePicture': 'assets/pictures/profilepic2.jpg',
      'name': 'Jane Smith',
      'review': 'Good experience overall.',
      'rating': 4,
    },
    {
      'profilePicture': 'assets/pictures/profilepic3.jpg',
      'name': 'Sam Wilson',
      'review': 'Could be better, but satisfied.',
      'rating': 3,
    },
  ];
  String? selectedValue;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          // Fixed Menu while scrolling down
          Container(
            color: Colors.white,
            height: 60.0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                //icons
                InkWell(
                  child: Row(
                    children: [
                      //candleaf icon
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
                ),
                // menu items
                Row(
                  children: [
                    // discover drop down
                    DropdownButtonHideUnderline(
                      child: DropdownButton2<String>(
                        isExpanded: true,
                        hint: const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Expanded(
                              child: Text(
                                'Discovery',
                                style: TextStyle(
                                  fontSize: 15,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ],
                        ),
                        items: items
                            .map((String item) => DropdownMenuItem<String>(
                                  value: item,
                                  child: Text(
                                    item,
                                    style: const TextStyle(
                                      color: Colors.black,
                                    ),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ))
                            .toList(),
                        value: selectedValue,
                        onChanged: (String? value) {
                          setState(() {
                            selectedValue = value;
                          });
                        },
                        buttonStyleData: const ButtonStyleData(
                          width: 120,
                          padding: EdgeInsets.only(left: 14, right: 14),
                        ),
                        iconStyleData: const IconStyleData(
                          icon: Icon(
                            Icons.keyboard_arrow_down_sharp,
                          ),
                          iconSize: 20,
                          iconEnabledColor: Colors.black,
                          iconDisabledColor: Colors.grey,
                        ),
                        dropdownStyleData: DropdownStyleData(
                          maxHeight: 200,
                          width: 200,
                          offset: const Offset(-20, 0),
                          scrollbarTheme: ScrollbarThemeData(
                            radius: const Radius.circular(40),
                            thickness: MaterialStateProperty.all<double>(6),
                            thumbVisibility:
                                MaterialStateProperty.all<bool>(true),
                          ),
                        ),
                        menuItemStyleData: const MenuItemStyleData(
                          height: 40,
                          padding: EdgeInsets.only(left: 14, right: 14),
                        ),
                      ),
                    ),
                    TextButton(
                      onPressed: () {},
                      child: const Text(
                        'About',
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                    TextButton(
                      onPressed: () {},
                      child: const Text(
                        'Contact Us',
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    //Profile Icon
                    IconButton(
                      icon: const Icon(Icons.person_2_outlined),
                      tooltip: 'See Profile',
                      onPressed: () {
                        setState(() {});
                      },
                    ),
                    //shopping cart Icon
                    IconButton(
                      icon: const Icon(Icons.shopping_cart_outlined),
                      tooltip: 'See cart',
                      onPressed: () {
                        setState(() {});
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  // back ground image part
                  Container(
                    height: MediaQuery.of(context).size.height * 0.5,
                    width: MediaQuery.of(context).size.width,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('assets/pictures/bg-image.png'),
                          fit: BoxFit.cover),
                    ),
                    // nature candle and texts inside
                    child: LayoutBuilder(
                      builder:
                          (BuildContext context, BoxConstraints constraints) {
                        double parentHeight = constraints.maxHeight;
                        double parentWidth = constraints.maxWidth;
                        return Center(
                          child: Container(
                            color: Colors.white60,
                            height: parentHeight * 0.7,
                            width: parentWidth * 0.7,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                const Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Image(
                                    image: AssetImage(
                                        'assets/pictures/green-tea.png'),
                                    height: 30,
                                    width: 30,
                                  ),
                                ),
                                const Text(
                                  'The Nature Candle',
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
                                const Padding(
                                  padding: EdgeInsets.all(20.0),
                                  child: Text(
                                      'All handmade with natural soy wax, Candleaf is a companion for all your pleasure moments '),
                                ),
                                ElevatedButton(
                                  onPressed: () {},
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.green,
                                    elevation: 12.0,
                                  ),
                                  child: const Text(
                                    'Descovery our collection',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  // product part
                  const SizedBox(
                    height: 20.0,
                  ),
                  const Text(
                    'Products',
                    style:
                        TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                  ),
                  const Text('Order it for you or for your beloved ones '),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    child: GridView.builder(
                      physics:
                          const NeverScrollableScrollPhysics(), // Disable GridView's own scrolling
                      shrinkWrap: true,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 4, // Number of columns
                        mainAxisSpacing: 8.0, // Spacing between rows
                        crossAxisSpacing: 8.0, // Spacing between columns
                      ),
                      itemCount: items.length,
                      itemBuilder: (context, index) {
                        return ProductSignle(
                          title: products[index]['title'],
                          picture: products[index]['picture'],
                          price: products[index]['price'],
                        );
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 60.0,
                  ),
                  //clean and fragrant soy wax
                  Container(
                    height: MediaQuery.of(context).size.height * 0.5,
                    width: MediaQuery.of(context).size.width,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        const SizedBox(
                          width: 20.0,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Clean and fragrant soy wax',
                              style: TextStyle(
                                  fontSize: 30.0, fontWeight: FontWeight.bold),
                            ),
                            const Text(
                              'Made for your home and for your wellness',
                              style: TextStyle(
                                  color: Colors.greenAccent, fontSize: 15.0),
                            ),
                            const Row(
                              children: [
                                Icon(Icons.check_circle_outline),
                                Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Text(
                                    'Eco-sustainable:All recyclable materials, 0% CO2 emissions',
                                    style: TextStyle(fontSize: 12.0),
                                  ),
                                ),
                              ],
                            ),
                            const Row(
                              children: [
                                Icon(Icons.check_circle_outline),
                                Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Text(
                                    'Hyphoallergenic: 100% natural, human friendly ingredients.',
                                    style: TextStyle(fontSize: 12.0),
                                  ),
                                ),
                              ],
                            ),
                            const Row(
                              children: [
                                Icon(Icons.check_circle_outline),
                                Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Text(
                                    'Handmade: All candles are craftly made with love.',
                                    style: TextStyle(fontSize: 12.0),
                                  ),
                                ),
                              ],
                            ),
                            const Row(
                              children: [
                                Icon(Icons.check_circle_outline),
                                Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Text(
                                    'Long burning: No more waste. Created for last long.',
                                    style: TextStyle(fontSize: 12.0),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 20.0,
                            ),
                            ElevatedButton(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.green,
                                elevation: 12.0,
                              ),
                              child: const Text(
                                'Learn More',
                                style: TextStyle(color: Colors.white),
                              ),
                            )
                          ],
                        ),
                        const SizedBox(
                          width: 50.0,
                        ),
                        const Image(
                          image:
                              AssetImage('assets/pictures/clean-and-wax.png'),
                          width: 300,
                          height: 300,
                        ),
                      ],
                    ),
                  ),
                  // testemonial
                  Container(
                    height: MediaQuery.of(context).size.height * 0.6,
                    width: MediaQuery.of(context).size.width,
                    color: const Color(0xff56B280).withOpacity(0.1),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const SizedBox(
                          height: 20.0,
                        ),
                        const Text(
                          'Testemonial',
                          style: TextStyle(
                              fontSize: 20.0, fontWeight: FontWeight.bold),
                        ),
                        const Text('Some quotes from our happy customers'),
                        SizedBox(
                          width: MediaQuery.of(context).size.width,
                          height: 250,
                          child: PageView.builder(
                            controller: PageController(
                                viewportFraction:
                                    0.7), // Show more than one item
                            scrollDirection: Axis
                                .horizontal, // Set scroll direction to vertical
                            itemCount: testimonials.length,
                            itemBuilder: (context, index) {
                              final testimonial = testimonials[index];
                              return Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: SizedBox(
                                  height: 50,
                                  width: 50,
                                  child: TestemonialSingle(
                                    name: testimonial['name'],
                                    review: testimonial['review'],
                                    rating: testimonial['rating'],
                                    profilePicture:
                                        testimonial['profilePicture'],
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
