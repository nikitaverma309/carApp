import 'package:flutter/material.dart';

class FilterPage extends StatefulWidget {
  const FilterPage({super.key});

  @override
  State<FilterPage> createState() => _FilterPageState();
}

class _FilterPageState extends State<FilterPage> {
  List<FilterModel> filterList = [
    FilterModel(
        title: "Sort By",
        filterValues: [
          FilterValue(title: "Relevance", isSelected: false),
          FilterValue(title: "Low to High", isSelected: false),
          FilterValue(title: "Best rated", isSelected: false),
          FilterValue(title: "Distance", isSelected: false),
          FilterValue(title: "Most Booked", isSelected: false),
        ],
        isMultiselect: false),
    FilterModel(
        title: "Distance",
        filterValues: [
          FilterValue(title: "Within 2 km", isSelected: false),
          FilterValue(title: "Within 5 km", isSelected: false),
          FilterValue(title: "Within 10 km", isSelected: false),
        ],
        isMultiselect: false),
    FilterModel(
        title: "Transmission",
        filterValues: [
          FilterValue(title: "Manual", isSelected: false),
          FilterValue(title: "Automatic", isSelected: false),
        ],
        isMultiselect: true),
    FilterModel(
        title: "Seats",
        filterValues: [
          FilterValue(title: "4/5 Seater", isSelected: false),
          FilterValue(title: "7 Seater", isSelected: false),
        ],
        isMultiselect: true),
    FilterModel(
        title: "Car type",
        filterValues: [
          FilterValue(title: "Hatchback", isSelected: false),
          FilterValue(title: "Sedan", isSelected: false),
          FilterValue(title: "SUV", isSelected: false),
          FilterValue(title: "Luxury", isSelected: false),
        ],
        isMultiselect: true),
    FilterModel(
        title: "Ratings",
        filterValues: [
          FilterValue(title: "4+ rated", isSelected: false),
          FilterValue(title: "3+ rated", isSelected: false),
          FilterValue(title: "All", isSelected: false),
        ],
        isMultiselect: false),
    FilterModel(
        title: "Fuel type",
        filterValues: [
          FilterValue(title: "Petrol", isSelected: false),
          FilterValue(title: "Diesel", isSelected: false),
        ],
        isMultiselect: true),
    FilterModel(
        title: "Addons",
        filterValues: [
          FilterValue(title: "FAXTag", isSelected: false),
        ],
        isMultiselect: true),
  ];

  int selectedFilterId = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: Container(
          color: Colors.white,
          height: 70,
          padding:
              EdgeInsets.symmetric(horizontal: 16).copyWith(bottom: 10, top: 8),
          child: ElevatedButton(
            onPressed: () {},
            child: Text("Apply"),
          ),
        ),
        appBar: AppBar(
           title: Text("Filter"),
        ),
        body: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 10,
              ),
              ...filterList.map((filter) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      filter.title,
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                    ),
                    SizedBox(
                      height: 4,
                    ),
                    Wrap(
                      crossAxisAlignment: WrapCrossAlignment.start,
                      children: [
                        ...filter.filterValues
                            .map((filterValue) => Padding(
                                  padding:
                                      EdgeInsets.only(right: 12, bottom: 8),
                                  child: InkWell(
                                    onTap: () {
                                      if (!filter.isMultiselect) {
                                        filter.filterValues.forEach((element) {
                                          element.isSelected = false;
                                        });
                                      }
                                      filterValue.isSelected =
                                          !filterValue.isSelected;
                                      setState(() {});
                                    },
                                    child: Container(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 12, vertical: 12),
                                        decoration: BoxDecoration(
                                            color: filterValue.isSelected
                                                ? Theme.of(context).primaryColor
                                                : null,
                                            borderRadius:
                                                BorderRadius.circular(12),
                                            border: Border.all(
                                                color: Colors.black
                                                    .withOpacity(.25))),
                                        child: Text(
                                          filterValue.title,
                                          style: TextStyle(
                                              color: filterValue.isSelected
                                                  ? Colors.white
                                                  : Colors.black,fontSize: 14,fontWeight: FontWeight.w500),
                                        )),
                                  ),
                                ))
                            .toList()
                      ],
                    ),
                    SizedBox(
                      height: 18,
                    ),
                  ],
                );
              })
            ],
          ),
        ));
  }
}

class FilterModel {
  final String title;
  final List<FilterValue> filterValues;
  final bool isMultiselect;

  FilterModel(
      {required this.title,
      required this.filterValues,
      required this.isMultiselect});
}

class FilterValue {
  late bool isSelected;
  final String title;

  FilterValue({required this.title, required this.isSelected});
}
