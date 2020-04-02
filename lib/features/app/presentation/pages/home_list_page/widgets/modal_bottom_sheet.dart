import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:jpt_app/core/constants/colors.dart';
import 'package:jpt_app/core/localization/app_localization.dart';

void showModalDialogSheet(BuildContext context) {
  Platform.isIOS
      ? contentCupertinoModalPopup(context)
      : contentModalBottomSheet(context);
}

void contentModalBottomSheet(BuildContext context) {
  showModalBottomSheet(
      context: context,
      builder: (BuildContext bc) {
        return Container(
          padding: EdgeInsets.only(bottom: 30),
          decoration: BoxDecoration(
              gradient: LinearGradient(
            colors: [kHomeListScreenStartGradient, kHomeListScreenEndGradient],
          )),
          child: Wrap(
            children: <Widget>[
              ListTile(
                leading: FaIcon(
                  FontAwesomeIcons.solidFilePdf,
                  color: Colors.white,
                ),
                title: Text(
                  AppLocalizations.of(context).translate('pdfFile'),
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                onTap: () {},
              ),
              ListTile(
                leading: FaIcon(
                  FontAwesomeIcons.html5,
                  color: Colors.white,
                ),
                title: Text(
                  AppLocalizations.of(context).translate('webPage'),
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                onTap: () => {},
              ),
            ],
          ),
        );
      });
}

void contentCupertinoModalPopup(BuildContext context) {
  showCupertinoModalPopup(
    context: context,
    builder: (BuildContext context) => CupertinoActionSheet(
        title: const Text('Choose Options'),
        message: const Text('Your options are '),
        actions: <Widget>[
          CupertinoActionSheetAction(
            child: Text(
              AppLocalizations.of(context).translate('pdfFile'),
            ),
            onPressed: () {
              Navigator.pop(context, 'One');
            },
          ),
          CupertinoActionSheetAction(
            child: Text(
              AppLocalizations.of(context).translate('webPage'),
            ),
            onPressed: () {
              Navigator.pop(context, 'Two');
            },
          )
        ],
        cancelButton: CupertinoActionSheetAction(
          child: Text(
            AppLocalizations.of(context).translate('cancel'),
          ),
          isDefaultAction: false,
          onPressed: () {
            Navigator.pop(context, 'Cancel');
          },
        )),
  );
}
