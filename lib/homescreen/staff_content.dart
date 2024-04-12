import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:velflutter/homescreen/homepage.dart';

class StaffContent extends StatefulWidget {
  StaffContent({super.key});

  @override
  State<StaffContent> createState() => _StaffContentState();
}

class _StaffContentState extends State<StaffContent> {
  bool searchResults =
      false; 
 // Added a boolean showSearchResults to control the visibility of the search results.
  bool isSidePanelExpanded = false;

  BuildContext get index => index;

  bool overlayVisible = false;

  bool showOverlay = false; 
 // Initially set to true to show the overlay
  bool tileTapped = false; 
 // Flag to track if a ListTile is tapped
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

  bool isPoppedOut = false; 
 // add new employee
  Color _containerColor = Colors.transparent;

  //container backgroun color(truck list)
  void _toggleColor() {
    setState(() {
      _isColorChanged = !_isColorChanged;
      _containerColor =
          _isColorChanged ? Colors.transparent : Colors.amberAccent.shade700;
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

  OverlayEntry? overlayEntry;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SingleChildScrollView(
          child: Expanded(
            child: Container(
              color: Colors.white,
              child: Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      alignment: Alignment.centerLeft,
                      padding: const EdgeInsets.all(10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              IconButton(
                                  icon: const Icon(Icons.arrow_back,
                                      size: 35, color: Colors.black),
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
                                padding: EdgeInsets.only(left: 10.0),
                                child: Text(
                                  'Staff List',
                                  style: TextStyle(
                                      fontSize: 35,
                                      fontWeight: FontWeight.bold,
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
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.fromLTRB(25, 2, 0, 0),
                                child: ElevatedButton(
                                  onPressed: () {
                                    // Remove truck functionality here
                                  },
                                  style: ElevatedButton.styleFrom(
                                    shape: const RoundedRectangleBorder(
                                      borderRadius: BorderRadius.horizontal(
                                        left: Radius.circular(2),
                                        right: Radius.circular(2),
                                      ),
                                    ),
                                    backgroundColor: Colors.grey[
                                        300], // Background color of the button
                                    elevation: 0,
                                  ),
                                  child: const Text(
                                    'Remove Employee',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(width: 10),
                              Padding(
                                padding: const EdgeInsets.fromLTRB(25, 2, 0, 0),
                                child: ElevatedButton(
                                  onPressed: () {
                                    // Add truck functionality here
                                    showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return Center(
                                          child: Container(
                                            height: 500,
                                            width: 500,
                                            child: AlertDialog(
                                              backgroundColor:
                                                  Colors.amberAccent.shade700,
                                              title: Column(
                                                children: [
                                                  Row(
                                                    children: [
                                                      GestureDetector(
                                                        onTap: () {
                                                          Navigator.of(context)
                                                              .pop();
                                                        },
                                                        child: const Icon(
                                                            Icons.arrow_back),
                                                      ),
                                                      const SizedBox(width: 80),
                                                      const Text(
                                                          'Add Employee'),
                                                    ],
                                                  ),
                                                  const SizedBox(height: 20),
                                                ],
                                              ),
                                              contentPadding: EdgeInsets.zero,
                                              content: Container(
                                                height: 300,
                                                width: 900,
                                                child: DecoratedBox(
                                                  decoration:
                                                      const BoxDecoration(
                                                    color: Colors.white,
                                                    borderRadius:
                                                        BorderRadius.vertical(
                                                      top: Radius.zero,
                                                      bottom:
                                                          Radius.circular(10.0),
                                                    ),
                                                  ),
                                                  child: Container(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            20.0),
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.min,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Row(
                                                          children: [
                                                            const Text(
                                                              'Staff ID:',
                                                              style: TextStyle(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold),
                                                            ),
                                                            const SizedBox(
                                                                width: 20),
                                                            Container(
                                                              height: 25,
                                                              width: 200,
                                                              child: TextField(
                                                                decoration:
                                                                    InputDecoration(
                                                                  filled: true,
                                                                  fillColor:
                                                                      Colors.grey[
                                                                          200],
                                                                  hintText:
                                                                      'Enter staff ID',
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
                                                              style: TextStyle(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold),
                                                            ),
                                                            const SizedBox(
                                                                width: 10),
                                                            Container(
                                                              height: 25,
                                                              width: 200,
                                                              child: TextField(
                                                                decoration:
                                                                    InputDecoration(
                                                                  filled: true,
                                                                  fillColor:
                                                                      Colors.grey[
                                                                          200],
                                                                  hintText:
                                                                      'Enter username',
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
                                                              style: TextStyle(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold),
                                                            ),
                                                            const SizedBox(
                                                                width: 10),
                                                            Container(
                                                              height: 25,
                                                              width: 200,
                                                              child: TextField(
                                                                decoration:
                                                                    InputDecoration(
                                                                  filled: true,
                                                                  fillColor:
                                                                      Colors.grey[
                                                                          200],
                                                                  hintText:
                                                                      'Enter password',
                                                                ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                        Expanded(
                                                            child: Container()),
                                                        Align(
                                                          alignment: Alignment
                                                              .bottomCenter,
                                                          child: ElevatedButton(
                                                            onPressed: () {
                                                              Navigator.of(
                                                                      context)
                                                                  .pop();
                                                            },
                                                            style:
                                                                ElevatedButton
                                                                    .styleFrom(
                                                              backgroundColor:
                                                                  Colors.blue
                                                                      .shade900, // Background color
                                                              shape:
                                                                  const RoundedRectangleBorder(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .horizontal(
                                                                  left: Radius
                                                                      .circular(
                                                                          10.0),
                                                                  right: Radius
                                                                      .circular(
                                                                          10.0),
                                                                ),
                                                              ),
                                                            ),
                                                            child: const Text(
                                                                'Save',
                                                                style: TextStyle(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold,
                                                                    color: Colors
                                                                        .black)),
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
                                  style: ElevatedButton.styleFrom(
                                    shape: const RoundedRectangleBorder(
                                      borderRadius: BorderRadius.horizontal(
                                        left: Radius.circular(2),
                                        right: Radius.circular(2),
                                      ),
                                    ),
                                    backgroundColor: Colors.grey[
                                        300], // Background color of the button
                                    elevation: 0,
                                  ),
                                  child: const Text(
                                    'Add New Employee',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 5),
                          Container(
                            width: 500,
                            margin: const EdgeInsets.fromLTRB(40, 10, 40, 0),
                            padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                            decoration: BoxDecoration(
                              color: _containerColor,
                              border: Border.all(color: Colors.black),
                            ),
                            child: Row(
                              children: [
                                const CircleAvatar(
                                  radius: 40,
                                  backgroundColor: Colors.white,
                                  backgroundImage:
                                      AssetImage('images/truck1.png'),
                                ),
                                const SizedBox(width: 5),
                                const Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Name',
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black),
                                    ),
                                    Text(
                                      'Staff ID',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black),
                                    ),
                                    Text(
                                      'Position',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black),
                                    ),
                                    Text(
                                      'Status',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black),
                                    ),
                                  ],
                                ),
                                const Spacer(),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    ElevatedButton(
                                      onPressed: () {
                                        setState(
                                          () {
                                            showAddTruck = !showAddTruck;
                                            showRemoveTruck = !showRemoveTruck;
                                            showTruckInfo = !showTruckInfo;
                                            popOverlay = !popOverlay;
                                            selectTruckColorChanged =
                                                !selectTruckColorChanged;
                                            click = !click;
                                            showStaffContainer =
                                                !showStaffContainer;
                                            _toggleColor();
                                          },
                                        );
                                      },
                                      style: ElevatedButton.styleFrom(
                                          shape: const RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.horizontal(
                                            left: Radius.circular(5),
                                            right: Radius.circular(5),
                                          )),
                                          backgroundColor: click
                                              ? Colors.blue
                                              : Colors.blue.shade200,
                                          foregroundColor: click
                                              ? Colors.white
                                              : Colors.black),
                                      child: const Text('Select'),
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
                            margin: const EdgeInsets.fromLTRB(40, 10, 40, 0),
                            padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                            decoration: BoxDecoration(
                              // color: _containerColor,
                              border: Border.all(color: Colors.black),
                            ),
                            child: Row(
                              children: [
                                const CircleAvatar(
                                  radius: 40,
                                  backgroundColor: Colors.white,
                                  backgroundImage:
                                      AssetImage('images/truck1.png'),
                                ),
                                const SizedBox(width: 5),
                                const Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Name',
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black),
                                    ),
                                    Text(
                                      'Staff ID',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black),
                                    ),
                                    Text(
                                      'Position',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black),
                                    ),
                                    Text(
                                      'Status',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black),
                                    ),
                                  ],
                                ),
                                const Spacer(),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    ElevatedButton(
                                      onPressed: () {},
                                      style: ElevatedButton.styleFrom(
                                          shape: const RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.horizontal(
                                            left: Radius.circular(5),
                                            right: Radius.circular(5),
                                          )),
                                          backgroundColor:
                                              Colors.blue.shade200),
                                      child: const Text('Select'),
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
                            margin: const EdgeInsets.fromLTRB(40, 10, 40, 0),
                            padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.black),
                            ),
                            child: Row(
                              children: [
                                const CircleAvatar(
                                  radius: 40,
                                  backgroundColor: Colors.white,
                                  backgroundImage:
                                      AssetImage('images/truck1.png'),
                                ),
                                const SizedBox(width: 5),
                                const Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Name',
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black),
                                    ),
                                    Text(
                                      'Satff ID',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black),
                                    ),
                                    Text(
                                      'Position',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black),
                                    ),
                                    Text(
                                      'Status',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black),
                                    ),
                                  ],
                                ),
                                const Spacer(),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    ElevatedButton(
                                      onPressed: () {},
                                      style: ElevatedButton.styleFrom(
                                          shape: const RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.horizontal(
                                            left: Radius.circular(5),
                                            right: Radius.circular(5),
                                          )),
                                          backgroundColor:
                                              Colors.blue.shade200),
                                      child: const Text('Select'),
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
                            margin: const EdgeInsets.fromLTRB(40, 10, 40, 0),
                            padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.black),
                            ),
                            child: Row(
                              children: [
                                const CircleAvatar(
                                  radius: 40,
                                  backgroundColor: Colors.white,
                                  backgroundImage:
                                      AssetImage('images/truck1.png'),
                                ),
                                const SizedBox(width: 5),
                                const Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Name',
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black),
                                    ),
                                    Text(
                                      'Staff ID',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black),
                                    ),
                                    Text(
                                      'Position',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black),
                                    ),
                                    Text(
                                      'Status',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black),
                                    ),
                                  ],
                                ),
                                const Spacer(),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    ElevatedButton(
                                      onPressed: () {},
                                      style: ElevatedButton.styleFrom(
                                          shape: const RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.horizontal(
                                                      left: Radius.circular(5),
                                                      right:
                                                          Radius.circular(5))),
                                          backgroundColor:
                                              Colors.blue.shade200),
                                      child: const Text('Select'),
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
              margin: const EdgeInsets.fromLTRB(20, 50, 20, 20),
              padding: const EdgeInsets.fromLTRB(25, 10, 25, 0),
              color: Colors.yellow[100],
              child: const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.face_4_rounded, size: 50, color: Colors.black),
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
                      style: ElevatedButton.styleFrom(
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.horizontal(
                            left: Radius.circular(2),
                            right: Radius.circular(2),
                          ),
                        ),
                        backgroundColor:
                            Colors.grey[300], // Background color of the button
                        elevation: 0,
                      ),
                      child: const Text(
                        'Edit',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
      ],
    );
  }
}
