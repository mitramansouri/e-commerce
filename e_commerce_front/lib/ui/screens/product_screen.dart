import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({super.key});

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
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
  String? selectedValue;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // menu ( it has to be modified later )
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
          // body
          Expanded(
            child: SingleChildScrollView(
              child: Container(
                color: Colors.amber,
                child: Column(
                  // mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IntrinsicHeight(
                      child: Row(
                        children: [
                          const SizedBox(
                            width: 50.0,
                          ),
                          // picture
                          Column(
                            // crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Image(
                                image: const AssetImage(
                                    'assets/pictures/product_single.png'),
                                width: MediaQuery.of(context).size.width * 0.4,
                                height: MediaQuery.of(context).size.width * 0.4,
                              ),
                              const SizedBox(
                                width: 200.0,
                                child: Text(
                                  'All hand-made with natural soy wax, Candleaf is made for your pleasure moments. ',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                              ),
                              const SizedBox(
                                height: 10.0,
                              ),
                              const Row(
                                children: [
                                  Icon(Icons.fire_truck),
                                  Text(
                                    ' FREE SHIPPING',
                                    style: TextStyle(color: Colors.green),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 20.0,
                              ),
                            ],
                          ),
                          const SizedBox(
                            width: 20.0,
                          ),
                          // spice mint column
                          Expanded(
                            child: Container(
                              color: Colors.black,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  const Text(
                                    'Spiced Mint Candleaf®',
                                    style: TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
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
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
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
            ),
          ),
        ],
      ),
    );
  }
}
