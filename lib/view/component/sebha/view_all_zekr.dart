import 'package:flutter/material.dart';
import 'package:mvvm_islami_app/model/azkar/azkar_model.dart';

import '../../../utils/firebase_azkar.dart';

class ViewAllZekr extends StatelessWidget {
  List<AzkarModel> azkarModel;

  ViewAllZekr({required this.azkarModel});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3, crossAxisSpacing: 4, mainAxisSpacing: 4),
      itemCount: azkarModel.length,
      itemBuilder: (_, index) => InkWell(
        onDoubleTap: () {
          removeFromFireBase(azkarModel[index])
              .then((value) => print('done'))
              .catchError((onError) {
            print(onError.toString());
          });
        },
        child: SingleChildScrollView(
          child: Text(
            azkarModel[index].zekr,
            style: Theme.of(context).textTheme.headline2,
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
