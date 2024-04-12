import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
   Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late TabController _tabController;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SingleChildScrollView(
          child: Container(
            constraints: const BoxConstraints(maxWidth: 750),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              const Padding(
                padding: EdgeInsets.fromLTRB(90, 0, 10, 0),
                child: Text(
                  'Hello, John Doe!',
                  style: TextStyle(
                      fontSize: 35,
                      fontWeight: FontWeight.bold,
                      color: Colors.green),
                ),
              ),
              const Padding(
                padding: EdgeInsets.fromLTRB(90, 2, 0, 0),
                child: Row(
                  children: [
                    SizedBox(width: 6),
                    Text(
                      '16 December, 2023',
                      style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    )
                  ],
                ),
              ),
              const SizedBox(height: 8),
              Container(
                padding: const EdgeInsets.fromLTRB(90, 0, 105, 0),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Expanded(child: Divider(color: Colors.green)),
                    Padding(
                      padding: EdgeInsets.fromLTRB(2, 0, 0, 0),
                      child: Text(
                        'Notifications',
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.normal),
                      ),
                    ),
                    Expanded(child: Divider(color: Colors.green)),
                  ],
                ),
              ),
              const SizedBox(height: 5),
              Container(
                width: 700,
                margin: const EdgeInsets.fromLTRB(100, 0, 100, 0),
                padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                decoration: BoxDecoration(
                  color: Colors.orangeAccent,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  children: [
                    // Icon and Text "Customer X" and "16 December 2023" in a Column
                    const Row(
                      children: [
                        Icon(Icons.content_paste,
                            size: 50,
                            color: Colors.white), // Icon before "Customer X"
                        SizedBox(width: 5), // Spacer between icon and text
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Customer X',
                              style: TextStyle(
                                color: Colors
                                    .white, // White text color for better visibility
                                fontSize: 35,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              '16 December 2023',
                              style: TextStyle(
                                color: Colors
                                    .white, // White text color for better visibility
                                fontSize: 18,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),

                    // Spacer to push the "Order" text and arrows to the right
                    const Spacer(),

                    //Text Order
                    Row(
                      children: [
                        const Text(
                          'Order',
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.normal,
                              color: Colors.white),
                        ),
                        GestureDetector(
                            onTap: () {
                              _tabController.animateTo(
                                  3); // Assuming the order tab index is 3
                            },
                            child: const Icon(
                              Icons.keyboard_double_arrow_right_outlined,
                              size: 50, // Set the size of the icon
                              color: Colors.white, // Set the color of the icon
                            )),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 3),
              //Team A
              Container(
                width: 700,
                margin: const EdgeInsets.fromLTRB(100, 0, 100, 0),
                padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                decoration: BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  children: [
                    // Icon and Text "Customer X" and "16 December 2023" in a Column
                    const Row(
                      children: [
                        Icon(Icons.local_shipping,
                            size: 50,
                            color: Colors.white), // Icon before "Customer X"
                        SizedBox(width: 5), // Spacer between icon and text
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Team A',
                              style: TextStyle(
                                color: Colors
                                    .white, // White text color for better visibility
                                fontSize: 35,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              '15 December 2023',
                              style: TextStyle(
                                color: Colors
                                    .white, // White text color for better visibility
                                fontSize: 18,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),

                    // Spacer to push the "Order" text and arrows to the right
                    const Spacer(),

                    //Text Order
                    Row(
                      children: [
                        const Text(
                          'Report',
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.normal,
                              color: Colors.white),
                        ),
                        GestureDetector(
                            onTap: () {
                              _tabController.animateTo(
                                  4); // Assuming the order tab index is 3
                            },
                            child: const Icon(
                              Icons.keyboard_double_arrow_right_outlined,
                              size: 50, // Set the size of the icon
                              color: Colors.white, // Set the color of the icon
                            )),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 3),

              //Team B
              Container(
                width: 700,
                margin: const EdgeInsets.fromLTRB(100, 0, 100, 0),
                padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                decoration: BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  children: [
                    // Icon and Text "Customer X" and "16 December 2023" in a Column
                    const Row(
                      children: [
                        Icon(Icons.local_shipping,
                            size: 50,
                            color: Colors.white), // Icon before "Team B"
                        SizedBox(width: 5), // Spacer between icon and text
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Team B',
                              style: TextStyle(
                                color: Colors
                                    .white, // White text color for better visibility
                                fontSize: 35,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              '15 December 2023',
                              style: TextStyle(
                                color: Colors
                                    .white, // White text color for better visibility
                                fontSize: 18,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),

                    // Spacer to push the "Order" text and arrows to the right
                    const Spacer(),

                    //Text Order
                    Row(
                      children: [
                        const Text(
                          'Report',
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.normal,
                              color: Colors.white),
                        ),
                        GestureDetector(
                            onTap: () {
                              _tabController.animateTo(
                                  4); // Assuming the order tab index is 3
                            },
                            child: const Icon(
                              Icons.keyboard_double_arrow_right_outlined,
                              size: 50, // Set the size of the icon
                              color: Colors.white, // Set the color of the icon
                            )),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 3),
              //Customer Y
              Container(
                width: 700,
                margin: const EdgeInsets.fromLTRB(100, 0, 100, 0),
                padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                decoration: BoxDecoration(
                  color: Colors.orange,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  children: [
                    // Icon and Text "Customer X" and "16 December 2023" in a Column
                    const Row(
                      children: [
                        Icon(Icons.content_paste,
                            size: 50,
                            color: Colors.white), // Icon before "Customer X"
                        SizedBox(width: 5), // Spacer between icon and text
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Customer Y',
                              style: TextStyle(
                                color: Colors
                                    .white, // White text color for better visibility
                                fontSize: 35,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              '15 December 2023',
                              style: TextStyle(
                                color: Colors
                                    .white, // White text color for better visibility
                                fontSize: 18,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),

                    // Spacer to push the "Order" text and arrows to the right
                    const Spacer(),

                    //Text Order
                    Row(
                      children: [
                        const Text(
                          'Order',
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.normal,
                              color: Colors.white),
                        ),
                        GestureDetector(
                            onTap: () {
                              _tabController.animateTo(
                                  3); // Assuming the order tab index is 3
                            },
                            child: const Icon(
                              Icons.keyboard_double_arrow_right_outlined,
                              size: 50, // Set the size of the icon
                              color: Colors.white, // Set the color of the icon
                            )),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 3),

              //Customer Z
              Container(
                width: 700,
                margin: const EdgeInsets.fromLTRB(100, 0, 100, 0),
                padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                decoration: BoxDecoration(
                  color: Colors.orange,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  children: [
                    // Icon and Text "Customer X" and "16 December 2023" in a Column
                    const Row(
                      children: [
                        Icon(Icons.content_paste,
                            size: 50,
                            color: Colors.white), // Icon before "Customer X"
                        SizedBox(width: 5), // Spacer between icon and text
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Customer Z',
                              style: TextStyle(
                                color: Colors
                                    .white, // White text color for better visibility
                                fontSize: 35,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              '15 December 2023',
                              style: TextStyle(
                                color: Colors
                                    .white, // White text color for better visibility
                                fontSize: 18,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),

                    // Spacer to push the "Order" text and arrows to the right
                    const Spacer(),

                    //Text Order
                    Row(
                      children: [
                        const Text(
                          'Order',
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.normal,
                              color: Colors.white),
                        ),
                        GestureDetector(
                            onTap: () {
                              _tabController.animateTo(
                                  3); // Assuming the order tab index is 3
                            },
                            child: const Icon(
                              Icons.keyboard_double_arrow_right_outlined,
                              size: 50, // Set the size of the icon
                              color: Colors.white, // Set the color of the icon
                            )),
                      ],
                    ),
                  ],
                ),
              ),
            ]),
          ),
        ),
        // Right panel for Home
        Expanded(
          child: Container(
              padding: const EdgeInsets.fromLTRB(25, 10, 25, 0),
              color: Colors.blue[50],
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'TOP TEAM per week',
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(vertical: 3.0),
                      height: 1.0,
                      color: Colors.green,
                    ),
                    Row(
                      children: [
                        const CircleAvatar(
                          radius: 25,
                          backgroundImage: AssetImage('images/truck1.png'),
                        ),
                        const SizedBox(width: 8.0),
                        const Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Team A',
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black)),
                            Text('20 Deliveries',
                                style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.normal,
                                    color: Colors.black)),
                          ],
                        ),
                        Expanded(child: Container()),
                        const Text(
                          '>',
                          style: TextStyle(fontSize: 50, color: Colors.green),
                        ),
                      ],
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 3.0),
                      height: 1.0,
                      color: Colors.green,
                    ),

                    Row(
                      children: [
                        const CircleAvatar(
                          radius: 25,
                          backgroundImage: AssetImage('images/truck1.png'),
                        ),
                        const SizedBox(width: 8.0),
                        const Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Team B',
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black)),
                            Text('18 Deliveries',
                                style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.normal,
                                    color: Colors.black)),
                          ],
                        ),
                        Expanded(child: Container()),
                        const Text(
                          '>',
                          style: TextStyle(fontSize: 50, color: Colors.green),
                        ),
                      ],
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 3.0),
                      height: 1.0,
                      color: Colors.green,
                    ),

                    Row(
                      children: [
                        const CircleAvatar(
                          radius: 25,
                          backgroundImage: AssetImage('images/truck1.png'),
                        ),
                        const SizedBox(width: 8.0),
                        const Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Team C',
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black)),
                            Text('18 Deliveries',
                                style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.normal,
                                    color: Colors.black)),
                          ],
                        ),
                        Expanded(child: Container()),
                        const Text(
                          '>',
                          style: TextStyle(fontSize: 50, color: Colors.green),
                        ),
                      ],
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 3.0),
                      height: 1.0,
                      color: Colors.green,
                    ),

                    // Separation
                    // Expanded(child: Container()),
                    Container(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Text(
                            'Accomplished Deliveries',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20.0,
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.symmetric(vertical: 8.0),
                            height: 1.0,
                            color: Colors.orange,
                          ), // orange line

                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: Column(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.stretch,
                                  children: [
                                    const Text('Delivery',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold)),
                                    Container(
                                      margin: const EdgeInsets.symmetric(
                                          vertical: 8.0),
                                      height: 1.0,
                                      color: Colors.orange,
                                    ),
                                    const Text('2023054'),
                                    const Text('2023053'),
                                    const Text('2023052'),
                                    const Text('2023051'),
                                    const Text('2023050'),
                                  ],
                                ),
                              ),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    const Text('Truck Team',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold)),
                                    Container(
                                      margin: const EdgeInsets.symmetric(
                                          vertical: 8.0),
                                      height: 1.0,
                                      color: Colors.orange,
                                    ),
                                    const Text('GDC523'),
                                    const Text('GDL897'),
                                    const Text('GDC523'),
                                    const Text('GDL897'),
                                    const Text('GDC523'),
                                  ],
                                ),
                              ),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    const Text('Date',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold)),
                                    Container(
                                      margin: const EdgeInsets.symmetric(
                                          vertical: 8.0),
                                      height: 1.0,
                                      color: Colors.orange,
                                    ),
                                    const Text('12-16-2023'),
                                    const Text('12-16-2023'),
                                    const Text('12-15-2023'),
                                    const Text('12-15-2023'),
                                    const Text('12-15-2023'),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ])),
        ),
      ],
    );
  }
}
