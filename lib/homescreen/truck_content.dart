import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:velflutter/homescreen/homepage.dart';

class TruckContent extends StatefulWidget {
   TruckContent({super.key});

  @override
  State<TruckContent> createState() => _TruckContentState();
}

class _TruckContentState extends State<TruckContent> {
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


  void _hideSidePanel() {
    setState(() {
      hideSidePanel = true;
    });
  }

  set isHomeHovered(bool isHomeHovered) {}


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
                                  'Truck List',
                                  style: TextStyle(
                                      fontSize: 35,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black),
                                ),
                              ),
                              // Search Truck
                              const SizedBox(width: 40),
                              Padding(
                                padding: const EdgeInsets.fromLTRB(40, 2, 0, 0),
                                child: ElevatedButton.icon(
                                  onPressed: () {
                                    // Your search functionality here
                                  },
                                  icon: const Icon(Icons.search,
                                      color: Colors.black, size: 30),
                                  label: const Text(
                                    'Search Truck',
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
                          // Add Truck
                          if (showFirstContainer)
                            Padding(
                              padding: const EdgeInsets.fromLTRB(25, 2, 0, 0),
                              child: ElevatedButton(
                                onPressed: () {
                                  // Add truck functionality here
                                },
                                child: const Text(
                                  'Add Truck',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black),
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
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              if (!showFirstContainer) //switch
                                Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(25, 2, 0, 0),
                                  child: ElevatedButton(
                                    onPressed: () {
                                      // Remove truck functionality here
                                    },
                                    child: const Text(
                                      'Remove Truck',
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
                              if (!showAddTruck)
                                Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(25, 2, 0, 0),
                                  child: ElevatedButton(
                                    onPressed: () {
                                      // Add truck functionality here
                                    },
                                    child: const Text(
                                      'Add Truck',
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
                                  crossAxisAlignment: CrossAxisAlignment.end,
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
                                            showRemoveTruck = !showRemoveTruck;
                                            showTruckInfo = !showTruckInfo;
                                            showFirstContainer =
                                                !showFirstContainer;
                                            popOverlay = !popOverlay;
                                            selectTruckColorChanged =
                                                !selectTruckColorChanged;
                                            click = !click;
                                            _toggleColor();
                                          },
                                        );
                                      },
                                      child: const Text('Select'),
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
                                  crossAxisAlignment: CrossAxisAlignment.end,
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
                                          shape: const RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.horizontal(
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
                                  crossAxisAlignment: CrossAxisAlignment.end,
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
                                          shape: const RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.horizontal(
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
                                  crossAxisAlignment: CrossAxisAlignment.end,
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
                                          shape: const RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.horizontal(
                                                      left: Radius.circular(5),
                                                      right:
                                                          Radius.circular(5))),
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
        if (showFirstContainer)
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
                                        builder: (context) => const Homepage()),
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
                              margin: const EdgeInsets.symmetric(vertical: 8.0),
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
                                crossAxisAlignment: CrossAxisAlignment.stretch,
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
                                crossAxisAlignment: CrossAxisAlignment.stretch,
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
      ],
    );
    
  }
}
