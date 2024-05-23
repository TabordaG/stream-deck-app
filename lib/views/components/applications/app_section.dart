import 'package:flutter/material.dart';

import '../../../models/models.dart';
import '../../../viewmodels/viewmodels.dart';

import 'app_card.dart';

appsSection({required ConnectionViewModel connectionViewModel}) {
  return Expanded(
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const SizedBox(
          height: 60,
          child: Center(
            child: Text(
              'Aplicativos',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        const SizedBox(height: 32),
        Wrap(
          children: List.generate(appList.length, (index) {
            return appCard(
              appModel: appList[index],
              connectionViewModel: connectionViewModel,
            );
          }),
        ),
      ],
    ),
  );
}
