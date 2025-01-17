import 'package:flutter/material.dart';
import 'package:fact_browser/constants/constants.dart';
import 'package:fact_browser/utilities/utilities.dart';

class CorrectnessBadge extends StatelessWidget {
  const CorrectnessBadge({Key? key, required this.correctnessValue})
      : super(key: key);
  final String correctnessValue;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Material(
        borderRadius: const BorderRadius.all(Radius.circular(10)),
        color: correctnessValue != CorrectnessCategory.correct
            ? DesignColors.red
            : DesignColors.green,
        child: InkWell(
          borderRadius: const BorderRadius.all(Radius.circular(10)),
          hoverColor: correctnessValue != CorrectnessCategory.correct
              ? const Color.fromARGB(255, 176, 77, 1)
              : const Color.fromARGB(255, 0, 121, 89),
          child: Container(
            padding: const EdgeInsets.all(10),
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
            child: Text(
              correctnessValue,
              style: Theme.of(context).textTheme.headline3,
            ),
          ),
          onTap: () => showModalBottomSheet<void>(
            context: context,
            backgroundColor: Colors.transparent,
            isDismissible: true,
            builder: (BuildContext context) {
              return Container(
                decoration: const BoxDecoration(
                  color: DesignColors.lightGrey,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15),
                  ),
                ),
                padding: const EdgeInsets.all(20),
                child: Align(
                  alignment: Alignment.topCenter,
                  child: Container(
                    constraints: const BoxConstraints(
                      maxWidth: 1000,
                    ),
                    child: Column(
                      children: [
                        Align(
                          alignment: Alignment.topRight,
                          child: IconButton(
                            icon: const Icon(Icons.close),
                            iconSize: 50,
                            onPressed: () => Navigator.of(context).pop(context),
                          ),
                        ),
                        Flexible(
                          child: ScrollConfiguration(
                            behavior: ScrollConfiguration.of(context)
                                .copyWith(scrollbars: false),
                            child: ListView(
                              children: [
                                Column(
                                  children: [
                                    SelectableText(
                                      "Unsere Bewertungsskala",
                                      style: Theme.of(context)
                                          .textTheme
                                          .headline1!
                                          .copyWith(color: DesignColors.green),
                                    ),
                                    Row(
                                      children: [
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(right: 10),
                                          child: Container(
                                            margin: const EdgeInsets.only(
                                                top: 10, bottom: 10),
                                            padding: const EdgeInsets.all(10),
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  const BorderRadius.all(
                                                      Radius.circular(10)),
                                              color: DesignColors.green,
                                            ),
                                            child: SelectableText(
                                              "Richtig",
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .headline3,
                                            ),
                                          ),
                                        ),
                                        Flexible(
                                          child: SelectableText(
                                            "Die Aussage stimmt.",
                                            style: Theme.of(context)
                                                .textTheme
                                                .subtitle2,
                                          ),
                                        )
                                      ],
                                    ),
                                    const Divider(
                                      height: 10,
                                      thickness: 2,
                                    ),
                                    Row(
                                      children: [
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(right: 10),
                                          child: Container(
                                            margin: const EdgeInsets.only(
                                                top: 10, bottom: 10),
                                            padding: const EdgeInsets.all(10),
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  const BorderRadius.all(
                                                      Radius.circular(10)),
                                              color: DesignColors.red,
                                            ),
                                            child: SelectableText(
                                              "Unbelegt",
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .headline3,
                                            ),
                                          ),
                                        ),
                                        Flexible(
                                          child: SelectableText(
                                            "Es gibt keine Belege für die Richtigkeit dieser Aussage.",
                                            style: Theme.of(context)
                                                .textTheme
                                                .subtitle2,
                                          ),
                                        )
                                      ],
                                    ),
                                    const Divider(
                                      height: 10,
                                      thickness: 2,
                                    ),
                                    Row(
                                      children: [
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(right: 10),
                                          child: Container(
                                            margin: const EdgeInsets.only(
                                                top: 10, bottom: 10),
                                            padding: const EdgeInsets.all(10),
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  const BorderRadius.all(
                                                      Radius.circular(10)),
                                              color: DesignColors.red,
                                            ),
                                            child: SelectableText(
                                              "Falscher Kontext",
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .headline3,
                                            ),
                                          ),
                                        ),
                                        Flexible(
                                          child: SelectableText(
                                            "Die Aussage wird in einem falschen oder fehlenden Kontext dargestellt.",
                                            style: Theme.of(context)
                                                .textTheme
                                                .subtitle2,
                                          ),
                                        )
                                      ],
                                    ),
                                    const Divider(
                                      height: 10,
                                      thickness: 2,
                                    ),
                                    Row(
                                      children: [
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(right: 10),
                                          child: Container(
                                            margin: const EdgeInsets.only(
                                                top: 10, bottom: 10),
                                            padding: const EdgeInsets.all(10),
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  const BorderRadius.all(
                                                      Radius.circular(10)),
                                              color: DesignColors.red,
                                            ),
                                            child: SelectableText(
                                              "Manipuliert",
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .headline3,
                                            ),
                                          ),
                                        ),
                                        Flexible(
                                          child: SelectableText(
                                            "Das Video oder Bild wurde nachträglich bearbeitet.",
                                            style: Theme.of(context)
                                                .textTheme
                                                .subtitle2,
                                          ),
                                        )
                                      ],
                                    ),
                                    const Divider(
                                      height: 10,
                                      thickness: 2,
                                    ),
                                    Row(
                                      children: [
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(right: 10),
                                          child: Container(
                                            margin: const EdgeInsets.only(
                                                top: 10, bottom: 10),
                                            padding: const EdgeInsets.all(10),
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  const BorderRadius.all(
                                                      Radius.circular(10)),
                                              color: DesignColors.red,
                                            ),
                                            child: SelectableText(
                                              "Irreführend",
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .headline3,
                                            ),
                                          ),
                                        ),
                                        Flexible(
                                          child: SelectableText(
                                            "Etwas wird falsch interpretiert oder hat sich nicht so zugetragen, wie behauptet wird.",
                                            style: Theme.of(context)
                                                .textTheme
                                                .subtitle2,
                                          ),
                                        )
                                      ],
                                    ),
                                    const Divider(
                                      height: 10,
                                      thickness: 2,
                                    ),
                                    Row(
                                      children: [
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(right: 10),
                                          child: Container(
                                            margin: const EdgeInsets.only(
                                                top: 10, bottom: 10),
                                            padding: const EdgeInsets.all(10),
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  const BorderRadius.all(
                                                      Radius.circular(10)),
                                              color: DesignColors.red,
                                            ),
                                            child: SelectableText(
                                              "Frei erfunden",
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .headline3,
                                            ),
                                          ),
                                        ),
                                        Flexible(
                                          child: SelectableText(
                                            "Die Inhalte sind erfunden worden.",
                                            style: Theme.of(context)
                                                .textTheme
                                                .subtitle2,
                                          ),
                                        )
                                      ],
                                    ),
                                    const Divider(
                                      height: 10,
                                      thickness: 2,
                                    ),
                                    Row(
                                      children: [
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(right: 10),
                                          child: Container(
                                            margin: const EdgeInsets.only(
                                                top: 10, bottom: 10),
                                            padding: const EdgeInsets.all(10),
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  const BorderRadius.all(
                                                      Radius.circular(10)),
                                              color: DesignColors.red,
                                            ),
                                            child: SelectableText(
                                              "Fehlinformation",
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .headline3,
                                            ),
                                          ),
                                        ),
                                        Flexible(
                                          child: SelectableText(
                                            "Die Aussage wurde versehentlich falsch wiedergegeben. Die Fehler wurden daraufhin vom Medium korrigiert.",
                                            style: Theme.of(context)
                                                .textTheme
                                                .subtitle2,
                                          ),
                                        )
                                      ],
                                    ),
                                    const Divider(
                                      height: 10,
                                      thickness: 2,
                                    ),
                                    Row(
                                      children: [
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(right: 10),
                                          child: Container(
                                            margin: const EdgeInsets.only(
                                                top: 10, bottom: 10),
                                            padding: const EdgeInsets.all(10),
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  const BorderRadius.all(
                                                      Radius.circular(10)),
                                              color: DesignColors.red,
                                            ),
                                            child: SelectableText(
                                              "Satire",
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .headline3,
                                            ),
                                          ),
                                        ),
                                        Flexible(
                                          child: SelectableText(
                                            "Es handelt sich um Satire, die jedoch nicht als solche zu erkennen ist.",
                                            style: Theme.of(context)
                                                .textTheme
                                                .subtitle2,
                                          ),
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
