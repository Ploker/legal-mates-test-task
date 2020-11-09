import 'package:flutter/material.dart';

class CaseWidget extends StatelessWidget {
  Widget _buildTag({String tagName, Icon icon, bool active = false}) {
    return Chip(
      avatar: icon,
      label: Text(
        tagName,
        style: TextStyle(
            color: active
                ? Color(0xff0D2834)
                : Color(0xff0D2834).withOpacity(0.6)),
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(3),
        side: BorderSide(
          color: active ? Color(0xffC8A574) : Color(0xffB6BFC2),
          width: 1.5,
        ),
      ),
      backgroundColor: Colors.white,
    );
  }

  Widget _buildTags() {
    return Wrap(
      spacing: 8.0, // gap between adjacent chips
      runSpacing: 4.0, // gap between lines
      children: [
        _buildTag(tagName: "Auto accident", active: true),
        _buildTag(
            tagName: "Los Angeles Country, CA",
            icon: Icon(Icons.location_on, size: 18)),
        _buildTag(
            tagName: "Los Angeles Country, CA",
            icon: Icon(Icons.account_balance, size: 18)),
        _buildTag(
            tagName: "Sep 19, 2019",
            icon: Icon(Icons.calendar_today, size: 18)),
      ],
    );
  }

  Widget _buildDescription(String description) {
    return Text(
      description,
      style: TextStyle(
        color: Color(0xff0D2834).withOpacity(0.6),
        fontSize: 14,
        height: 1.65,
        letterSpacing: -0.5,
      ),
    );
  }

  Widget _buildInfoBlock({String title, String value}) {
    return SizedBox(
      height: 48,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 12,
              color: Color(0xff0D2834).withOpacity(0.38),
            ),
          ),
          SizedBox(height: 5),
          Text(
            value,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: Color(0xff0D2834),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildTitle(String title) {
    return Text(
      title,
      style: TextStyle(
        color: Color(0xff0D2834),
        fontSize: 20,
        fontWeight: FontWeight.w600,
      ),
    );
  }

  Widget _buildTagInfo({String name, String value}) {
    return Container(
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(3),
          border: Border.all(color: Color(0xffC8A574), width: 1.5),
          color: Colors.white),
      child: Text.rich(TextSpan(
        text: name,
        style: TextStyle(color: Color(0xffB6BFC2), fontSize: 13),
        children: <TextSpan>[
          TextSpan(
            text: value,
            style: TextStyle(color: Color(0xff0D2834), fontSize: 13),
          ),
        ],
      )),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 24),
          _buildTitle("John Smith | Smith Law Firm"),
          SizedBox(height: 20),
          Row(
            children: [
              _buildTagInfo(name: "Bidders: ", value: "12"),
              SizedBox(width: 10),
              _buildTagInfo(name: "Interviews: ", value: "5"),
            ],
          ),
          SizedBox(height: 24),
          _buildDescription(
              'Feugiat, occaecati arcu magna explicabo cons ectetur tempore quos fugiat dolorasperna tur varius, gravida quas, autem consectetur hic  faucibus nesciunt, arcu consectetu raute...'),
          SizedBox(height: 24),
          _buildTags(),
          SizedBox(height: 24),
          GridView.count(
            shrinkWrap: true,
            crossAxisCount: 2,
            childAspectRatio: 4,
            children: [
              _buildInfoBlock(title: "Min referral fee", value: "30%"),
              _buildInfoBlock(
                  title: "Area of practice", value: "Personal Injury"),
              _buildInfoBlock(title: "Posted", value: "Sep 19, 2019"),
              _buildInfoBlock(title: "Represent", value: "Plaintiff"),
            ],
          ),
          SizedBox(height: 24),
          SizedBox(
            width: double.infinity,
            child: RaisedButton(
              onPressed: () {},
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(6),
              ),
              textColor: Colors.white,
              color: Color(0xffC8A574),
              padding: EdgeInsets.symmetric(vertical: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "More about the Bidders",
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(width: 10),
                  Icon(Icons.info_outline)
                ],
              ),
            ),
          ),
          SizedBox(height: 12),
          Row(
            children: [
              Expanded(
                child: RaisedButton(
                  onPressed: () {},
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4),
                    side: BorderSide(
                      color: Color(0xffB6BFC2),
                      width: 2,
                    ),
                  ),
                  textColor: Color(0xff0D2834),
                  color: Colors.white,
                  padding: EdgeInsets.symmetric(vertical: 15),
                  child: Text(
                    "Edit",
                    style: TextStyle(fontSize: 16),
                  ),
                ),
              ),
              SizedBox(width: 12),
              Expanded(
                child: RaisedButton(
                  onPressed: () {},
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4),
                    side: BorderSide(
                      color: Color(0xffEB5757),
                      width: 2,
                    ),
                  ),
                  textColor: Color(0xffEB5757),
                  color: Colors.white,
                  padding: EdgeInsets.symmetric(vertical: 15),
                  child: Text(
                    "Delete",
                    style: TextStyle(fontSize: 16),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 16),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 15),
            height: 1,
            color: Color(0xffB6BFC2).withOpacity(0.6),
          ),
        ],
      ),
    );
  }
}
