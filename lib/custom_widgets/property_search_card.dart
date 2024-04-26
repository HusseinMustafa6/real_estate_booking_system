


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

import '../configuration/server_configuration.dart';
import '../models/property.dart';
import '../modules/property_details/property_info.dart';

class SearchPagePropertyCard extends StatelessWidget {
  final Property _property;

  SearchPagePropertyCard(this._property);









  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context){
          return PropertyInfo(_property);
        }));
      },
      child: Card(
        elevation: 2,
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  Container(
                    height: 180,
                    width: double.infinity,
                    clipBehavior: Clip.antiAlias,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: _property.propertyImg != null
                        ? Image.file(
                      _property.propertyImg!,
                      fit: BoxFit.cover,
                    )
                        : Image.network(ServerConfiguration.domainName+'/storage/${_property.image3}',fit: BoxFit.cover,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 8),
              Row(
                children: [
                  Icon(
                    Icons.home,
                    size: 20,
                  ),
                  Text(
                    ':${_property.floorNum}',
                    maxLines: 2,
                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 14),
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(width: 8),
                  Icon(
                    Icons.bed,
                    size: 20,
                  ),
                  Text(
                    ':${_property.roomNum}',
                    maxLines: 2,
                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 14),
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(width: 8),
                  Icon(
                    Icons.shower,
                    size: 20,
                  ),
                  Text(
                    ':${_property.bathRoomNum}',
                    maxLines: 2,
                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 14),
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),

              SizedBox(height: 12),
              Row(
                children: [
                  Expanded(
                    child: Text(
                      _property.constructionType,
                      maxLines: 2,
                      style:
                      TextStyle(fontWeight: FontWeight.w800, color: Colors.green),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Expanded(child: Text(_property.address, style: TextStyle( fontWeight: FontWeight.bold),
                    overflow: TextOverflow.ellipsis,))
                ],
              ),
              SizedBox(height: 8),
              Text('\$${_property.newPrice}',
                  style: TextStyle(
                    fontSize: 20,
                  )),
              //Text('${product.productId}'),
            ],
          ),
        ),
      ),
    );

  }
}
