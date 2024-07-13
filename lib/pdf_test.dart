import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sv_app_create_school/api/pdf_api.dart';

class PdfTest extends StatefulWidget {
  const PdfTest({super.key});

  @override
  State<PdfTest> createState() => _PdfTestState();
}

class _PdfTestState extends State<PdfTest> {
  TextEditingController schuelerController = TextEditingController();
  TextEditingController schuleController = TextEditingController();
  TextEditingController svController = TextEditingController();
  bool loading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(32),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFieldInput(
                textEditingController: schuleController,
                hintText: 'Name der Schule',
                textInputType: TextInputType.text,
              ),
              const VerticalSpace(height: 10),
              TextFieldInput(
                textEditingController: schuelerController,
                hintText: 'Anzahl der Schüler',
                textInputType: TextInputType.number,
                onlyNum: true,
              ),
              const VerticalSpace(height: 10),
              TextFieldInput(
                textEditingController: svController,
                hintText: 'Anzahl der SV-Mitglieder',
                textInputType: TextInputType.number,
                onlyNum: true,
              ),
              const VerticalSpace(height: 20),
              Container(
                constraints: const BoxConstraints(maxWidth: 300),
                child: GestureDetector(
                  onTap: () async {
                    setState(() {
                      loading = true;
                    });
                    await PdfApi.generatePdf(
                      schuleController.text,
                      [
                        111,
                      ],
                      [
                        9475698,
                        345345,
                        34535,
                        654566,
                        92879809,
                      ],
                      [
                        2352432335,
                        1134512452,
                        1213512355,
                        1351235112,
                        1132545345,
                        2352235234,
                        1134512452,
                        1213512355,
                        1351235112,
                        1132545345,
                        2352435543,
                        2352435543,
                        2352432335,
                        1134512452,
                        1213512355,
                        1351235112,
                        1132545345,
                        1351235112,
                        1132545345,
                        2352435543,
                      ],
                    );
                    svController.clear();
                    schuelerController.clear();
                    schuleController.clear();
                    setState(() {
                      loading = false;
                    });
                  },
                  child: Container(
                    padding: const EdgeInsets.all(14),
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.primary,
                      borderRadius: const BorderRadius.all(
                        Radius.circular(4),
                      ),
                    ),
                    child: Center(
                      child: !loading
                          ? const Text(
                              'Pdf Generieren',
                              overflow: TextOverflow.ellipsis,
                            )
                          : CircularProgressIndicator(
                              color: Theme.of(context).colorScheme.onPrimary,
                            ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class TextFieldInput extends StatelessWidget {
  final TextEditingController textEditingController;
  final bool isPass;
  final String hintText;
  final TextInputType textInputType;
  final int lines;
  final bool onlyNum;
  const TextFieldInput({
    required this.textEditingController,
    this.isPass = false,
    this.lines = 1,
    this.onlyNum = false,
    required this.hintText,
    required this.textInputType,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    const inputBorder = OutlineInputBorder(borderSide: BorderSide.none);

    return TextField(
      controller: textEditingController,
      maxLines: lines,
      decoration: InputDecoration(
        hintText: hintText,
        border: inputBorder,
        focusedBorder: inputBorder,
        enabledBorder: inputBorder,
        filled: true,
        contentPadding: const EdgeInsets.all(10),
      ),
      keyboardType: textInputType,
      obscureText: isPass,
      inputFormatters: onlyNum
          ? [
              FilteringTextInputFormatter.digitsOnly,
              LengthLimitingTextInputFormatter(4),
            ]
          : [],
    );
  }
}

class HorizontalSpace extends StatelessWidget {
  final double width;
  const HorizontalSpace({required this.width, super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
    );
  }
}

class VerticalSpace extends StatelessWidget {
  final double height;
  const VerticalSpace({required this.height, super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
    );
  }
}
