import 'package:flutter/material.dart';
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
                  
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
