import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:quick_mart/consts/app_colors.dart';
import 'package:quick_mart/consts/app_dimensions.dart';
import 'package:quick_mart/consts/app_paths.dart';
import 'package:quick_mart/models/entity/search_object.dart';

class SearchWidget extends StatefulWidget {
  const SearchWidget({super.key});

  @override
  State<SearchWidget> createState() => _SearchWidgetState();
}

class _SearchWidgetState extends State<SearchWidget> {
  List<SearchListHome> listSearchHome = [
    SearchListHome(title: 'Smart watch', icon: AppPath.ic_send),
    SearchListHome(title: 'Laptop', icon: AppPath.ic_send),
    SearchListHome(title: 'Women bag', icon: AppPath.ic_send),
    SearchListHome(title: 'Headphones', icon: AppPath.ic_send),
    SearchListHome(title: 'Shoes', icon: AppPath.ic_send),
    SearchListHome(title: 'Eye glasses', icon: AppPath.ic_send),
    SearchListHome(title: 'Smart watch', icon: AppPath.ic_send),
    SearchListHome(title: 'Laptop', icon: AppPath.ic_send),
    SearchListHome(title: 'Women bag', icon: AppPath.ic_send),
    SearchListHome(title: 'Headphones', icon: AppPath.ic_send),
    SearchListHome(title: 'Shoes', icon: AppPath.ic_send),
    SearchListHome(title: 'Shoes', icon: AppPath.ic_send),
    SearchListHome(title: 'Shoes', icon: AppPath.ic_send),
    SearchListHome(title: 'Shoes', icon: AppPath.ic_send),
    SearchListHome(title: 'Shoes', icon: AppPath.ic_send),
    SearchListHome(title: 'Shoes', icon: AppPath.ic_send),
  ];

  List<SearchListHome> listSearch = [];

  @override
  void initState() {
    listSearch = listSearchHome;
    super.initState();
  }

  void _buildSearchList(String textSearch) {
    List<SearchListHome> results = [];
    if (textSearch.isEmpty) {
      results = listSearchHome;
    } else {
      results = listSearchHome
          .where((element) => element.title!.toLowerCase().contains(textSearch.toLowerCase()))
          .toList();
    }
    setState(() {
      listSearch = results;
    });
  }

  final FocusNode _textFocus = FocusNode();
  final TextEditingController _textCtl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        top: true,
        child: Column(
          children: [
            Row(
              children: [
                SizedBox(width: 16),
                SvgPicture.asset(AppPath.ic_home),
                Text(
                  'uickMart',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Spacer(),
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: SvgPicture.asset(
                    AppPath.ic_cancel,
                    width: 32,
                    height: 32,
                  ),
                ),
                SizedBox(width: 16),
              ],
            ),
            SizedBox(height: 16),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 16),
              child: TextField(
                controller: _textCtl,
                focusNode: _textFocus,
                onChanged: (value) {
                  _buildSearchList(value);
                },
                decoration: InputDecoration(
                  prefixIcon: Container(
                    padding: EdgeInsets.all(12),
                    child: SvgPicture.asset(
                      AppPath.ic_search,
                    ),
                  ),
                  hintText: 'Search',
                  enabledBorder: buildTextField(),
                  focusedBorder: buildTextField(),
                ),
              ),
            ),
            SizedBox(height: 16),
            Row(
              children: [
                SizedBox(width: 16),
                Text(
                  'RECENT SEARCH',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: AppColors.cBlack_50,
                  ),
                ),
              ],
            ),
            Expanded(
              child: ListView.builder(
                scrollDirection: Axis.vertical,
                itemCount: listSearch.length,
                physics: BouncingScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (context, int index) {
                  return buildItemListViewSearch(index, listSearch[index]);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Container buildItemListViewSearch(int index, SearchListHome item) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      height: 30,
      width: getWidth(context),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(width: 16),
          Text(
            '${item.title}',
            style: TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 14,
              color: AppColors.cBlack_50,
            ),
          ),
          Spacer(),
          Container(
            width: 24,
            height: 24,
            child: SvgPicture.asset(AppPath.ic_send),
          ),
          SizedBox(width: 16),
        ],
      ),
    );
  }

  OutlineInputBorder buildTextField() {
    return OutlineInputBorder(
      borderSide: BorderSide(
        width: 1,
        color: AppColors.cGray_50,
      ),
      borderRadius: BorderRadius.circular(15),
    );
  }
}
