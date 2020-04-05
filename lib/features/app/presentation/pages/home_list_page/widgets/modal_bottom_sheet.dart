import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:jpt_app/core/constants/colors.dart';
import 'package:jpt_app/core/localization/app_localization.dart';
import 'package:jpt_app/core/screen_content.dart';
import 'package:jpt_app/features/app/domain/entities/item_list_data.dart';
import 'package:jpt_app/features/app/presentation/pages/pdf_and_web_grid_screen/pdf_and_web_grid_screen.dart';

void showModalDialogSheet(BuildContext context, ItemData itemData) {
  Platform.isIOS
      ? contentCupertinoModalPopup(context, itemData)
      : contentModalBottomSheet(context, itemData);
}

void contentModalBottomSheet(BuildContext context, ItemData itemData) {
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
            children: _getModalDialogSheetActions(context, itemData),
          ),
        );
      });
}

void contentCupertinoModalPopup(BuildContext context, ItemData itemData) {
  showCupertinoModalPopup(
    context: context,
    builder: (BuildContext context) => CupertinoActionSheet(
        actions: _getContentCupertinoModalPopupActions(context, itemData),
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

List<Widget> _getModalDialogSheetActions(
    BuildContext context, ItemData itemData) {
  return Platform.isIOS
      ? _getContentCupertinoModalPopupActions(context, itemData)
      : _getContentModalBottomSheetActions(context, itemData);
}

List<Widget> _getContentModalBottomSheetActions(
    BuildContext context, ItemData itemData) {
  List<Widget> actions = [];

  if (itemData.htmlTags != null && !itemData.htmlTags.isEmpty) {
    actions.add(
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
        onTap: () {
          _navigateToPdfOrGridScreen(
              context, itemData, ScreenContent.webGridScreen);
        },
      ),
    );
  }
  if (itemData.pdfLinks != null && !itemData.pdfLinks.isEmpty) {
    actions.add(
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
        onTap: () {
          _navigateToPdfOrGridScreen(
              context, itemData, ScreenContent.pdfGridScreen);
        },
      ),
    );
  }
  return actions;
}

List<Widget> _getContentCupertinoModalPopupActions(
    BuildContext context, ItemData itemData) {
  List<Widget> actions = [];

  if (itemData.htmlTags != null && !itemData.htmlTags.isEmpty) {
    actions.add(
      CupertinoActionSheetAction(
        child: Text(
          AppLocalizations.of(context).translate('webPage'),
        ),
        onPressed: () {
          _navigateToPdfOrGridScreen(
              context, itemData, ScreenContent.webGridScreen);
        },
      ),
    );
  }

  if (itemData.pdfLinks != null && !itemData.pdfLinks.isEmpty) {
    actions.add(
      CupertinoActionSheetAction(
        child: Text(
          AppLocalizations.of(context).translate('pdfFile'),
        ),
        onPressed: () {
          _navigateToPdfOrGridScreen(
              context, itemData, ScreenContent.pdfGridScreen);
        },
      ),
    );
  }
  return actions;
}

void _navigateToPdfOrGridScreen(
    BuildContext context, ItemData itemData, ScreenContent screenContent) {
  Navigator.pushReplacement(
    context,
    MaterialPageRoute(
      builder: (context) =>
          PdfOrGridScreen(screenContent: screenContent, itemData: itemData),
    ),
  );
}
