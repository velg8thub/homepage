import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:velflutter/homescreen/homepage.dart';

class PayrollContent extends StatefulWidget {
  const PayrollContent({super.key});

  @override
  State<PayrollContent> createState() => _PayrollContentState();
}

class _PayrollContentState extends State<PayrollContent> {
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


  OverlayEntry? overlayEntry;

 

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Row(
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
                                      'Payroll',
                                      style: TextStyle(
                                          fontSize: 35,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black),
                                    ),
                                  ),
                                  // Search Truck
                                  const SizedBox(width: 40),
                                  Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(40, 2, 0, 0),
                                    child: ElevatedButton.icon(
                                      onPressed: () {
                                        // Your search functionality here
                                      },
                                      icon: const Icon(Icons.search,
                                          color: Colors.black, size: 30),
                                      label: const Text(
                                        'Search Staff',
                                        style: TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.normal,
                                            color: Colors.grey),
                                      ),
                                      style: ElevatedButton.styleFrom(
                                        shape: const RoundedRectangleBorder(
                                          borderRadius: BorderRadius.horizontal(
                                            left: Radius.circular(5),
                                            right: Radius.circular(5),
                                          ),
                                        ),
                                        backgroundColor: Colors.grey[
                                            300], // Background color of the button
                                        elevation: 0,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 5),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Padding(
                                    padding: EdgeInsets.only(left: 10.0),
                                    child: Text(
                                      'Week:',
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black),
                                    ),
                                  ),
                                  // Add Truck
                                  Padding(
                                    padding: const EdgeInsets.all(10),
                                    child: DropdownButton<String>(
                                      value:
                                          'From March 4 2024 to March 9 2024',
                                      onChanged: (String? newValue) {
                                        // Handle dropdown value change
                                      },
                                      items: <String>[
                                        'From March 4 2024 to March 9 2024'
                                      ].map<DropdownMenuItem<String>>(
                                        (String value) {
                                          return DropdownMenuItem<String>(
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
                                        const EdgeInsets.fromLTRB(25, 2, 0, 0),
                                    child: ElevatedButton(
                                      onPressed: () {
                                        // Remove truck functionality here
                                      },
                                      child: const Text(
                                        'Set Pay Rate',
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
                                        backgroundColor: Colors.grey[
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
                                margin:
                                    const EdgeInsets.fromLTRB(40, 10, 40, 0),
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
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Truck ID',
                                          style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.black),
                                        ),
                                        Text(
                                          'Cargo Type:',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: Colors.black),
                                        ),
                                        Text(
                                          'Truck Type:',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: Colors.black),
                                        ),
                                        Text(
                                          'Max Capacity:',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: Colors.black),
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
                                              fontWeight: FontWeight.normal,
                                              color: Colors.green),
                                        ),
                                        const SizedBox(height: 10),
                                        ElevatedButton(
                                          onPressed: () {
                                            setState(
                                              () {
                                                showAddTruck = !showAddTruck;
                                                showRemoveTruck =
                                                    !showRemoveTruck;
                                                showTruckInfo = !showTruckInfo;
                                                popOverlay = !popOverlay;
                                                showPayrollContainer =
                                                    !showPayrollContainer;
                                                selectTruckColorChanged =
                                                    !selectTruckColorChanged;
                                                click = !click;
                                                _toggleColor();
                                              },
                                            );
                                          },
                                          child: const Text('Select'),
                                          style: ElevatedButton.styleFrom(
                                              shape:
                                                  const RoundedRectangleBorder(
                                                      borderRadius: BorderRadius
                                                          .horizontal(
                                                left: Radius.circular(5),
                                                right: Radius.circular(5),
                                              )),
                                              backgroundColor: click
                                                  ? Colors.blue
                                                  : Colors.blue.shade200,
                                              foregroundColor: click
                                                  ? Colors.white
                                                  : Colors.black),
                                        ),
                                        const SizedBox(height: 10),
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
                                margin:
                                    const EdgeInsets.fromLTRB(40, 10, 40, 0),
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
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Truck ID',
                                          style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.black),
                                        ),
                                        Text(
                                          'Cargo Type:',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: Colors.black),
                                        ),
                                        Text(
                                          'Truck Type:',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: Colors.black),
                                        ),
                                        Text(
                                          'Max Capacity:',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: Colors.black),
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
                                              fontWeight: FontWeight.normal,
                                              color: Colors.green),
                                        ),
                                        const SizedBox(height: 10),
                                        ElevatedButton(
                                          onPressed: () {},
                                          child: const Text('Select'),
                                          style: ElevatedButton.styleFrom(
                                              shape:
                                                  const RoundedRectangleBorder(
                                                      borderRadius: BorderRadius
                                                          .horizontal(
                                                left: Radius.circular(5),
                                                right: Radius.circular(5),
                                              )),
                                              backgroundColor:
                                                  Colors.blue.shade200),
                                        ),
                                        const SizedBox(height: 10),
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
                                margin:
                                    const EdgeInsets.fromLTRB(40, 10, 40, 0),
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
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Truck ID',
                                          style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.black),
                                        ),
                                        Text(
                                          'Cargo Type:',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: Colors.black),
                                        ),
                                        Text(
                                          'Truck Type:',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: Colors.black),
                                        ),
                                        Text(
                                          'Max Capacity:',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: Colors.black),
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
                                              fontWeight: FontWeight.normal,
                                              color: Colors.green),
                                        ),
                                        const SizedBox(height: 10),
                                        ElevatedButton(
                                          onPressed: () {},
                                          child: const Text('Select'),
                                          style: ElevatedButton.styleFrom(
                                              shape:
                                                  const RoundedRectangleBorder(
                                                      borderRadius: BorderRadius
                                                          .horizontal(
                                                left: Radius.circular(5),
                                                right: Radius.circular(5),
                                              )),
                                              backgroundColor:
                                                  Colors.blue.shade200),
                                        ),
                                        const SizedBox(height: 10),
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
                                margin:
                                    const EdgeInsets.fromLTRB(40, 10, 40, 0),
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
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Truck ID',
                                          style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.black),
                                        ),
                                        Text(
                                          'Cargo Type:',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: Colors.black),
                                        ),
                                        Text(
                                          'Truck Type:',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: Colors.black),
                                        ),
                                        Text(
                                          'Max Capacity:',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: Colors.black),
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
                                              fontWeight: FontWeight.normal,
                                              color: Colors.green),
                                        ),
                                        const SizedBox(height: 10),
                                        ElevatedButton(
                                          onPressed: () {},
                                          child: const Text('Select'),
                                          style: ElevatedButton.styleFrom(
                                              shape:
                                                  const RoundedRectangleBorder(
                                                      borderRadius: BorderRadius
                                                          .horizontal(
                                                              left: Radius
                                                                  .circular(5),
                                                              right: Radius
                                                                  .circular(
                                                                      5))),
                                              backgroundColor:
                                                  Colors.blue.shade200),
                                        ),
                                        const SizedBox(height: 10),
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
                  margin: const EdgeInsets.fromLTRB(20, 50, 20, 20),
                  padding: const EdgeInsets.fromLTRB(25, 10, 25, 0),
                  color: Colors.yellow[100],
                  child: const Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.local_shipping, size: 50, color: Colors.black),
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
        if (showPayrollContainer)
          // Right panel for Truck
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
                          padding: const EdgeInsets.fromLTRB(90, 0, 105, 0),
                          child: const Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Expanded(
                                child: Divider(color: Colors.green),
                              ),
                              Padding(
                                padding: EdgeInsets.fromLTRB(2, 0, 0, 0),
                                child: Text(
                                  'Pay Slip',
                                  style: TextStyle(
                                    fontSize: 14,
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
    );
  }
}
