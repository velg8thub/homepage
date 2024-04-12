// ignore_for_file: sort_child_properties_last

import 'dart:html';
import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  String selectedItem = 'Home'; // Tracks the selected menu item
  bool isMouseOverHome = false;
  String greetingText = ''; // Local variable for greeting text
  TextEditingController searchController =
      TextEditingController(); // Search feature that displays a list of words when clicked
  List<String> suggestions = [
    'Delivery View',
    'View Order',
    'Profile',
    'Trucks',
    'View Payroll',
    'Staff List',
    'Add Staff'
  ];

  bool searchResults =
      false; // Added a boolean showSearchResults to control the visibility of the search results.
  bool isSidePanelExpanded = false;

  BuildContext get index => index;
  bool overlayVisible = false;
  bool showOverlay = false; // Initially set to true to show the overlay
  bool tileTapped = false; // Flag to track if a ListTile is tapped
  bool showTruckInfo = false;
  bool isHovered = false;
  bool showFirstContainer = true;
  bool popOverlay = true;
  bool showAddTruck = true;
  bool showRemoveTruck = true;
  bool showAnimatedPop = true;
  bool selectTruckColorChanged = true;
  bool click = false;
  bool _isColorChanged = true;
  bool showListView = true;
  bool showStaffContainer = true;
  bool showTruckContainer = true;
  bool showPayrollContainer = true;
  bool hideSidePanel = true;
  bool isPoppedOut = false; // add new employee

  Color _containerColor = Colors.transparent;
  //container backgroun color(truck list)
  void _toggleColor() {
    setState(() {
      _isColorChanged = !_isColorChanged;
      _containerColor =
          _isColorChanged ? Colors.transparent : Colors.amberAccent.shade700;
    });
  }

  void _showListView() {
    setState(() {
      showListView = !showListView;
    });
  }

  void _handleOverlay() {
    overlayEntry?.remove();
    overlayEntry = null;
  }

  void _hideSidePanel() {
    setState(() {
      hideSidePanel = true;
    });
  }

  set isHomeHovered(bool isHomeHovered) {}

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 6, vsync: this);
    _tabController.addListener(_handleTabSelection);

    searchController.addListener(() {
      if (searchController.text.isEmpty) {
        setState(() {
          searchResults = false;
        });
      }
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  OverlayEntry? overlayEntry;

  void _switchToTab(int index) {
    setState(() {});
    _tabController.animateTo(index); // Switch to the selected tab
  }

  void _handleTabSelection() {
    setState(() {
      switch (_tabController.index) {
        case 0:
          selectedItem = 'Home';
          break;
        case 1:
          selectedItem = 'Staff';
          break;
        case 2:
          selectedItem = 'Truck';
          break;
        case 3:
          selectedItem = 'Order';
          break;
        case 4:
          selectedItem = 'Delivery';
          break;
        case 5:
          selectedItem = 'Payroll';
          break;
      }
      greetingText = 'Selected: $selectedItem';
    });
  }

  void _handleItemSelection(String selectedItem) {
    setState(() {
      switch (selectedItem) {
        case 'Delivery View':
          _tabController.animateTo(4);
          break;
        case 'View Order':
          _tabController.animateTo(3);
          break;
        case 'Profile':
          _tabController.animateTo(0);
          break;
        case 'Trucks':
          _tabController.animateTo(2);
          break;
        case 'View Payroll':
          _tabController.animateTo(5);
          break;
        case 'Staff List':
          _tabController.animateTo(1);
          break;
        case 'Add Staff':
          _tabController.animateTo(1);
          break;
        case 'Settings':
          // Handle Settings
          break;
      }
      searchResults = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          // Left Side Panel (Side Menu Buttons)
          Container(
            alignment: Alignment.centerRight,
            child: AnimatedContainer(
              width: isSidePanelExpanded ? 190 : 90,
              duration: const Duration(milliseconds: 200),
              curve: Curves.easeInOut,
              color: Colors.blue[100],
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(10.0, 16.0, 8.0, 8.0),
                    child: Image.asset(
                      'images/logoTech.png',
                      height: 100,
                      width: 150,
                      fit: BoxFit.contain,
                    ),
                  ),
                  Expanded(child: Container()),
                  GestureDetector(
                    onTap: () {
                      // Navigate to the 'Home' tab
                      // You can replace YourTabScreen with the actual screen you want to navigate to
                    },
                    child: sideMenuButton(
                      'Home',
                      selectedItem == 'Home'
                          ? Colors.white
                          : Colors.transparent,
                      Icons.home_rounded,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      // Handle onTap for 'Staff'
                    },
                    child: sideMenuButton(
                      'Staff',
                      selectedItem == 'Staff'
                          ? Colors.white
                          : Colors.transparent,
                      Icons.groups_rounded,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      // Handle onTap for 'Truck'
                    },
                    child: sideMenuButton(
                      'Truck',
                      selectedItem == 'Truck'
                          ? Colors.white
                          : Colors.transparent,
                      Icons.local_shipping,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      // Handle onTap for 'Order'
                    },
                    child: sideMenuButton(
                      'Order',
                      selectedItem == 'Order'
                          ? Colors.white
                          : Colors.transparent,
                      Icons.shopping_cart,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      // Handle onTap for 'Delivery'
                    },
                    child: sideMenuButton(
                      'Delivery',
                      selectedItem == 'Delivery'
                          ? Colors.white
                          : Colors.transparent,
                      Icons.delivery_dining,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      // Handle onTap for 'Payroll'
                    },
                    child: sideMenuButton(
                      'Payroll',
                      selectedItem == 'Payroll'
                          ? Colors.white
                          : Colors.transparent,
                      Icons.attach_money,
                    ),
                  ),
                  // Add more menu items as needed
                  Expanded(child: Container()),
                  GestureDetector(
                    onTap: () {
                      // Navigate to the 'Settings' tab
                    },
                    child: sideMenuButton(
                      'Settings',
                      selectedItem == 'Settings'
                          ? Colors.white
                          : Colors.transparent,
                      Icons.settings,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      // Perform logout action here
                    },
                    child: sideMenuButton(
                      'Log Out',
                      selectedItem == 'Log Out'
                          ? Colors.white
                          : Colors.transparent,
                      Icons.exit_to_app,
                    ),
                  ),
                ],
              ),
            ),
          ),

          Expanded(
            child: Column(
              children: [
                // Top Section with Search Bar
                Container(
                  height: 70,
                  color: Colors.blue,
                  child: Row(
                    children: [
                      const SizedBox(width: 10), // Add some space

                      // Middle Section (Search bar)
                      Expanded(
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                child: ElevatedButton(
                                  onPressed: () {
                                    if (overlayEntry != null) {
                                      overlayEntry?.remove();
                                      overlayEntry = null;
                                    } else {
                                      overlayEntry = OverlayEntry(
                                        builder: (context) => Positioned(
                                          top: 60.0,
                                          left: 100.0,
                                          right: 800.0,
                                          height: 200.0,
                                          child: Material(
                                            child: Container(
                                              width: 200.0,
                                              height: 200.0,
                                              decoration: BoxDecoration(
                                                color: Colors.grey.shade200,
                                                borderRadius: BorderRadius.circular(
                                                    8.0), // Set the border radius
                                              ),
                                              child: Center(
                                                child: SingleChildScrollView(
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Scrollbar(
                                                        child: ListView(
                                                          shrinkWrap: true,
                                                          children: [
                                                            Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                      .fromLTRB(
                                                                      10,
                                                                      0,
                                                                      10,
                                                                      0),
                                                              child: ListTile(
                                                                leading: const Icon(
                                                                    Icons
                                                                        .content_paste_search_rounded),
                                                                title: const Text(
                                                                    'Delivery View'),
                                                                onTap: () {
                                                                  setState(() {
                                                                    selectedItem =
                                                                        'Delivery view';
                                                                    _tabController
                                                                        .animateTo(
                                                                            4);
                                                                  });
                                                                  overlayEntry
                                                                      ?.remove();
                                                                  overlayEntry =
                                                                      null;
                                                                },
                                                              ),
                                                            ),
                                                            const SizedBox(
                                                                height: 5),
                                                            Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                      .fromLTRB(
                                                                      10,
                                                                      0,
                                                                      10,
                                                                      0),
                                                              child: Container(
                                                                margin: const EdgeInsets
                                                                    .symmetric(
                                                                    vertical:
                                                                        3.0),
                                                                height: 3.0,
                                                                color: Colors
                                                                    .white,
                                                              ),
                                                            ),
                                                            const SizedBox(
                                                                height: 5),
                                                            Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                      .fromLTRB(
                                                                      10,
                                                                      0,
                                                                      10,
                                                                      0),
                                                              child: ListTile(
                                                                leading: const Icon(
                                                                    Icons
                                                                        .content_paste_search_rounded),
                                                                title: const Text(
                                                                    'View Order'),
                                                                onTap: () {
                                                                  setState(() {
                                                                    selectedItem =
                                                                        'View Order';
                                                                    _tabController
                                                                        .animateTo(
                                                                            3);
                                                                  });
                                                                  overlayEntry
                                                                      ?.remove();
                                                                  overlayEntry =
                                                                      null;
                                                                },
                                                              ),
                                                            ),
                                                            const SizedBox(
                                                                height: 5),
                                                            Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                      .fromLTRB(
                                                                      10,
                                                                      0,
                                                                      10,
                                                                      0),
                                                              child: Container(
                                                                margin: const EdgeInsets
                                                                    .symmetric(
                                                                    vertical:
                                                                        3.0),
                                                                height: 3.0,
                                                                color: Colors
                                                                    .white,
                                                              ),
                                                            ),
                                                            const SizedBox(
                                                                height: 5),
                                                            Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                      .fromLTRB(
                                                                      10,
                                                                      0,
                                                                      10,
                                                                      0),
                                                              child: ListTile(
                                                                leading: const Icon(
                                                                    Icons
                                                                        .comment),
                                                                title: const Text(
                                                                    'Profile'),
                                                                onTap: () {
                                                                  setState(() {
                                                                    selectedItem =
                                                                        'Profile';
                                                                    _tabController
                                                                        .animateTo(
                                                                            0);
                                                                  });
                                                                  overlayEntry
                                                                      ?.remove();
                                                                  overlayEntry =
                                                                      null;
                                                                },
                                                              ),
                                                            ),
                                                            Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                      .fromLTRB(
                                                                      10,
                                                                      0,
                                                                      10,
                                                                      0),
                                                              child: Container(
                                                                margin: const EdgeInsets
                                                                    .symmetric(
                                                                    vertical:
                                                                        3.0),
                                                                height: 3.0,
                                                                color: Colors
                                                                    .white,
                                                              ),
                                                            ),
                                                            const SizedBox(
                                                                height: 5),
                                                            Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                      .fromLTRB(
                                                                      10,
                                                                      0,
                                                                      10,
                                                                      0),
                                                              child: ListTile(
                                                                leading: const Icon(
                                                                    Icons
                                                                        .comment),
                                                                title: const Text(
                                                                    'Trucks'),
                                                                onTap: () {
                                                                  setState(() {
                                                                    selectedItem =
                                                                        'Trucks';
                                                                    _tabController
                                                                        .animateTo(
                                                                            2);
                                                                  });
                                                                  overlayEntry
                                                                      ?.remove();
                                                                  overlayEntry =
                                                                      null;
                                                                },
                                                              ),
                                                            ),
                                                            Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                      .fromLTRB(
                                                                      10,
                                                                      0,
                                                                      10,
                                                                      0),
                                                              child: Container(
                                                                margin: const EdgeInsets
                                                                    .symmetric(
                                                                    vertical:
                                                                        3.0),
                                                                height: 3.0,
                                                                color: Colors
                                                                    .white,
                                                              ),
                                                            ),
                                                            const SizedBox(
                                                                height: 5),
                                                            Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                      .fromLTRB(
                                                                      10,
                                                                      0,
                                                                      10,
                                                                      0),
                                                              child: ListTile(
                                                                leading: const Icon(
                                                                    Icons
                                                                        .content_paste_search_rounded),
                                                                title: const Text(
                                                                    'View Payroll'),
                                                                onTap: () {
                                                                  setState(() {
                                                                    selectedItem =
                                                                        'View Payroll';
                                                                    _tabController
                                                                        .animateTo(
                                                                            5);
                                                                  });
                                                                  overlayEntry
                                                                      ?.remove();
                                                                  overlayEntry =
                                                                      null;
                                                                },
                                                              ),
                                                            ),
                                                            Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                      .fromLTRB(
                                                                      10,
                                                                      0,
                                                                      10,
                                                                      0),
                                                              child: Container(
                                                                margin: const EdgeInsets
                                                                    .symmetric(
                                                                    vertical:
                                                                        3.0),
                                                                height: 3.0,
                                                                color: Colors
                                                                    .white,
                                                              ),
                                                            ),
                                                            const SizedBox(
                                                                height: 5),
                                                            Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                      .fromLTRB(
                                                                      10,
                                                                      0,
                                                                      10,
                                                                      0),
                                                              child: ListTile(
                                                                leading: const Icon(
                                                                    Icons
                                                                        .comment),
                                                                title: const Text(
                                                                    'Staff List'),
                                                                onTap: () {
                                                                  setState(() {
                                                                    selectedItem =
                                                                        'Staff List';
                                                                    _tabController
                                                                        .animateTo(
                                                                            1);
                                                                  });
                                                                  overlayEntry
                                                                      ?.remove();
                                                                  overlayEntry =
                                                                      null;
                                                                },
                                                              ),
                                                            ),
                                                            Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                      .fromLTRB(
                                                                      10,
                                                                      0,
                                                                      10,
                                                                      0),
                                                              child: Container(
                                                                margin: const EdgeInsets
                                                                    .symmetric(
                                                                    vertical:
                                                                        3.0),
                                                                height: 3.0,
                                                                color: Colors
                                                                    .white,
                                                              ),
                                                            ),
                                                            const SizedBox(
                                                                height: 5),
                                                            Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                      .fromLTRB(
                                                                      10,
                                                                      0,
                                                                      10,
                                                                      0),
                                                              child: ListTile(
                                                                leading: const Icon(
                                                                    Icons
                                                                        .content_paste_search_rounded),
                                                                title: const Text(
                                                                    'Add Staff'),
                                                                onTap: () {
                                                                  setState(() {
                                                                    selectedItem =
                                                                        'Add Staff';
                                                                    _tabController
                                                                        .animateTo(
                                                                            1);
                                                                  });
                                                                  overlayEntry
                                                                      ?.remove();
                                                                  overlayEntry =
                                                                      null;
                                                                },
                                                              ),
                                                            ),
                                                            Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                      .fromLTRB(
                                                                      10,
                                                                      0,
                                                                      10,
                                                                      0),
                                                              child: Container(
                                                                margin: const EdgeInsets
                                                                    .symmetric(
                                                                    vertical:
                                                                        3.0),
                                                                height: 3.0,
                                                                color: Colors
                                                                    .white,
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      );
                                      Overlay.of(context)
                                          ?.insert(overlayEntry!);
                                    }
                                  },
                                  style: ElevatedButton.styleFrom(
                                    elevation: 0,
                                    shape: const RoundedRectangleBorder(
                                      borderRadius: BorderRadius.horizontal(
                                        left: Radius.circular(5),
                                        right: Radius.circular(5),
                                      ),
                                    ),
                                    backgroundColor: Colors.grey[200],
                                  ),
                                  child: const Row(
                                    children: [
                                      Icon(Icons.search, color: Colors.black),
                                      SizedBox(
                                          width:
                                              8), // Add some spacing between icon and text
                                      Text('Search order, deliveries and more',
                                          style: TextStyle(
                                              fontWeight: FontWeight.normal,
                                              color: Colors.grey)),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),

                      //separation
                      Expanded(child: Container()),

                      if (popOverlay)
                        // Right Section (Notification bell, Menu icon, Profile picture)
                        Row(
                          children: [
                            // Notification bell
                            menuIcon(Icons.notifications, Colors.white),
                            const SizedBox(width: 10),
                            // Menu icon
                            menuIcon(Icons.menu, Colors.white),
                            const SizedBox(width: 10),
                            // Profile picture
                            menuIcon(Icons.account_circle, Colors.white),
                            const SizedBox(width: 10),
                          ],
                        ),
                    ],
                  ),
                ),

                Container(
                  margin: const EdgeInsets.symmetric(vertical: 0.0),
                  height: 5.0,
                  color: Colors.yellow,
                ),

                // Expanded Section with TabBarView
                Expanded(
                  flex: 4,
                  child: TabBarView(
                    controller: _tabController,
                    children: [
                      // Home Tab Content
                      Row(
                        children: [
                          SingleChildScrollView(
                            child: Container(
                              constraints: const BoxConstraints(maxWidth: 750),
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Padding(
                                      padding:
                                          EdgeInsets.fromLTRB(90, 0, 10, 0),
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
                                      padding: const EdgeInsets.fromLTRB(
                                          90, 0, 105, 0),
                                      child: const Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Expanded(
                                              child:
                                                  Divider(color: Colors.green)),
                                          Padding(
                                            padding:
                                                EdgeInsets.fromLTRB(2, 0, 0, 0),
                                            child: Text(
                                              'Notifications',
                                              style: TextStyle(
                                                  fontSize: 14,
                                                  fontWeight:
                                                      FontWeight.normal),
                                            ),
                                          ),
                                          Expanded(
                                              child:
                                                  Divider(color: Colors.green)),
                                        ],
                                      ),
                                    ),
                                    const SizedBox(height: 5),
                                    Container(
                                      width: 700,
                                      margin: const EdgeInsets.fromLTRB(
                                          100, 0, 100, 0),
                                      padding: const EdgeInsets.fromLTRB(
                                          10, 0, 0, 0),
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
                                                  color: Colors
                                                      .white), // Icon before "Customer X"
                                              SizedBox(
                                                  width:
                                                      5), // Spacer between icon and text
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    'Customer X',
                                                    style: TextStyle(
                                                      color: Colors
                                                          .white, // White text color for better visibility
                                                      fontSize: 35,
                                                      fontWeight:
                                                          FontWeight.bold,
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
                                                    fontWeight:
                                                        FontWeight.normal,
                                                    color: Colors.white),
                                              ),
                                              GestureDetector(
                                                  onTap: () {
                                                    _tabController.animateTo(
                                                        3); // Assuming the order tab index is 3
                                                  },
                                                  child: const Icon(
                                                    Icons
                                                        .keyboard_double_arrow_right_outlined,
                                                    size:
                                                        50, // Set the size of the icon
                                                    color: Colors
                                                        .white, // Set the color of the icon
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
                                      margin: const EdgeInsets.fromLTRB(
                                          100, 0, 100, 0),
                                      padding: const EdgeInsets.fromLTRB(
                                          10, 0, 0, 0),
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
                                                  color: Colors
                                                      .white), // Icon before "Customer X"
                                              SizedBox(
                                                  width:
                                                      5), // Spacer between icon and text
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    'Team A',
                                                    style: TextStyle(
                                                      color: Colors
                                                          .white, // White text color for better visibility
                                                      fontSize: 35,
                                                      fontWeight:
                                                          FontWeight.bold,
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
                                                    fontWeight:
                                                        FontWeight.normal,
                                                    color: Colors.white),
                                              ),
                                              GestureDetector(
                                                  onTap: () {
                                                    _tabController.animateTo(
                                                        4); // Assuming the order tab index is 3
                                                  },
                                                  child: const Icon(
                                                    Icons
                                                        .keyboard_double_arrow_right_outlined,
                                                    size:
                                                        50, // Set the size of the icon
                                                    color: Colors
                                                        .white, // Set the color of the icon
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
                                      margin: const EdgeInsets.fromLTRB(
                                          100, 0, 100, 0),
                                      padding: const EdgeInsets.fromLTRB(
                                          10, 0, 0, 0),
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
                                                  color: Colors
                                                      .white), // Icon before "Team B"
                                              SizedBox(
                                                  width:
                                                      5), // Spacer between icon and text
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    'Team B',
                                                    style: TextStyle(
                                                      color: Colors
                                                          .white, // White text color for better visibility
                                                      fontSize: 35,
                                                      fontWeight:
                                                          FontWeight.bold,
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
                                                    fontWeight:
                                                        FontWeight.normal,
                                                    color: Colors.white),
                                              ),
                                              GestureDetector(
                                                  onTap: () {
                                                    _tabController.animateTo(
                                                        4); // Assuming the order tab index is 3
                                                  },
                                                  child: const Icon(
                                                    Icons
                                                        .keyboard_double_arrow_right_outlined,
                                                    size:
                                                        50, // Set the size of the icon
                                                    color: Colors
                                                        .white, // Set the color of the icon
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
                                      margin: const EdgeInsets.fromLTRB(
                                          100, 0, 100, 0),
                                      padding: const EdgeInsets.fromLTRB(
                                          10, 0, 0, 0),
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
                                                  color: Colors
                                                      .white), // Icon before "Customer X"
                                              SizedBox(
                                                  width:
                                                      5), // Spacer between icon and text
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    'Customer Y',
                                                    style: TextStyle(
                                                      color: Colors
                                                          .white, // White text color for better visibility
                                                      fontSize: 35,
                                                      fontWeight:
                                                          FontWeight.bold,
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
                                                    fontWeight:
                                                        FontWeight.normal,
                                                    color: Colors.white),
                                              ),
                                              GestureDetector(
                                                  onTap: () {
                                                    _tabController.animateTo(
                                                        3); // Assuming the order tab index is 3
                                                  },
                                                  child: const Icon(
                                                    Icons
                                                        .keyboard_double_arrow_right_outlined,
                                                    size:
                                                        50, // Set the size of the icon
                                                    color: Colors
                                                        .white, // Set the color of the icon
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
                                      margin: const EdgeInsets.fromLTRB(
                                          100, 0, 100, 0),
                                      padding: const EdgeInsets.fromLTRB(
                                          10, 0, 0, 0),
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
                                                  color: Colors
                                                      .white), // Icon before "Customer X"
                                              SizedBox(
                                                  width:
                                                      5), // Spacer between icon and text
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    'Customer Z',
                                                    style: TextStyle(
                                                      color: Colors
                                                          .white, // White text color for better visibility
                                                      fontSize: 35,
                                                      fontWeight:
                                                          FontWeight.bold,
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
                                                    fontWeight:
                                                        FontWeight.normal,
                                                    color: Colors.white),
                                              ),
                                              GestureDetector(
                                                  onTap: () {
                                                    _tabController.animateTo(
                                                        3); // Assuming the order tab index is 3
                                                  },
                                                  child: const Icon(
                                                    Icons
                                                        .keyboard_double_arrow_right_outlined,
                                                    size:
                                                        50, // Set the size of the icon
                                                    color: Colors
                                                        .white, // Set the color of the icon
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
                                padding:
                                    const EdgeInsets.fromLTRB(25, 10, 25, 0),
                                color: Colors.blue[50],
                                child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Text(
                                        'TOP TEAM per week',
                                        style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black),
                                      ),
                                      Container(
                                        margin: const EdgeInsets.symmetric(
                                            vertical: 3.0),
                                        height: 1.0,
                                        color: Colors.green,
                                      ),
                                      Row(
                                        children: [
                                          const CircleAvatar(
                                            radius: 25,
                                            backgroundImage:
                                                AssetImage('images/truck1.png'),
                                          ),
                                          const SizedBox(width: 8.0),
                                          const Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text('Team A',
                                                  style: TextStyle(
                                                      fontSize: 20,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: Colors.black)),
                                              Text('20 Deliveries',
                                                  style: TextStyle(
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.normal,
                                                      color: Colors.black)),
                                            ],
                                          ),
                                          Expanded(child: Container()),
                                          const Text(
                                            '>',
                                            style: TextStyle(
                                                fontSize: 50,
                                                color: Colors.green),
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
                                            backgroundImage:
                                                AssetImage('images/truck1.png'),
                                          ),
                                          const SizedBox(width: 8.0),
                                          const Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text('Team B',
                                                  style: TextStyle(
                                                      fontSize: 20,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: Colors.black)),
                                              Text('18 Deliveries',
                                                  style: TextStyle(
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.normal,
                                                      color: Colors.black)),
                                            ],
                                          ),
                                          Expanded(child: Container()),
                                          const Text(
                                            '>',
                                            style: TextStyle(
                                                fontSize: 50,
                                                color: Colors.green),
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
                                            backgroundImage:
                                                AssetImage('images/truck1.png'),
                                          ),
                                          const SizedBox(width: 8.0),
                                          const Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text('Team C',
                                                  style: TextStyle(
                                                      fontSize: 20,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: Colors.black)),
                                              Text('18 Deliveries',
                                                  style: TextStyle(
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.normal,
                                                      color: Colors.black)),
                                            ],
                                          ),
                                          Expanded(child: Container()),
                                          const Text(
                                            '>',
                                            style: TextStyle(
                                                fontSize: 50,
                                                color: Colors.green),
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
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
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
                                              margin:
                                                  const EdgeInsets.symmetric(
                                                      vertical: 8.0),
                                              height: 1.0,
                                              color: Colors.orange,
                                            ), // orange line

                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Expanded(
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .stretch,
                                                    children: [
                                                      const Text('Delivery',
                                                          style: TextStyle(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold)),
                                                      Container(
                                                        margin: const EdgeInsets
                                                            .symmetric(
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
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .center,
                                                    children: [
                                                      const Text('Truck Team',
                                                          style: TextStyle(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold)),
                                                      Container(
                                                        margin: const EdgeInsets
                                                            .symmetric(
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
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment.end,
                                                    children: [
                                                      const Text('Date',
                                                          style: TextStyle(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold)),
                                                      Container(
                                                        margin: const EdgeInsets
                                                            .symmetric(
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
                      ),
                      // Staff Tab Content
                      Row(
                        children: [
                          SingleChildScrollView(
                            child: Expanded(
                              child: Container(
                                color: Colors.white,
                                child: Center(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        alignment: Alignment.centerLeft,
                                        padding: const EdgeInsets.all(10),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              children: [
                                                IconButton(
                                                    icon: const Icon(
                                                        Icons.arrow_back,
                                                        size: 35,
                                                        color: Colors.black),
                                                    onPressed: () {
                                                      // Handle back button press
                                                      Navigator.push(
                                                          context,
                                                          MaterialPageRoute(
                                                            builder: (context) =>
                                                                const Homepage(),
                                                          ));
                                                    }),
                                                const Padding(
                                                  padding: EdgeInsets.only(
                                                      left: 10.0),
                                                  child: Text(
                                                    'Staff List',
                                                    style: TextStyle(
                                                        fontSize: 35,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        color: Colors.black),
                                                  ),
                                                ),
                                                // Search Truck
                                                const SizedBox(width: 40),
                                              ],
                                            ),
                                            const SizedBox(height: 5),
                                            // Add Truck

                                            Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.fromLTRB(
                                                          25, 2, 0, 0),
                                                  child: ElevatedButton(
                                                    onPressed: () {
                                                      // Remove truck functionality here
                                                    },
                                                    child: const Text(
                                                      'Remove Employee',
                                                      style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        color: Colors.black,
                                                      ),
                                                    ),
                                                    style: ElevatedButton
                                                        .styleFrom(
                                                      shape:
                                                          const RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .horizontal(
                                                          left: Radius.circular(
                                                              2),
                                                          right:
                                                              Radius.circular(
                                                                  2),
                                                        ),
                                                      ),
                                                      backgroundColor: Colors
                                                              .grey[
                                                          300], // Background color of the button
                                                      elevation: 0,
                                                    ),
                                                  ),
                                                ),
                                                const SizedBox(width: 10),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.fromLTRB(
                                                          25, 2, 0, 0),
                                                  child: ElevatedButton(
                                                    onPressed: () {
                                                      // Add truck functionality here
                                                      showDialog(
                                                        context: context,
                                                        builder: (BuildContext
                                                            context) {
                                                          return Center(
                                                            child: Container(
                                                              height: 500,
                                                              width: 500,
                                                              child:
                                                                  AlertDialog(
                                                                backgroundColor:
                                                                    Colors
                                                                        .amberAccent
                                                                        .shade700,
                                                                title: Column(
                                                                  children: [
                                                                    Row(
                                                                      children: [
                                                                        GestureDetector(
                                                                          onTap:
                                                                              () {
                                                                            Navigator.of(context).pop();
                                                                          },
                                                                          child:
                                                                              const Icon(Icons.arrow_back),
                                                                        ),
                                                                        const SizedBox(
                                                                            width:
                                                                                80),
                                                                        const Text(
                                                                            'Add Employee'),
                                                                      ],
                                                                    ),
                                                                    const SizedBox(
                                                                        height:
                                                                            20),
                                                                  ],
                                                                ),
                                                                contentPadding:
                                                                    EdgeInsets
                                                                        .zero,
                                                                content:
                                                                    Container(
                                                                  height: 300,
                                                                  width: 900,
                                                                  child:
                                                                      DecoratedBox(
                                                                    decoration:
                                                                        const BoxDecoration(
                                                                      color: Colors
                                                                          .white,
                                                                      borderRadius:
                                                                          BorderRadius
                                                                              .vertical(
                                                                        top: Radius
                                                                            .zero,
                                                                        bottom:
                                                                            Radius.circular(10.0),
                                                                      ),
                                                                    ),
                                                                    child:
                                                                        Container(
                                                                      padding: const EdgeInsets
                                                                          .all(
                                                                          20.0),
                                                                      child:
                                                                          Column(
                                                                        mainAxisSize:
                                                                            MainAxisSize.min,
                                                                        crossAxisAlignment:
                                                                            CrossAxisAlignment.start,
                                                                        children: [
                                                                          Row(
                                                                            children: [
                                                                              const Text(
                                                                                'Staff ID:',
                                                                                style: TextStyle(fontWeight: FontWeight.bold),
                                                                              ),
                                                                              const SizedBox(width: 20),
                                                                              Container(
                                                                                height: 25,
                                                                                width: 200,
                                                                                child: TextField(
                                                                                  decoration: InputDecoration(
                                                                                    filled: true,
                                                                                    fillColor: Colors.grey[200],
                                                                                    hintText: 'Enter staff ID',
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ],
                                                                          ),
                                                                          const SizedBox(
                                                                              height: 30.0),
                                                                          Row(
                                                                            children: [
                                                                              const Text(
                                                                                'Username:',
                                                                                style: TextStyle(fontWeight: FontWeight.bold),
                                                                              ),
                                                                              const SizedBox(width: 10),
                                                                              Container(
                                                                                height: 25,
                                                                                width: 200,
                                                                                child: TextField(
                                                                                  decoration: InputDecoration(
                                                                                    filled: true,
                                                                                    fillColor: Colors.grey[200],
                                                                                    hintText: 'Enter username',
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ],
                                                                          ),
                                                                          const SizedBox(
                                                                              height: 30.0),
                                                                          Row(
                                                                            children: [
                                                                              const Text(
                                                                                'Password:',
                                                                                style: TextStyle(fontWeight: FontWeight.bold),
                                                                              ),
                                                                              const SizedBox(width: 10),
                                                                              Container(
                                                                                height: 25,
                                                                                width: 200,
                                                                                child: TextField(
                                                                                  decoration: InputDecoration(
                                                                                    filled: true,
                                                                                    fillColor: Colors.grey[200],
                                                                                    hintText: 'Enter password',
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ],
                                                                          ),
                                                                          Expanded(
                                                                              child: Container()),
                                                                          Align(
                                                                            alignment:
                                                                                Alignment.bottomCenter,
                                                                            child:
                                                                                ElevatedButton(
                                                                              onPressed: () {
                                                                                Navigator.of(context).pop();
                                                                              },
                                                                              child: const Text('Save', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black)),
                                                                              style: ElevatedButton.styleFrom(
                                                                                backgroundColor: Colors.blue.shade900, // Background color
                                                                                shape: const RoundedRectangleBorder(
                                                                                  borderRadius: BorderRadius.horizontal(
                                                                                    left: Radius.circular(10.0),
                                                                                    right: Radius.circular(10.0),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          );
                                                        },
                                                      );
                                                    },
                                                    child: const Text(
                                                      'Add New Employee',
                                                      style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        color: Colors.black,
                                                      ),
                                                    ),
                                                    style: ElevatedButton
                                                        .styleFrom(
                                                      shape:
                                                          const RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .horizontal(
                                                          left: Radius.circular(
                                                              2),
                                                          right:
                                                              Radius.circular(
                                                                  2),
                                                        ),
                                                      ),
                                                      backgroundColor: Colors
                                                              .grey[
                                                          300], // Background color of the button
                                                      elevation: 0,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            const SizedBox(height: 5),
                                            Container(
                                              width: 500,
                                              margin: const EdgeInsets.fromLTRB(
                                                  40, 10, 40, 0),
                                              padding:
                                                  const EdgeInsets.fromLTRB(
                                                      10, 0, 0, 0),
                                              decoration: BoxDecoration(
                                                color: _containerColor,
                                                border: Border.all(
                                                    color: Colors.black),
                                              ),
                                              child: Row(
                                                children: [
                                                  const CircleAvatar(
                                                    radius: 40,
                                                    backgroundColor:
                                                        Colors.white,
                                                    backgroundImage: AssetImage(
                                                        'images/truck1.png'),
                                                  ),
                                                  const SizedBox(width: 5),
                                                  const Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                        'Name',
                                                        style: TextStyle(
                                                            fontSize: 20,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            color:
                                                                Colors.black),
                                                      ),
                                                      Text(
                                                        'Staff ID',
                                                        style: TextStyle(
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            color:
                                                                Colors.black),
                                                      ),
                                                      Text(
                                                        'Position',
                                                        style: TextStyle(
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            color:
                                                                Colors.black),
                                                      ),
                                                      Text(
                                                        'Status',
                                                        style: TextStyle(
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            color:
                                                                Colors.black),
                                                      ),
                                                    ],
                                                  ),
                                                  const Spacer(),
                                                  Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment.end,
                                                    children: [
                                                      ElevatedButton(
                                                        onPressed: () {
                                                          setState(
                                                            () {
                                                              showAddTruck =
                                                                  !showAddTruck;
                                                              showRemoveTruck =
                                                                  !showRemoveTruck;
                                                              showTruckInfo =
                                                                  !showTruckInfo;
                                                              popOverlay =
                                                                  !popOverlay;
                                                              selectTruckColorChanged =
                                                                  !selectTruckColorChanged;
                                                              click = !click;
                                                              showStaffContainer =
                                                                  !showStaffContainer;
                                                              _toggleColor();
                                                            },
                                                          );
                                                        },
                                                        child: const Text(
                                                            'Select'),
                                                        style: ElevatedButton
                                                            .styleFrom(
                                                                shape:
                                                                    const RoundedRectangleBorder(
                                                                        borderRadius:
                                                                            BorderRadius
                                                                                .horizontal(
                                                                  left: Radius
                                                                      .circular(
                                                                          5),
                                                                  right: Radius
                                                                      .circular(
                                                                          5),
                                                                )),
                                                                backgroundColor:
                                                                    click
                                                                        ? Colors
                                                                            .blue
                                                                        : Colors
                                                                            .blue
                                                                            .shade200,
                                                                foregroundColor:
                                                                    click
                                                                        ? Colors
                                                                            .white
                                                                        : Colors
                                                                            .black),
                                                      ),
                                                    ],
                                                  ),
                                                  const SizedBox(width: 5),
                                                ],
                                              ),
                                            ),
                                            const SizedBox(height: 5),
                                            Container(
                                              width: 500,
                                              margin: const EdgeInsets.fromLTRB(
                                                  40, 10, 40, 0),
                                              padding:
                                                  const EdgeInsets.fromLTRB(
                                                      10, 0, 0, 0),
                                              decoration: BoxDecoration(
                                                // color: _containerColor,
                                                border: Border.all(
                                                    color: Colors.black),
                                              ),
                                              child: Row(
                                                children: [
                                                  const CircleAvatar(
                                                    radius: 40,
                                                    backgroundColor:
                                                        Colors.white,
                                                    backgroundImage: AssetImage(
                                                        'images/truck1.png'),
                                                  ),
                                                  const SizedBox(width: 5),
                                                  const Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                        'Name',
                                                        style: TextStyle(
                                                            fontSize: 20,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            color:
                                                                Colors.black),
                                                      ),
                                                      Text(
                                                        'Staff ID',
                                                        style: TextStyle(
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            color:
                                                                Colors.black),
                                                      ),
                                                      Text(
                                                        'Position',
                                                        style: TextStyle(
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            color:
                                                                Colors.black),
                                                      ),
                                                      Text(
                                                        'Status',
                                                        style: TextStyle(
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            color:
                                                                Colors.black),
                                                      ),
                                                    ],
                                                  ),
                                                  const Spacer(),
                                                  Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment.end,
                                                    children: [
                                                      ElevatedButton(
                                                        onPressed: () {},
                                                        child: const Text(
                                                            'Select'),
                                                        style: ElevatedButton
                                                            .styleFrom(
                                                                shape:
                                                                    const RoundedRectangleBorder(
                                                                        borderRadius:
                                                                            BorderRadius
                                                                                .horizontal(
                                                                  left: Radius
                                                                      .circular(
                                                                          5),
                                                                  right: Radius
                                                                      .circular(
                                                                          5),
                                                                )),
                                                                backgroundColor:
                                                                    Colors.blue
                                                                        .shade200),
                                                      ),
                                                    ],
                                                  ),
                                                  const SizedBox(width: 5),
                                                ],
                                              ),
                                            ),
                                            const SizedBox(height: 5),
                                            Container(
                                              width: 500,
                                              margin: const EdgeInsets.fromLTRB(
                                                  40, 10, 40, 0),
                                              padding:
                                                  const EdgeInsets.fromLTRB(
                                                      10, 0, 0, 0),
                                              decoration: BoxDecoration(
                                                border: Border.all(
                                                    color: Colors.black),
                                              ),
                                              child: Row(
                                                children: [
                                                  const CircleAvatar(
                                                    radius: 40,
                                                    backgroundColor:
                                                        Colors.white,
                                                    backgroundImage: AssetImage(
                                                        'images/truck1.png'),
                                                  ),
                                                  const SizedBox(width: 5),
                                                  const Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                        'Name',
                                                        style: TextStyle(
                                                            fontSize: 20,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            color:
                                                                Colors.black),
                                                      ),
                                                      Text(
                                                        'Satff ID',
                                                        style: TextStyle(
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            color:
                                                                Colors.black),
                                                      ),
                                                      Text(
                                                        'Position',
                                                        style: TextStyle(
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            color:
                                                                Colors.black),
                                                      ),
                                                      Text(
                                                        'Status',
                                                        style: TextStyle(
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            color:
                                                                Colors.black),
                                                      ),
                                                    ],
                                                  ),
                                                  const Spacer(),
                                                  Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment.end,
                                                    children: [
                                                      ElevatedButton(
                                                        onPressed: () {},
                                                        child: const Text(
                                                            'Select'),
                                                        style: ElevatedButton
                                                            .styleFrom(
                                                                shape:
                                                                    const RoundedRectangleBorder(
                                                                        borderRadius:
                                                                            BorderRadius
                                                                                .horizontal(
                                                                  left: Radius
                                                                      .circular(
                                                                          5),
                                                                  right: Radius
                                                                      .circular(
                                                                          5),
                                                                )),
                                                                backgroundColor:
                                                                    Colors.blue
                                                                        .shade200),
                                                      ),
                                                    ],
                                                  ),
                                                  const SizedBox(width: 5),
                                                ],
                                              ),
                                            ),
                                            const SizedBox(height: 5),
                                            Container(
                                              width: 500,
                                              margin: const EdgeInsets.fromLTRB(
                                                  40, 10, 40, 0),
                                              padding:
                                                  const EdgeInsets.fromLTRB(
                                                      10, 0, 0, 0),
                                              decoration: BoxDecoration(
                                                border: Border.all(
                                                    color: Colors.black),
                                              ),
                                              child: Row(
                                                children: [
                                                  const CircleAvatar(
                                                    radius: 40,
                                                    backgroundColor:
                                                        Colors.white,
                                                    backgroundImage: AssetImage(
                                                        'images/truck1.png'),
                                                  ),
                                                  const SizedBox(width: 5),
                                                  const Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                        'Name',
                                                        style: TextStyle(
                                                            fontSize: 20,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            color:
                                                                Colors.black),
                                                      ),
                                                      Text(
                                                        'Staff ID',
                                                        style: TextStyle(
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            color:
                                                                Colors.black),
                                                      ),
                                                      Text(
                                                        'Position',
                                                        style: TextStyle(
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            color:
                                                                Colors.black),
                                                      ),
                                                      Text(
                                                        'Status',
                                                        style: TextStyle(
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            color:
                                                                Colors.black),
                                                      ),
                                                    ],
                                                  ),
                                                  const Spacer(),
                                                  Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment.end,
                                                    children: [
                                                      ElevatedButton(
                                                        onPressed: () {},
                                                        child: const Text(
                                                            'Select'),
                                                        style: ElevatedButton.styleFrom(
                                                            shape: const RoundedRectangleBorder(
                                                                borderRadius: BorderRadius.horizontal(
                                                                    left: Radius
                                                                        .circular(
                                                                            5),
                                                                    right: Radius
                                                                        .circular(
                                                                            5))),
                                                            backgroundColor:
                                                                Colors.blue
                                                                    .shade200),
                                                      ),
                                                    ],
                                                  ),
                                                  const SizedBox(width: 5),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                          // Right panel for Staff
                          if (showStaffContainer)
                            Expanded(
                              child: Container(
                                height: 450,
                                margin:
                                    const EdgeInsets.fromLTRB(20, 50, 20, 20),
                                padding:
                                    const EdgeInsets.fromLTRB(25, 10, 25, 0),
                                color: Colors.yellow[100],
                                child: const Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(Icons.face_4_rounded,
                                        size: 50, color: Colors.black),
                                    SizedBox(height: 10),
                                    Text(
                                      'Select an Employee',
                                      style: TextStyle(
                                          fontSize: 24,
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                        ],
                      ),
                      // Truck Tab Content
                      Row(
                        children: [
                          SingleChildScrollView(
                            child: Expanded(
                              child: Container(
                                color: Colors.white,
                                child: Center(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        alignment: Alignment.centerLeft,
                                        padding: const EdgeInsets.all(10),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              children: [
                                                IconButton(
                                                    icon: const Icon(
                                                        Icons.arrow_back,
                                                        size: 35,
                                                        color: Colors.black),
                                                    onPressed: () {
                                                      // Handle back button press
                                                      Navigator.push(
                                                          context,
                                                          MaterialPageRoute(
                                                            builder: (context) =>
                                                                const Homepage(),
                                                          ));
                                                    }),
                                                const Padding(
                                                  padding: EdgeInsets.only(
                                                      left: 10.0),
                                                  child: Text(
                                                    'Truck List',
                                                    style: TextStyle(
                                                        fontSize: 35,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        color: Colors.black),
                                                  ),
                                                ),
                                                // Search Truck
                                                const SizedBox(width: 40),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.fromLTRB(
                                                          40, 2, 0, 0),
                                                  child: ElevatedButton.icon(
                                                    onPressed: () {
                                                      // Your search functionality here
                                                    },
                                                    icon: const Icon(
                                                        Icons.search,
                                                        color: Colors.black,
                                                        size: 30),
                                                    label: const Text(
                                                      'Search Truck',
                                                      style: TextStyle(
                                                          fontSize: 15,
                                                          fontWeight:
                                                              FontWeight.normal,
                                                          color: Colors.grey),
                                                    ),
                                                    style: ElevatedButton
                                                        .styleFrom(
                                                      shape:
                                                          const RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .horizontal(
                                                          left: Radius.circular(
                                                              5),
                                                          right:
                                                              Radius.circular(
                                                                  5),
                                                        ),
                                                      ),
                                                      backgroundColor: Colors
                                                              .grey[
                                                          300], // Background color of the button
                                                      elevation: 0,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            const SizedBox(height: 5),
                                            // Add Truck
                                            if (showFirstContainer)
                                              Padding(
                                                padding:
                                                    const EdgeInsets.fromLTRB(
                                                        25, 2, 0, 0),
                                                child: ElevatedButton(
                                                  onPressed: () {
                                                    // Add truck functionality here
                                                  },
                                                  child: const Text(
                                                    'Add Truck',
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        color: Colors.black),
                                                  ),
                                                  style:
                                                      ElevatedButton.styleFrom(
                                                    shape:
                                                        const RoundedRectangleBorder(
                                                      borderRadius: BorderRadius
                                                          .horizontal(
                                                        left:
                                                            Radius.circular(2),
                                                        right:
                                                            Radius.circular(2),
                                                      ),
                                                    ),
                                                    backgroundColor: Colors
                                                            .grey[
                                                        300], // Background color of the button
                                                    elevation: 0,
                                                  ),
                                                ),
                                              ),
                                            Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                if (!showFirstContainer) //switch
                                                  Padding(
                                                    padding: const EdgeInsets
                                                        .fromLTRB(25, 2, 0, 0),
                                                    child: ElevatedButton(
                                                      onPressed: () {
                                                        // Remove truck functionality here
                                                      },
                                                      child: const Text(
                                                        'Remove Truck',
                                                        style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          color: Colors.black,
                                                        ),
                                                      ),
                                                      style: ElevatedButton
                                                          .styleFrom(
                                                        shape:
                                                            const RoundedRectangleBorder(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .horizontal(
                                                            left:
                                                                Radius.circular(
                                                                    2),
                                                            right:
                                                                Radius.circular(
                                                                    2),
                                                          ),
                                                        ),
                                                        backgroundColor: Colors
                                                                .grey[
                                                            300], // Background color of the button
                                                        elevation: 0,
                                                      ),
                                                    ),
                                                  ),
                                                const SizedBox(width: 10),
                                                if (!showAddTruck)
                                                  Padding(
                                                    padding: const EdgeInsets
                                                        .fromLTRB(25, 2, 0, 0),
                                                    child: ElevatedButton(
                                                      onPressed: () {
                                                        // Add truck functionality here
                                                      },
                                                      child: const Text(
                                                        'Add Truck',
                                                        style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          color: Colors.black,
                                                        ),
                                                      ),
                                                      style: ElevatedButton
                                                          .styleFrom(
                                                        shape:
                                                            const RoundedRectangleBorder(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .horizontal(
                                                            left:
                                                                Radius.circular(
                                                                    2),
                                                            right:
                                                                Radius.circular(
                                                                    2),
                                                          ),
                                                        ),
                                                        backgroundColor: Colors
                                                                .grey[
                                                            300], // Background color of the button
                                                        elevation: 0,
                                                      ),
                                                    ),
                                                  ),
                                              ],
                                            ),
                                            const SizedBox(height: 5),
                                            Container(
                                              width: 500,
                                              margin: const EdgeInsets.fromLTRB(
                                                  40, 10, 40, 0),
                                              padding:
                                                  const EdgeInsets.fromLTRB(
                                                      10, 0, 0, 0),
                                              decoration: BoxDecoration(
                                                color: _containerColor,
                                                border: Border.all(
                                                    color: Colors.black),
                                              ),
                                              child: Row(
                                                children: [
                                                  const CircleAvatar(
                                                    radius: 40,
                                                    backgroundColor:
                                                        Colors.white,
                                                    backgroundImage: AssetImage(
                                                        'images/truck1.png'),
                                                  ),
                                                  const SizedBox(width: 5),
                                                  const Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                        'Truck ID',
                                                        style: TextStyle(
                                                            fontSize: 20,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            color:
                                                                Colors.black),
                                                      ),
                                                      Text(
                                                        'Cargo Type:',
                                                        style: TextStyle(
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            color:
                                                                Colors.black),
                                                      ),
                                                      Text(
                                                        'Truck Type:',
                                                        style: TextStyle(
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            color:
                                                                Colors.black),
                                                      ),
                                                      Text(
                                                        'Max Capacity:',
                                                        style: TextStyle(
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            color:
                                                                Colors.black),
                                                      ),
                                                    ],
                                                  ),
                                                  const Spacer(),
                                                  Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment.end,
                                                    children: [
                                                      const Text(
                                                        'Truck Status',
                                                        style: TextStyle(
                                                            fontWeight:
                                                                FontWeight
                                                                    .normal,
                                                            color:
                                                                Colors.green),
                                                      ),
                                                      const SizedBox(
                                                          height: 10),
                                                      ElevatedButton(
                                                        onPressed: () {
                                                          setState(
                                                            () {
                                                              showAddTruck =
                                                                  !showAddTruck;
                                                              showRemoveTruck =
                                                                  !showRemoveTruck;
                                                              showTruckInfo =
                                                                  !showTruckInfo;
                                                              showFirstContainer =
                                                                  !showFirstContainer;
                                                              popOverlay =
                                                                  !popOverlay;
                                                              selectTruckColorChanged =
                                                                  !selectTruckColorChanged;
                                                              click = !click;
                                                              _toggleColor();
                                                            },
                                                          );
                                                        },
                                                        child: const Text(
                                                            'Select'),
                                                        style: ElevatedButton
                                                            .styleFrom(
                                                                shape:
                                                                    const RoundedRectangleBorder(
                                                                        borderRadius:
                                                                            BorderRadius
                                                                                .horizontal(
                                                                  left: Radius
                                                                      .circular(
                                                                          5),
                                                                  right: Radius
                                                                      .circular(
                                                                          5),
                                                                )),
                                                                backgroundColor:
                                                                    click
                                                                        ? Colors
                                                                            .blue
                                                                        : Colors
                                                                            .blue
                                                                            .shade200,
                                                                foregroundColor:
                                                                    click
                                                                        ? Colors
                                                                            .white
                                                                        : Colors
                                                                            .black),
                                                      ),
                                                      const SizedBox(
                                                          height: 10),
                                                      const Icon(Icons.delete),
                                                    ],
                                                  ),
                                                  const SizedBox(width: 5),
                                                ],
                                              ),
                                            ),
                                            const SizedBox(height: 5),
                                            Container(
                                              width: 500,
                                              margin: const EdgeInsets.fromLTRB(
                                                  40, 10, 40, 0),
                                              padding:
                                                  const EdgeInsets.fromLTRB(
                                                      10, 0, 0, 0),
                                              decoration: BoxDecoration(
                                                // color: _containerColor,
                                                border: Border.all(
                                                    color: Colors.black),
                                              ),
                                              child: Row(
                                                children: [
                                                  const CircleAvatar(
                                                    radius: 40,
                                                    backgroundColor:
                                                        Colors.white,
                                                    backgroundImage: AssetImage(
                                                        'images/truck1.png'),
                                                  ),
                                                  const SizedBox(width: 5),
                                                  const Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                        'Truck ID',
                                                        style: TextStyle(
                                                            fontSize: 20,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            color:
                                                                Colors.black),
                                                      ),
                                                      Text(
                                                        'Cargo Type:',
                                                        style: TextStyle(
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            color:
                                                                Colors.black),
                                                      ),
                                                      Text(
                                                        'Truck Type:',
                                                        style: TextStyle(
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            color:
                                                                Colors.black),
                                                      ),
                                                      Text(
                                                        'Max Capacity:',
                                                        style: TextStyle(
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            color:
                                                                Colors.black),
                                                      ),
                                                    ],
                                                  ),
                                                  const Spacer(),
                                                  Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment.end,
                                                    children: [
                                                      const Text(
                                                        'Truck Status',
                                                        style: TextStyle(
                                                            fontWeight:
                                                                FontWeight
                                                                    .normal,
                                                            color:
                                                                Colors.green),
                                                      ),
                                                      const SizedBox(
                                                          height: 10),
                                                      ElevatedButton(
                                                        onPressed: () {},
                                                        child: const Text(
                                                            'Select'),
                                                        style: ElevatedButton
                                                            .styleFrom(
                                                                shape:
                                                                    const RoundedRectangleBorder(
                                                                        borderRadius:
                                                                            BorderRadius
                                                                                .horizontal(
                                                                  left: Radius
                                                                      .circular(
                                                                          5),
                                                                  right: Radius
                                                                      .circular(
                                                                          5),
                                                                )),
                                                                backgroundColor:
                                                                    Colors.blue
                                                                        .shade200),
                                                      ),
                                                      const SizedBox(
                                                          height: 10),
                                                      const Icon(Icons.delete),
                                                    ],
                                                  ),
                                                  const SizedBox(width: 5),
                                                ],
                                              ),
                                            ),
                                            const SizedBox(height: 5),
                                            Container(
                                              width: 500,
                                              margin: const EdgeInsets.fromLTRB(
                                                  40, 10, 40, 0),
                                              padding:
                                                  const EdgeInsets.fromLTRB(
                                                      10, 0, 0, 0),
                                              decoration: BoxDecoration(
                                                border: Border.all(
                                                    color: Colors.black),
                                              ),
                                              child: Row(
                                                children: [
                                                  const CircleAvatar(
                                                    radius: 40,
                                                    backgroundColor:
                                                        Colors.white,
                                                    backgroundImage: AssetImage(
                                                        'images/truck1.png'),
                                                  ),
                                                  const SizedBox(width: 5),
                                                  const Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                        'Truck ID',
                                                        style: TextStyle(
                                                            fontSize: 20,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            color:
                                                                Colors.black),
                                                      ),
                                                      Text(
                                                        'Cargo Type:',
                                                        style: TextStyle(
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            color:
                                                                Colors.black),
                                                      ),
                                                      Text(
                                                        'Truck Type:',
                                                        style: TextStyle(
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            color:
                                                                Colors.black),
                                                      ),
                                                      Text(
                                                        'Max Capacity:',
                                                        style: TextStyle(
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            color:
                                                                Colors.black),
                                                      ),
                                                    ],
                                                  ),
                                                  const Spacer(),
                                                  Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment.end,
                                                    children: [
                                                      const Text(
                                                        'Truck Status',
                                                        style: TextStyle(
                                                            fontWeight:
                                                                FontWeight
                                                                    .normal,
                                                            color:
                                                                Colors.green),
                                                      ),
                                                      const SizedBox(
                                                          height: 10),
                                                      ElevatedButton(
                                                        onPressed: () {},
                                                        child: const Text(
                                                            'Select'),
                                                        style: ElevatedButton
                                                            .styleFrom(
                                                                shape:
                                                                    const RoundedRectangleBorder(
                                                                        borderRadius:
                                                                            BorderRadius
                                                                                .horizontal(
                                                                  left: Radius
                                                                      .circular(
                                                                          5),
                                                                  right: Radius
                                                                      .circular(
                                                                          5),
                                                                )),
                                                                backgroundColor:
                                                                    Colors.blue
                                                                        .shade200),
                                                      ),
                                                      const SizedBox(
                                                          height: 10),
                                                      const Icon(Icons.delete),
                                                    ],
                                                  ),
                                                  const SizedBox(width: 5),
                                                ],
                                              ),
                                            ),
                                            const SizedBox(height: 5),
                                            Container(
                                              width: 500,
                                              margin: const EdgeInsets.fromLTRB(
                                                  40, 10, 40, 0),
                                              padding:
                                                  const EdgeInsets.fromLTRB(
                                                      10, 0, 0, 0),
                                              decoration: BoxDecoration(
                                                border: Border.all(
                                                    color: Colors.black),
                                              ),
                                              child: Row(
                                                children: [
                                                  const CircleAvatar(
                                                    radius: 40,
                                                    backgroundColor:
                                                        Colors.white,
                                                    backgroundImage: AssetImage(
                                                        'images/truck1.png'),
                                                  ),
                                                  const SizedBox(width: 5),
                                                  const Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                        'Truck ID',
                                                        style: TextStyle(
                                                            fontSize: 20,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            color:
                                                                Colors.black),
                                                      ),
                                                      Text(
                                                        'Cargo Type:',
                                                        style: TextStyle(
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            color:
                                                                Colors.black),
                                                      ),
                                                      Text(
                                                        'Truck Type:',
                                                        style: TextStyle(
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            color:
                                                                Colors.black),
                                                      ),
                                                      Text(
                                                        'Max Capacity:',
                                                        style: TextStyle(
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            color:
                                                                Colors.black),
                                                      ),
                                                    ],
                                                  ),
                                                  const Spacer(),
                                                  Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment.end,
                                                    children: [
                                                      const Text(
                                                        'Truck Status',
                                                        style: TextStyle(
                                                            fontWeight:
                                                                FontWeight
                                                                    .normal,
                                                            color:
                                                                Colors.green),
                                                      ),
                                                      const SizedBox(
                                                          height: 10),
                                                      ElevatedButton(
                                                        onPressed: () {},
                                                        child: const Text(
                                                            'Select'),
                                                        style: ElevatedButton.styleFrom(
                                                            shape: const RoundedRectangleBorder(
                                                                borderRadius: BorderRadius.horizontal(
                                                                    left: Radius
                                                                        .circular(
                                                                            5),
                                                                    right: Radius
                                                                        .circular(
                                                                            5))),
                                                            backgroundColor:
                                                                Colors.blue
                                                                    .shade200),
                                                      ),
                                                      const SizedBox(
                                                          height: 10),
                                                      const Icon(Icons.delete),
                                                    ],
                                                  ),
                                                  const SizedBox(width: 5),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                          if (showFirstContainer)
                            // Right panel for Truck
                            Expanded(
                              child: Container(
                                height: 450,
                                margin:
                                    const EdgeInsets.fromLTRB(20, 50, 20, 20),
                                padding:
                                    const EdgeInsets.fromLTRB(25, 10, 25, 0),
                                color: Colors.yellow[100],
                                child: const Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(Icons.local_shipping,
                                        size: 50, color: Colors.black),
                                    SizedBox(height: 10),
                                    Text(
                                      'Select a Truck',
                                      style: TextStyle(
                                          fontSize: 24,
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                        ],
                      ),
                      // Order Tab Content
                      Container(
                        color: Colors.white,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 10),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                const Padding(
                                  padding: EdgeInsets.fromLTRB(90, 0, 0, 0),
                                  child: Text(
                                    'Filter By: ',
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 10),
                                Container(
                                  width: 120,
                                  child: DropdownButton<String>(
                                    value: null,
                                    onChanged: (String? newValue) {},
                                    items: <String>[
                                      'Order ID',
                                      'Customer',
                                      'Cargo Type',
                                      'QTY',
                                      'Total Weight',
                                      'Date Filled',
                                      'Status'
                                    ].map<DropdownMenuItem<String>>(
                                        (String value) {
                                      return DropdownMenuItem<String>(
                                        value: value,
                                        child: Text(value),
                                      );
                                    }).toList(),
                                    dropdownColor: Colors.grey[300],
                                  ),
                                ),
                                const SizedBox(width: 90),
                                TextButton(
                                  onPressed: () {
                                    // Handle Date button press
                                  },
                                  child: const Row(
                                    children: [
                                      Icon(Icons.calendar_month_rounded),
                                      SizedBox(width: 8),
                                      Text('Date'),
                                    ],
                                  ),
                                ),
                                const SizedBox(width: 100),
                                TextButton(
                                  onPressed: () {
                                    // Handle Prev button press
                                  },
                                  child: const Row(
                                    children: [
                                      Icon(Icons.arrow_back),
                                      SizedBox(width: 8),
                                      Text('Prev'),
                                    ],
                                  ),
                                ),
                                const SizedBox(width: 20),
                                const Text('1-10 of 100'),
                                const SizedBox(width: 20),
                                TextButton(
                                  onPressed: () {
                                    // Handle Next button press
                                  },
                                  child: const Row(
                                    children: [
                                      Text('Next'),
                                      SizedBox(width: 8),
                                      Icon(Icons.arrow_forward),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 5),
                            Container(
                              width: double.infinity,
                              height: 400,
                              padding: const EdgeInsets.all(30),
                              decoration: BoxDecoration(
                                color: Color.fromRGBO(156, 246, 134, 1),
                                borderRadius: BorderRadius.circular(30),
                              ),
                              child: const Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(height: 3),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      SizedBox(width: 15),
                                      Text(
                                        'Order ID',
                                        style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                          decoration: TextDecoration.underline,
                                          fontFamily: 'Arial',
                                        ),
                                      ),
                                      SizedBox(width: 15),
                                      Text(
                                        'Customer',
                                        style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                          decoration: TextDecoration.underline,
                                          fontFamily: 'Arial',
                                        ),
                                      ),
                                      SizedBox(width: 15),
                                      Text(
                                        'Cargo Type',
                                        style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                          decoration: TextDecoration.underline,
                                          fontFamily: 'Arial',
                                        ),
                                      ),
                                      SizedBox(width: 15),
                                      Text(
                                        'QTY',
                                        style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                          decoration: TextDecoration.underline,
                                          fontFamily: 'Arial',
                                        ),
                                      ),
                                      SizedBox(width: 15),
                                      Text(
                                        'Total Weight',
                                        style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                          decoration: TextDecoration.underline,
                                          fontFamily: 'Arial',
                                        ),
                                      ),
                                      SizedBox(width: 15),
                                      Text(
                                        'Date Filed',
                                        style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                          decoration: TextDecoration.underline,
                                          fontFamily: 'Arial',
                                        ),
                                      ),
                                      SizedBox(width: 15),
                                      Text(
                                        'Status',
                                        style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                          decoration: TextDecoration.underline,
                                          fontFamily: 'Arial',
                                        ),
                                      ),
                                      SizedBox(width: 15),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      // Delivery Tab Content
                      Container(
                        color: Colors.white,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 10),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                const Padding(
                                  padding: EdgeInsets.fromLTRB(90, 0, 0, 0),
                                  child: Text(
                                    'Filter By: ',
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 10),
                                Container(
                                  width: 120,
                                  child: DropdownButton<String>(
                                    value: null,
                                    onChanged: (String? newValue) {
                                      setState(() {});
                                    },
                                    items: <String>[
                                      'Order ID',
                                      'Customer',
                                      'Cargo Type',
                                      'QTY',
                                      'Total Weight',
                                      'Date Filled',
                                      'Status'
                                    ].map<DropdownMenuItem<String>>(
                                        (String value) {
                                      return DropdownMenuItem<String>(
                                        value: value,
                                        child: Text(value),
                                      );
                                    }).toList(),
                                    dropdownColor: Colors.grey[300],
                                  ),
                                ),
                                const SizedBox(width: 90),
                                TextButton(
                                  onPressed: () {
                                    // Handle Date button press
                                  },
                                  child: const Row(
                                    children: [
                                      Icon(Icons.calendar_month_rounded),
                                      SizedBox(width: 8),
                                      Text('Date'),
                                    ],
                                  ),
                                ),
                                const SizedBox(width: 100),
                                TextButton(
                                  onPressed: () {
                                    // Handle Prev button press
                                  },
                                  child: const Row(
                                    children: [
                                      Icon(Icons.arrow_back),
                                      SizedBox(width: 8),
                                      Text('Prev'),
                                    ],
                                  ),
                                ),
                                const SizedBox(width: 20),
                                const Text('1-10 of 100'),
                                const SizedBox(width: 20),
                                TextButton(
                                  onPressed: () {
                                    // Handle Next button press
                                  },
                                  child: const Row(
                                    children: [
                                      Text('Next'),
                                      SizedBox(width: 8),
                                      Icon(Icons.arrow_forward),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 5),
                            Container(
                              width: double.infinity,
                              height: 400,
                              padding: const EdgeInsets.all(30),
                              decoration: BoxDecoration(
                                color: Color.fromRGBO(156, 246, 134, 1),
                                borderRadius: BorderRadius.circular(30),
                              ),
                              child: const Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(height: 3),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      SizedBox(width: 15),
                                      Text(
                                        'Delivery ID',
                                        style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                          decoration: TextDecoration.underline,
                                          fontFamily: 'Arial',
                                        ),
                                      ),
                                      SizedBox(width: 15),
                                      Text(
                                        'Truck Team',
                                        style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                          decoration: TextDecoration.underline,
                                          fontFamily: 'Arial',
                                        ),
                                      ),
                                      SizedBox(width: 15),
                                      Text(
                                        'Loading Date',
                                        style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                          decoration: TextDecoration.underline,
                                          fontFamily: 'Arial',
                                        ),
                                      ),
                                      SizedBox(width: 15),
                                      Text(
                                        'Unloading Date',
                                        style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                          decoration: TextDecoration.underline,
                                          fontFamily: 'Arial',
                                        ),
                                      ),
                                      SizedBox(width: 15),
                                      Text(
                                        'Status',
                                        style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                          decoration: TextDecoration.underline,
                                          fontFamily: 'Arial',
                                        ),
                                      ),
                                      SizedBox(width: 15),
                                      Text(
                                        'Report',
                                        style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                          decoration: TextDecoration.underline,
                                          fontFamily: 'Arial',
                                        ),
                                      ),
                                      SizedBox(width: 15),
                                      Text(
                                        'Status',
                                        style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                          decoration: TextDecoration.underline,
                                          fontFamily: 'Arial',
                                        ),
                                      ),
                                      SizedBox(width: 15),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),

                      // Payroll Tab Content
                      Row(
                        children: [
                          SingleChildScrollView(
                            child: Expanded(
                              child: Container(
                                color: Colors.white,
                                child: Center(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        alignment: Alignment.centerLeft,
                                        padding: const EdgeInsets.all(10),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              children: [
                                                IconButton(
                                                    icon: const Icon(
                                                        Icons.arrow_back,
                                                        size: 35,
                                                        color: Colors.black),
                                                    onPressed: () {
                                                      // Handle back button press
                                                      Navigator.push(
                                                          context,
                                                          MaterialPageRoute(
                                                            builder: (context) =>
                                                                const Homepage(),
                                                          ));
                                                    }),
                                                const Padding(
                                                  padding: EdgeInsets.only(
                                                      left: 10.0),
                                                  child: Text(
                                                    'Payroll',
                                                    style: TextStyle(
                                                        fontSize: 35,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        color: Colors.black),
                                                  ),
                                                ),
                                                // Search Truck
                                                const SizedBox(width: 40),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.fromLTRB(
                                                          40, 2, 0, 0),
                                                  child: ElevatedButton.icon(
                                                    onPressed: () {
                                                      // Your search functionality here
                                                    },
                                                    icon: const Icon(
                                                        Icons.search,
                                                        color: Colors.black,
                                                        size: 30),
                                                    label: const Text(
                                                      'Search Staff',
                                                      style: TextStyle(
                                                          fontSize: 15,
                                                          fontWeight:
                                                              FontWeight.normal,
                                                          color: Colors.grey),
                                                    ),
                                                    style: ElevatedButton
                                                        .styleFrom(
                                                      shape:
                                                          const RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .horizontal(
                                                          left: Radius.circular(
                                                              5),
                                                          right:
                                                              Radius.circular(
                                                                  5),
                                                        ),
                                                      ),
                                                      backgroundColor: Colors
                                                              .grey[
                                                          300], // Background color of the button
                                                      elevation: 0,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            const SizedBox(height: 5),
                                            Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                const Padding(
                                                  padding: EdgeInsets.only(
                                                      left: 10.0),
                                                  child: Text(
                                                    'Week:',
                                                    style: TextStyle(
                                                        fontSize: 18,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        color: Colors.black),
                                                  ),
                                                ),
                                                // Add Truck
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.all(10),
                                                  child: DropdownButton<String>(
                                                    value:
                                                        'From March 4 2024 to March 9 2024',
                                                    onChanged:
                                                        (String? newValue) {
                                                      // Handle dropdown value change
                                                    },
                                                    items: <String>[
                                                      'From March 4 2024 to March 9 2024'
                                                    ].map<
                                                        DropdownMenuItem<
                                                            String>>(
                                                      (String value) {
                                                        return DropdownMenuItem<
                                                            String>(
                                                          value: value,
                                                          child: Text(
                                                            value,
                                                            style: const TextStyle(
                                                                color: Colors
                                                                    .black), // Set text color
                                                          ),
                                                        );
                                                      },
                                                    ).toList(),
                                                  ),
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.fromLTRB(
                                                          25, 2, 0, 0),
                                                  child: ElevatedButton(
                                                    onPressed: () {
                                                      // Remove truck functionality here
                                                    },
                                                    child: const Text(
                                                      'Set Pay Rate',
                                                      style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        color: Colors.black,
                                                      ),
                                                    ),
                                                    style: ElevatedButton
                                                        .styleFrom(
                                                      shape:
                                                          const RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .horizontal(
                                                          left: Radius.circular(
                                                              2),
                                                          right:
                                                              Radius.circular(
                                                                  2),
                                                        ),
                                                      ),
                                                      backgroundColor: Colors
                                                              .grey[
                                                          300], // Background color of the button
                                                      elevation: 0,
                                                    ),
                                                  ),
                                                ),
                                                const SizedBox(width: 10),
                                              ],
                                            ),
                                            const SizedBox(height: 5),
                                            Container(
                                              width: 500,
                                              margin: const EdgeInsets.fromLTRB(
                                                  40, 10, 40, 0),
                                              padding:
                                                  const EdgeInsets.fromLTRB(
                                                      10, 0, 0, 0),
                                              decoration: BoxDecoration(
                                                color: _containerColor,
                                                border: Border.all(
                                                    color: Colors.black),
                                              ),
                                              child: Row(
                                                children: [
                                                  const CircleAvatar(
                                                    radius: 40,
                                                    backgroundColor:
                                                        Colors.white,
                                                    backgroundImage: AssetImage(
                                                        'images/truck1.png'),
                                                  ),
                                                  const SizedBox(width: 5),
                                                  const Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                        'Truck ID',
                                                        style: TextStyle(
                                                            fontSize: 20,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            color:
                                                                Colors.black),
                                                      ),
                                                      Text(
                                                        'Cargo Type:',
                                                        style: TextStyle(
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            color:
                                                                Colors.black),
                                                      ),
                                                      Text(
                                                        'Truck Type:',
                                                        style: TextStyle(
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            color:
                                                                Colors.black),
                                                      ),
                                                      Text(
                                                        'Max Capacity:',
                                                        style: TextStyle(
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            color:
                                                                Colors.black),
                                                      ),
                                                    ],
                                                  ),
                                                  const Spacer(),
                                                  Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment.end,
                                                    children: [
                                                      const Text(
                                                        'Truck Status',
                                                        style: TextStyle(
                                                            fontWeight:
                                                                FontWeight
                                                                    .normal,
                                                            color:
                                                                Colors.green),
                                                      ),
                                                      const SizedBox(
                                                          height: 10),
                                                      ElevatedButton(
                                                        onPressed: () {
                                                          setState(
                                                            () {
                                                              showAddTruck =
                                                                  !showAddTruck;
                                                              showRemoveTruck =
                                                                  !showRemoveTruck;
                                                              showTruckInfo =
                                                                  !showTruckInfo;
                                                              popOverlay =
                                                                  !popOverlay;
                                                              showPayrollContainer =
                                                                  !showPayrollContainer;
                                                              selectTruckColorChanged =
                                                                  !selectTruckColorChanged;
                                                              click = !click;
                                                              _toggleColor();
                                                            },
                                                          );
                                                        },
                                                        child: const Text(
                                                            'Select'),
                                                        style: ElevatedButton
                                                            .styleFrom(
                                                                shape:
                                                                    const RoundedRectangleBorder(
                                                                        borderRadius:
                                                                            BorderRadius
                                                                                .horizontal(
                                                                  left: Radius
                                                                      .circular(
                                                                          5),
                                                                  right: Radius
                                                                      .circular(
                                                                          5),
                                                                )),
                                                                backgroundColor:
                                                                    click
                                                                        ? Colors
                                                                            .blue
                                                                        : Colors
                                                                            .blue
                                                                            .shade200,
                                                                foregroundColor:
                                                                    click
                                                                        ? Colors
                                                                            .white
                                                                        : Colors
                                                                            .black),
                                                      ),
                                                      const SizedBox(
                                                          height: 10),
                                                      const Icon(Icons.delete),
                                                    ],
                                                  ),
                                                  const SizedBox(width: 5),
                                                ],
                                              ),
                                            ),
                                            const SizedBox(height: 5),
                                            Container(
                                              width: 500,
                                              margin: const EdgeInsets.fromLTRB(
                                                  40, 10, 40, 0),
                                              padding:
                                                  const EdgeInsets.fromLTRB(
                                                      10, 0, 0, 0),
                                              decoration: BoxDecoration(
                                                // color: _containerColor,
                                                border: Border.all(
                                                    color: Colors.black),
                                              ),
                                              child: Row(
                                                children: [
                                                  const CircleAvatar(
                                                    radius: 40,
                                                    backgroundColor:
                                                        Colors.white,
                                                    backgroundImage: AssetImage(
                                                        'images/truck1.png'),
                                                  ),
                                                  const SizedBox(width: 5),
                                                  const Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                        'Truck ID',
                                                        style: TextStyle(
                                                            fontSize: 20,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            color:
                                                                Colors.black),
                                                      ),
                                                      Text(
                                                        'Cargo Type:',
                                                        style: TextStyle(
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            color:
                                                                Colors.black),
                                                      ),
                                                      Text(
                                                        'Truck Type:',
                                                        style: TextStyle(
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            color:
                                                                Colors.black),
                                                      ),
                                                      Text(
                                                        'Max Capacity:',
                                                        style: TextStyle(
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            color:
                                                                Colors.black),
                                                      ),
                                                    ],
                                                  ),
                                                  const Spacer(),
                                                  Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment.end,
                                                    children: [
                                                      const Text(
                                                        'Truck Status',
                                                        style: TextStyle(
                                                            fontWeight:
                                                                FontWeight
                                                                    .normal,
                                                            color:
                                                                Colors.green),
                                                      ),
                                                      const SizedBox(
                                                          height: 10),
                                                      ElevatedButton(
                                                        onPressed: () {},
                                                        child: const Text(
                                                            'Select'),
                                                        style: ElevatedButton
                                                            .styleFrom(
                                                                shape:
                                                                    const RoundedRectangleBorder(
                                                                        borderRadius:
                                                                            BorderRadius
                                                                                .horizontal(
                                                                  left: Radius
                                                                      .circular(
                                                                          5),
                                                                  right: Radius
                                                                      .circular(
                                                                          5),
                                                                )),
                                                                backgroundColor:
                                                                    Colors.blue
                                                                        .shade200),
                                                      ),
                                                      const SizedBox(
                                                          height: 10),
                                                      const Icon(Icons.delete),
                                                    ],
                                                  ),
                                                  const SizedBox(width: 5),
                                                ],
                                              ),
                                            ),
                                            const SizedBox(height: 5),
                                            Container(
                                              width: 500,
                                              margin: const EdgeInsets.fromLTRB(
                                                  40, 10, 40, 0),
                                              padding:
                                                  const EdgeInsets.fromLTRB(
                                                      10, 0, 0, 0),
                                              decoration: BoxDecoration(
                                                border: Border.all(
                                                    color: Colors.black),
                                              ),
                                              child: Row(
                                                children: [
                                                  const CircleAvatar(
                                                    radius: 40,
                                                    backgroundColor:
                                                        Colors.white,
                                                    backgroundImage: AssetImage(
                                                        'images/truck1.png'),
                                                  ),
                                                  const SizedBox(width: 5),
                                                  const Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                        'Truck ID',
                                                        style: TextStyle(
                                                            fontSize: 20,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            color:
                                                                Colors.black),
                                                      ),
                                                      Text(
                                                        'Cargo Type:',
                                                        style: TextStyle(
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            color:
                                                                Colors.black),
                                                      ),
                                                      Text(
                                                        'Truck Type:',
                                                        style: TextStyle(
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            color:
                                                                Colors.black),
                                                      ),
                                                      Text(
                                                        'Max Capacity:',
                                                        style: TextStyle(
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            color:
                                                                Colors.black),
                                                      ),
                                                    ],
                                                  ),
                                                  const Spacer(),
                                                  Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment.end,
                                                    children: [
                                                      const Text(
                                                        'Truck Status',
                                                        style: TextStyle(
                                                            fontWeight:
                                                                FontWeight
                                                                    .normal,
                                                            color:
                                                                Colors.green),
                                                      ),
                                                      const SizedBox(
                                                          height: 10),
                                                      ElevatedButton(
                                                        onPressed: () {},
                                                        child: const Text(
                                                            'Select'),
                                                        style: ElevatedButton
                                                            .styleFrom(
                                                                shape:
                                                                    const RoundedRectangleBorder(
                                                                        borderRadius:
                                                                            BorderRadius
                                                                                .horizontal(
                                                                  left: Radius
                                                                      .circular(
                                                                          5),
                                                                  right: Radius
                                                                      .circular(
                                                                          5),
                                                                )),
                                                                backgroundColor:
                                                                    Colors.blue
                                                                        .shade200),
                                                      ),
                                                      const SizedBox(
                                                          height: 10),
                                                      const Icon(Icons.delete),
                                                    ],
                                                  ),
                                                  const SizedBox(width: 5),
                                                ],
                                              ),
                                            ),
                                            const SizedBox(height: 5),
                                            Container(
                                              width: 500,
                                              margin: const EdgeInsets.fromLTRB(
                                                  40, 10, 40, 0),
                                              padding:
                                                  const EdgeInsets.fromLTRB(
                                                      10, 0, 0, 0),
                                              decoration: BoxDecoration(
                                                border: Border.all(
                                                    color: Colors.black),
                                              ),
                                              child: Row(
                                                children: [
                                                  const CircleAvatar(
                                                    radius: 40,
                                                    backgroundColor:
                                                        Colors.white,
                                                    backgroundImage: AssetImage(
                                                        'images/truck1.png'),
                                                  ),
                                                  const SizedBox(width: 5),
                                                  const Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                        'Truck ID',
                                                        style: TextStyle(
                                                            fontSize: 20,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            color:
                                                                Colors.black),
                                                      ),
                                                      Text(
                                                        'Cargo Type:',
                                                        style: TextStyle(
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            color:
                                                                Colors.black),
                                                      ),
                                                      Text(
                                                        'Truck Type:',
                                                        style: TextStyle(
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            color:
                                                                Colors.black),
                                                      ),
                                                      Text(
                                                        'Max Capacity:',
                                                        style: TextStyle(
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            color:
                                                                Colors.black),
                                                      ),
                                                    ],
                                                  ),
                                                  const Spacer(),
                                                  Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment.end,
                                                    children: [
                                                      const Text(
                                                        'Truck Status',
                                                        style: TextStyle(
                                                            fontWeight:
                                                                FontWeight
                                                                    .normal,
                                                            color:
                                                                Colors.green),
                                                      ),
                                                      const SizedBox(
                                                          height: 10),
                                                      ElevatedButton(
                                                        onPressed: () {},
                                                        child: const Text(
                                                            'Select'),
                                                        style: ElevatedButton.styleFrom(
                                                            shape: const RoundedRectangleBorder(
                                                                borderRadius: BorderRadius.horizontal(
                                                                    left: Radius
                                                                        .circular(
                                                                            5),
                                                                    right: Radius
                                                                        .circular(
                                                                            5))),
                                                            backgroundColor:
                                                                Colors.blue
                                                                    .shade200),
                                                      ),
                                                      const SizedBox(
                                                          height: 10),
                                                      const Icon(Icons.delete),
                                                    ],
                                                  ),
                                                  const SizedBox(width: 5),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                          if (showPayrollContainer)
                            // Right panel for Truck
                            Expanded(
                              child: Container(
                                height: 450,
                                margin:
                                    const EdgeInsets.fromLTRB(20, 50, 20, 20),
                                padding:
                                    const EdgeInsets.fromLTRB(25, 10, 25, 0),
                                color: Colors.yellow[100],
                                child: const Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(Icons.local_shipping,
                                        size: 50, color: Colors.black),
                                    SizedBox(height: 10),
                                    Text(
                                      'Select a Truck',
                                      style: TextStyle(
                                          fontSize: 24,
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          if (!showFirstContainer)
            //Side panel Truck
            SingleChildScrollView(
              child: Container(
                width: 340,
                height: 1030,
                color: Colors.green.shade50,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height,
                      child: Stack(
                        children: [
                          Container(
                            width: 300,
                            color: Colors.green.shade50,
                            child: Row(
                              children: [
                                IconButton(
                                  icon: const Icon(Icons.arrow_back,
                                      size: 35, color: Colors.black),
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const Homepage()),
                                    );
                                  },
                                ),
                                // Add other widgets to the app bar as needed
                              ],
                            ),
                          ),
                          Column(
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(100, 50, 100, 0),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(10.0),
                                  child: Image.asset(
                                    'images/truck1.png',
                                    width: 150.0,
                                    height: 150.0,
                                  ),
                                ),
                              ),
                              const Text(
                                'Truck Id',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                    fontSize: 20),
                              ),
                              const Text(
                                'Edit Details',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.red,
                                    decoration: TextDecoration.underline,
                                    decorationColor: Colors.red,
                                    fontSize: 20),
                              ),
                              Container(
                                margin:
                                    const EdgeInsets.symmetric(vertical: 8.0),
                                height: 2,
                                color: Colors.black,
                              ),
                              Padding(
                                padding: EdgeInsets.zero,
                                child: Container(
                                  child: const Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      'Staff History',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20,
                                          color: Colors.black),
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                padding: const EdgeInsets.all(3.0),
                                decoration: BoxDecoration(
                                  border: Border.all(color: Colors.green),
                                  borderRadius: const BorderRadius.horizontal(),
                                ),
                                child: Row(
                                  children: [
                                    const CircleAvatar(
                                      backgroundImage:
                                          AssetImage('images/truck1.png'),
                                      radius: 30.0,
                                    ),
                                    const SizedBox(width: 10.0),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const Text(
                                          'Employee Name',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 20),
                                        ),
                                        const Text(
                                          'Staff ID',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 18),
                                        ),
                                        const Text(
                                          'Position',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 18),
                                        ),
                                        const Text(
                                          'Date',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 18),
                                        ),
                                        Container(
                                          margin: const EdgeInsets.symmetric(
                                              vertical: 8.0),
                                          height: 2,
                                          color: Colors.black,
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                padding: const EdgeInsets.all(3.0),
                                decoration: BoxDecoration(
                                  border: Border.all(color: Colors.green),
                                  borderRadius: const BorderRadius.horizontal(),
                                ),
                                child: Row(
                                  children: [
                                    const CircleAvatar(
                                      backgroundImage:
                                          AssetImage('images/truck1.png'),
                                      radius: 30.0,
                                    ),
                                    const SizedBox(width: 10.0),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const Text(
                                          'Employee Name',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 20),
                                        ),
                                        const Text(
                                          'Staff ID',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 18),
                                        ),
                                        const Text(
                                          'Position',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 18),
                                        ),
                                        const Text(
                                          'Date',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 18),
                                        ),
                                        Container(
                                          margin: const EdgeInsets.symmetric(
                                              vertical: 8.0),
                                          height: 2,
                                          color: Colors.black,
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    // Add the Delivery History text here
                    const Text(
                      'Delivery History',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Colors.black),
                    ),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        const Padding(
                          padding: EdgeInsets.fromLTRB(50, 0, 0, 0),
                        ),
                        const Text(
                          'Filter By:',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                        const SizedBox(width: 10),
                        Container(
                          height: 25,
                          width: 100,
                          decoration: const BoxDecoration(
                            color: Colors.grey, // Set the background color here
                            borderRadius: BorderRadius.horizontal(
                                left: Radius.circular(3),
                                right: Radius.circular(
                                    3)), // Optional: Add border radius
                          ),
                          child: DropdownButton<String>(
                            value: 'Delivery Id',
                            onChanged: (String? newValue) {
                              // Handle dropdown value change
                            },
                            items: <String>['Delivery Id']
                                .map<DropdownMenuItem<String>>(
                              (String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(
                                    value,
                                    style: const TextStyle(
                                        color: Colors.black), // Set text color
                                  ),
                                );
                              },
                            ).toList(),
                          ),
                        )
                      ],
                    ),
                    const SizedBox(height: 10),
                    Container(
                      // height:110,
                      // width:320,
                      color: Colors.lightGreen.shade400,
                      child: Row(
                        children: [
                          const Padding(
                            padding: EdgeInsets.all(15),
                          ),
                          Expanded(
                              child: Column(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.stretch,
                                  children: [
                                const Text('Delivery',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold)),
                                Container(
                                  margin:
                                      const EdgeInsets.symmetric(vertical: 8.0),
                                  height: 1.0,
                                  color: Colors.orange,
                                ),
                                const Text('2023054'),
                                const Text('2023053'),
                                const Text('2023052'),
                                const Text('2023051'),
                                const Text('2023050'),
                              ])),
                          Expanded(
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                const Text('Customer',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold)),
                                Container(
                                  margin:
                                      const EdgeInsets.symmetric(vertical: 8.0),
                                  height: 1.0,
                                  color: Colors.orange,
                                ),
                                const Text('GDC523'),
                                const Text('GDL897'),
                                const Text('GDC523'),
                                const Text('GDL897'),
                                const Text('GDC523'),
                              ])),
                          Expanded(
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                const Text('Date',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold)),
                                Container(
                                  margin:
                                      const EdgeInsets.symmetric(vertical: 8.0),
                                  height: 1.0,
                                  color: Colors.orange,
                                ),
                                const Text('12-16-2023'),
                                const Text('12-16-2023'),
                                const Text('12-15-2023'),
                                const Text('12-15-2023'),
                                const Text('12-15-2023'),
                              ])),
                          const SizedBox(width: 15),
                        ],
                      ),
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      'Incident Reports',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Colors.black),
                    ),
                    Row(
                      children: [
                        const Padding(
                          padding: EdgeInsets.fromLTRB(50, 0, 0, 0),
                        ),
                        const Text(
                          'Filter By:',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                        const SizedBox(width: 10),
                        Container(
                          height: 25,
                          width: 100,
                          decoration: const BoxDecoration(
                            color: Colors.grey, // Set the background color here
                            borderRadius: BorderRadius.horizontal(
                                left: Radius.circular(3),
                                right: Radius.circular(
                                    3)), // Optional: Add border radius
                          ),
                          child: DropdownButton<String>(
                            value: 'Delivery Id',
                            onChanged: (String? newValue) {
                              // Handle dropdown value change
                            },
                            items: <String>['Delivery Id']
                                .map<DropdownMenuItem<String>>(
                              (String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(
                                    value,
                                    style: const TextStyle(
                                        color: Colors.black), // Set text color
                                  ),
                                );
                              },
                            ).toList(),
                          ),
                        )
                      ],
                    ),
                    const SizedBox(height: 10),
                    Container(
                      color: Colors.lightGreen.shade400,
                      // height:110,
                      // width:320,
                      child: Row(
                        children: [
                          const Padding(
                            padding: EdgeInsets.all(5),
                          ),
                          Expanded(
                              child: Column(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.stretch,
                                  children: [
                                const Text('DATE ',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold)),
                                Container(
                                  margin:
                                      const EdgeInsets.symmetric(vertical: 8.0),
                                  height: 1.0,
                                  color: Colors.orange,
                                ),
                                const Text('11-14-2023'),
                                const SizedBox(height: 1),
                                const Text('10-05-2023'),
                                const SizedBox(height: 1),
                                const Text('05-04-2023'),
                                const SizedBox(height: 1),
                                const Text('05-01-2023'),
                                const SizedBox(height: 1),
                                const Text('12-20-2022'),
                                const SizedBox(height: 1),
                              ])),
                          const SizedBox(height: 1),
                          Expanded(
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                const Text('DESCRIPTION',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold)),
                                Container(
                                  margin:
                                      const EdgeInsets.symmetric(vertical: 8.0),
                                  height: 1.0,
                                  color: Colors.orange,
                                ),
                                const Text('Broken Bumper',
                                    style: TextStyle(fontSize: 12)),
                                const SizedBox(height: 1),
                                const Text('Accident during delivery',
                                    style: TextStyle(fontSize: 11)),
                                const SizedBox(height: 1),
                                const Text('Flat Tire',
                                    style: TextStyle(fontSize: 12)),
                                const SizedBox(height: 1),
                                const Text('Broken Headlights',
                                    style: TextStyle(fontSize: 12)),
                                const SizedBox(height: 1),
                                const Text('Unstable Breaks',
                                    style: TextStyle(fontSize: 12)),
                              ])),
                          Expanded(
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                const Text('REMARK',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold)),
                                Container(
                                  margin:
                                      const EdgeInsets.symmetric(vertical: 8.0),
                                  height: 1.0,
                                  color: Colors.orange,
                                ),
                                const Text('On-Repair'),
                                const SizedBox(height: 1),
                                const Text('Unsuccessful'),
                                const SizedBox(height: 1),
                                const Text('Unsuccessful'),
                                const SizedBox(height: 1),
                                const Text('On-Repair'),
                                const SizedBox(height: 1),
                                const Text('On_repair'),
                              ])),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),

          if (!showStaffContainer)
            Container(
              width: 300,
              color: Colors.green.shade50,
              child: Column(
                children: [
                  const SizedBox(height: 40),
                  Positioned(
                    left: 100,
                    child: SizedBox(
                      width: 150.0,
                      height: 150.0,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10.0),
                        child: Image.asset(
                          'images/truck1.png',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    'Name',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Container(
                    width: 250,
                    color: Colors.grey.shade400,
                    padding: const EdgeInsets.all(10),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: 10),
                            Text('Staff ID',
                                style: TextStyle(fontWeight: FontWeight.bold)),
                            SizedBox(height: 10),
                            Text('Name',
                                style: TextStyle(fontWeight: FontWeight.bold)),
                            SizedBox(height: 10),
                            Text('Position',
                                style: TextStyle(fontWeight: FontWeight.bold)),
                            SizedBox(height: 10),
                            Text('Registered Date',
                                style: TextStyle(fontWeight: FontWeight.bold)),
                            SizedBox(height: 10),
                            Text('Contact Number',
                                style: TextStyle(fontWeight: FontWeight.bold)),
                            SizedBox(height: 10),
                            Text('Email',
                                style: TextStyle(fontWeight: FontWeight.bold)),
                            SizedBox(height: 10),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(100, 50, 0, 30),
                      child: ElevatedButton(
                        onPressed: () {
                          // Remove truck functionality here
                        },
                        child: const Text(
                          'Edit',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                        style: ElevatedButton.styleFrom(
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.horizontal(
                              left: Radius.circular(2),
                              right: Radius.circular(2),
                            ),
                          ),
                          backgroundColor: Colors
                              .grey[300], // Background color of the button
                          elevation: 0,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

          if (!showPayrollContainer)
            SingleChildScrollView(
              child: Container(
                width: 340,
                height: 1030,
                color: Colors.green.shade50,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height,
                      child: Stack(
                        children: [
                          Positioned(
                            top: 0,
                            left: 0,
                            child: IconButton(
                              icon: const Icon(Icons.arrow_back,
                                  size: 35, color: Colors.black),
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const Homepage()),
                                );
                              },
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.fromLTRB(30, 0, 50, 0),
                            child: const Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Expanded(
                                  child: Divider(color: Colors.green),
                                ),
                                Padding(
                                  padding: EdgeInsets.fromLTRB(1, 0, 0, 0),
                                  child: Text(
                                    'Pay Slip',
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.normal,
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Divider(color: Colors.green),
                                ),
                              ],
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

  // Method to create side menu buttons
  //when mouse is not  hovered over them, they will be grey and inactive
  Widget sideMenuButton(String text, Color color, IconData iconData) {
    List<String> menuItems = [
      'Home',
      'Staff',
      'Truck',
      'Order',
      'Delivery',
      'Payroll',
      'Settings',
      'Log Out'
    ];

    return InkWell(
      onTap: () {
        setState(() {
          selectedItem = text;
          switch (text) {
            case 'Home':
              _tabController.animateTo(0);
              break;
            case 'Staff':
              _tabController.animateTo(1);
              break;
            case 'Truck':
              _tabController.animateTo(2);
              break;
            case 'Order':
              _tabController.animateTo(3);
              break;
            case 'Delivery':
              _tabController.animateTo(4);
              break;
            case 'Payroll':
              _tabController.animateTo(5);
              break;
            case 'Settings':
              // Handle Settings
              break;
            case 'Log Out':
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const Homepage()));
              break;
          }
        });
      },
      onHover: (value) {
        setState(() {
          isSidePanelExpanded =
              value || _tabController.index == menuItems.indexOf(text);
        });
      },
      child: Container(
        height: isSidePanelExpanded ? 50 : 50,
        width: isSidePanelExpanded ? double.infinity : 50,
        color: color, // Background color based on the provided color
        padding: EdgeInsets.symmetric(horizontal: isSidePanelExpanded ? 16 : 0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              iconData,
              color: Colors.green,
              size: 35,
            ),
            if (isSidePanelExpanded)
              const SizedBox(width: 20), // Spacing between the icon and title

            if (isSidePanelExpanded)
              Flexible(
                child: Text(
                  text,
                  style: const TextStyle(
                    fontSize: 22,
                    color: Colors.green,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }

  // Method to create menu icons
  Widget menuIcon(IconData icon, Color color) {
    return Container(
      height: 30,
      width: 30,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: color,
      ),
      child: Icon(
        icon,
        color: Colors.black,
      ),
    );
  }
}

void showResults(BuildContext context) {}
