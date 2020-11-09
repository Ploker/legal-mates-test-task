import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FilterWidget extends StatefulWidget {
  @override
  _FilterWidgetState createState() => _FilterWidgetState();
}

class _FilterWidgetState extends State<FilterWidget> {
  String _search;
  int _area = 0;
  int _type;
  int _state;
  double _rateFrom = 1;
  double _rateEnd = 100;

  double _minRate = 0;
  double _maxRate = 100;

  TextEditingController _searchController = new TextEditingController();
  TextEditingController _fromRateController = new TextEditingController();
  TextEditingController _endRateController = new TextEditingController();

  @override
  void initState() {
    super.initState();

    setState(() {
      _fromRateController.text = _rateFrom.round().toString();
      _endRateController.text = _rateEnd.round().toString();
    });

    _searchController.addListener(_setSeartchValue);
    _fromRateController.addListener(_setFromRateValue);
    _endRateController.addListener(_setEndRateValue);
  }

  _setSeartchValue() {
    setState(() {
      _search = _searchController.text;
    });
    print("Seartch field: ${_searchController.text}");
  }

  _setFromRateValue() {
    double fromRateController =
        double.parse(_fromRateController.text).roundToDouble();
    double endRateController =
        double.parse(_endRateController.text).roundToDouble();
    if (fromRateController <= endRateController &&
        fromRateController >= _minRate &&
        endRateController >= _minRate &&
        fromRateController <= _maxRate &&
        endRateController <= _maxRate) {
      setState(() {
        _rateFrom = double.parse(_fromRateController.text).roundToDouble();
      });
    }

    print("From Rate field: ${_fromRateController.text}");
  }

  _setEndRateValue() {
    double fromRateController =
        double.parse(_fromRateController.text).roundToDouble();
    double endRateController =
        double.parse(_endRateController.text).roundToDouble();
    if (fromRateController <= endRateController &&
        fromRateController >= _minRate &&
        endRateController >= _minRate &&
        fromRateController <= _maxRate &&
        endRateController <= _maxRate) {
      setState(() {
        _rateEnd = double.parse(_endRateController.text).roundToDouble();
      });
    }

    print("To Rate field: ${_endRateController.text}");
  }

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Widget _buildSearchField() {
    return TextFormField(
      controller: _searchController,
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white,
        suffixIcon: Icon(
          Icons.search,
          color: Color(0xffc8a574),
        ),
        hintText: 'Search for cases',
        hintStyle: TextStyle(
            color: Color(0xff0D2834).withOpacity(0.38),
            fontSize: 16,
            fontWeight: FontWeight.w500),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: new BorderSide(
              color: Color(0xff0D2834).withOpacity(0.24), width: 1), //
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: new BorderSide(
            color: Color(0xff0D2834).withOpacity(0.24),
            width: 1,
          ), //Color(0xff0D2834)
        ),
      ),
    );
  }

  Widget _buildAreaDropDown() {
    var areaList = [
      DropdownMenuItem(child: Text("All areas"), value: 0),
      DropdownMenuItem(child: Text("First areas"), value: 1),
      DropdownMenuItem(child: Text("Second areas"), value: 2),
      DropdownMenuItem(child: Text("Third areas"), value: 3),
      DropdownMenuItem(child: Text("Fourth areas"), value: 4)
    ];

    return _buildDropDownWidget(
      value: _area,
      hint: "Type of case",
      dropdownMenuItems: areaList,
      onChanged: (value) {
        setState(() {
          _area = value;
        });
      },
    );
  }

  Widget _buildTypeDropDown() {
    var typeList = [
      DropdownMenuItem(child: Text("First case"), value: 1),
      DropdownMenuItem(child: Text("Second case"), value: 2),
      DropdownMenuItem(child: Text("Third case"), value: 3),
      DropdownMenuItem(child: Text("Fourth case"), value: 4)
    ];

    return _buildDropDownWidget(
      value: _type,
      hint: "Type of case",
      dropdownMenuItems: typeList,
      onChanged: (value) {
        setState(() {
          _type = value;
        });
      },
    );
  }

  Widget _buildStateDropDown() {
    var stateList = [
      DropdownMenuItem(child: Text("First State"), value: 1),
      DropdownMenuItem(child: Text("Second State"), value: 2),
      DropdownMenuItem(child: Text("Third State"), value: 3),
      DropdownMenuItem(child: Text("Fourth State"), value: 4)
    ];

    return _buildDropDownWidget(
      value: _state,
      hint: "State",
      dropdownMenuItems: stateList,
      onChanged: (value) {
        setState(() {
          _state = value;
        });
      },
    );
  }

  Widget _buildRateSlider() {
    return Column(
      children: [
        Container(
          child: Row(
            children: [
              Flexible(
                child: TextFormField(
                  keyboardType: TextInputType.number,
                  controller: _fromRateController,
                  decoration: InputDecoration(
                    labelText: "From",
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    suffixText: "%",
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: BorderSide(
                          color: Color(0xff0D2834).withOpacity(0.24), width: 1),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: BorderSide(
                          color: Color(0xff0D2834).withOpacity(0.24), width: 1),
                    ),
                  ),
                ),
              ),
              // Flexible(
              Container(
                margin: EdgeInsets.symmetric(horizontal: 8),
                height: 1,
                width: 17,
                decoration:
                    BoxDecoration(color: Color(0xff0D2834).withOpacity(0.24)),
              ),
              // ),
              Flexible(
                child: TextFormField(
                  keyboardType: TextInputType.number,
                  controller: _endRateController,
                  decoration: InputDecoration(
                    labelText: "To",
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    suffixText: "%",
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide:
                          BorderSide(color: Color(0xffB6BFC2), width: 1),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: BorderSide(
                          color: Color(0xff0D2834).withOpacity(0.24), width: 1),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 20),
        RangeSlider(
          activeColor: Color(0xffc8a574),
          inactiveColor: Color(0xffe5e8ea),
          values: RangeValues(_rateFrom, _rateEnd),
          min: _minRate,
          max: _maxRate,
          onChanged: (RangeValues newRange) {
            setState(() {
              _rateFrom = newRange.start.roundToDouble();
              _rateEnd = newRange.end.roundToDouble();
              _fromRateController.text = _rateFrom.round().toString();
              _endRateController.text = _rateEnd.round().toString();
            });
          },
        ),
      ],
    );
  }

  Widget _buildDropDownWidget(
      {value,
      String hint,
      List<DropdownMenuItem> dropdownMenuItems,
      void Function(dynamic) onChanged}) {
    return Container(
      width: double.maxFinite,
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          border:
              Border.all(color: Color(0xff0D2834).withOpacity(0.24), width: 1),
          color: Colors.white),
      child: DropdownButtonHideUnderline(
        child: DropdownButton(
          disabledHint: null,
          hint: Text(hint),
          style: TextStyle(
            color: Color(0xff203945),
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
          value: value,
          items: dropdownMenuItems,
          onChanged: (newvalue) {
            onChanged(newvalue);
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        decoration: BoxDecoration(
            color: Color(0xffE8ECEE).withOpacity(0.38),
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(5),
              bottomRight: Radius.circular(5),
            )),
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
        child: Form(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildSearchField(),
              SizedBox(height: 30),
              Text(
                "Filters",
                style: GoogleFonts.workSans(
                  color: Color(0xff0D2834),
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 24),
              _buildAreaDropDown(),
              SizedBox(height: 24),
              _buildTypeDropDown(),
              SizedBox(height: 24),
              _buildStateDropDown(),
              SizedBox(height: 24),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 15),
                height: 1,
                color: Color(0xffB6BFC2).withOpacity(0.6),
              ),
              SizedBox(height: 24),
              Text(
                "Choose the rate",
                style: TextStyle(
                  color: Color(0xff0D2834),
                  fontSize: 23,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 20),
              _buildRateSlider(),
              SizedBox(height: 20),
              SizedBox(
                width: double.infinity,
                child: RaisedButton(
                  onPressed: () {
                    print('Apply filters');
                  },
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(6),
                  ),
                  textColor: Colors.white,
                  color: Color(0xff0D2834),
                  padding: EdgeInsets.symmetric(vertical: 20),
                  child: Text(
                    "Apply Filters",
                    style: TextStyle(fontSize: 24),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
