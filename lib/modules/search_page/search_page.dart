import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:real_estate/custom_widgets/custom_button.dart';
import 'package:real_estate/modules/search_page/search_page_controller.dart';

import '../../custom_widgets/property_home_page_card.dart';
import '../../custom_widgets/property_search_card.dart';

List<DropdownMenuItem<String>> filterOptions = [
  DropdownMenuItem(
      value: 'Size',
      child: Text(
        'Size',
        style: TextStyle(fontSize: 20),
      )),
  DropdownMenuItem(
      value: 'Price',
      child: Text(
        'Price',
        style: TextStyle(fontSize: 20),
      )),
];

class SearchPage extends StatelessWidget {
  String? filterOption;
  String? selectedAddress;

  SearchPageController searchPageController = Get.find();

  Future<void> getSearchResult() async {
    searchPageController.clearList();
    bool temp =
        await searchPageController.getSearchResult(this.selectedAddress);

    if (temp) {
      EasyLoading.showSuccess('Done', duration: Duration(seconds: 2));
    } else {
      EasyLoading.showError('No Result', duration: Duration(seconds: 2));
    }
  }

  Future<void> getFilterResult()async{
    searchPageController.clearList();

    bool temp = await searchPageController.getFilterResult(this.filterOption);

    if(temp){
      EasyLoading.showSuccess('Done', duration: Duration(seconds: 2));
    }else{
      EasyLoading.showError('No Result', duration: Duration(seconds: 2));
    }

  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
          color: Colors.black,
          icon: Icon(Icons.arrow_back),
          onPressed: (){
            Navigator.pop(context);
          },
        ),
      ),
      body: SafeArea(
          child: Padding(
        padding: EdgeInsets.symmetric(vertical: 20, horizontal: 8),
        child: Column(
          children: [

            Row(
              children: [
                Expanded(
                    child: DropdownButtonFormField<String>(
                  decoration: InputDecoration(
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: 4, vertical: 4),
                      enabledBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.black45, width: 1),
                          borderRadius: BorderRadius.circular(8.0))),
                  hint: Text(
                    'filter by',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.black54,
                    ),
                  ),
                  onChanged: (item)async {
                    filterOption = item;
                    await getFilterResult();
                  },
                  value: filterOption,
                  items: filterOptions,
                )),
                SizedBox(width: 4,),
                Expanded(
                    flex: 2,
                    child: TextField(
                      decoration: InputDecoration(
                        contentPadding:
                            EdgeInsets.symmetric(horizontal: 4, vertical: 4),
                        hintText: 'Search by address',
                        hintStyle:
                            TextStyle(fontSize: 18, color: Colors.black38),
                        enabledBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.black45, width: 1),
                            borderRadius: BorderRadius.circular(8.0)),
                      ),
                      onChanged: (value) {
                        selectedAddress = value;
                      },
                    )),
                Container(
                  width: MediaQuery.of(context).size.width * 0.15,
                    height: 48,
                    child: RaisedButton(
                      shape: CircleBorder(),
                  onPressed: () async {
                await getSearchResult();
                  },
                  child: Icon(
                Icons.search,
                size: 24,
                color: Colors.white,
                  ),
                  color: Colors.green,
                ))
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Expanded(
              child: Obx(() {
                if (searchPageController.searchResultProperties.isEmpty) {
                  return Center(
                    child: Text('Nothing to display !'),
                  );
                } else {
                  return AlignedGridView.count(
                    itemCount:
                        searchPageController.searchResultProperties.length,
                    crossAxisSpacing: 12,
                    mainAxisSpacing: 16,
                    itemBuilder: (context, index) {
                      return SearchPagePropertyCard(
                          searchPageController.searchResultProperties[index]);
                    },
                    crossAxisCount: 2,
                  );
                }
              }),
            ),
          ],
        ),
      )),
    );
  }
}
