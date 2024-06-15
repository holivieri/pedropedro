import 'package:flutter/cupertino.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

import '../providers/language_provider.dart';
import '../utils/font.dart';

class LanguageSelector extends StatelessWidget {
  const LanguageSelector({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoActionSheet(
      title: Text(
        AppLocalizations.of(context)!.availableLanguages,
        style: titleStyle,
      ),
      message: Text(
        AppLocalizations.of(context)!.selectLanguage,
        style: subtitleStyle,
      ),
      actions: [
        CupertinoActionSheetAction(
          onPressed: () {
            context.read<LanguageProvider>().changeLocale('en');
            Navigator.pop(context);
          },
          child: Text(AppLocalizations.of(context)!.langEnglish),
        ),
        CupertinoActionSheetAction(
          onPressed: () {
            context.read<LanguageProvider>().changeLocale('es');
            Navigator.pop(context);
          },
          isDefaultAction: true,
          child: Text(AppLocalizations.of(context)!.langSpanish),
        ),
      ],
      cancelButton: CupertinoActionSheetAction(
        onPressed: () => {Navigator.pop(context)},
        child: Text(AppLocalizations.of(context)!.cancel),
      ),
    );
  }
}
