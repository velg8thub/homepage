import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class OrderContent extends StatelessWidget {
  const OrderContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
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
                  ].map<DropdownMenuItem<String>>((String value) {
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
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
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
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
