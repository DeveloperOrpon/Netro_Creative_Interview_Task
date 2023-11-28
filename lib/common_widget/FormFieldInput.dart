import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_utils/get_utils.dart';

customFormField(String title,Widget child){
  return Container(
    margin: EdgeInsets.symmetric(vertical: 10),
    padding: const EdgeInsets.symmetric(horizontal: 0,vertical: 2),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(10),
      border: Border.all(
        color: Colors.grey.shade400,width: 1,
      )
    ),
    child: Row(
      children: [
        // Icon(iconData,color: Colors.grey,),

        Expanded(child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding:  EdgeInsets.only(left: Get.width*.08,top: 8),
              child: Text(title,style: TextStyle(fontSize: 12,color: Colors.grey.shade600),),
            ),
            child
          ],
        ))
      ],
    ),
  );
}