import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_ecom_dashboard/menu_controller/menu_controller.dart';
import 'package:flutter_ecom_dashboard/utils/utils.dart';
import 'package:flutter_ecom_dashboard/widgets/button_widgets.dart';
import 'package:flutter_ecom_dashboard/widgets/responsive_widgets.dart';
import 'package:flutter_ecom_dashboard/widgets/text_widgets.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

import '../widgets/side_menu_widgets.dart';

class UploadProductPage extends StatefulWidget {
  const UploadProductPage({Key? key}) : super(key: key);
  static const routeName = "/UploadProductPage";

  @override
  State<UploadProductPage> createState() => _UploadProductPageState();
}

class _UploadProductPageState extends State<UploadProductPage> {
  String _catValue = "Vegetables";
  File? _pickedImage;
  Uint8List webImage=Uint8List(8);
  int _groupValue = 1;
  bool _isPiece = false;
  final _formKey = GlobalKey<FormState>();
  late final TextEditingController _titleController, _priceController;
  @override
  void initState() {
    _titleController = TextEditingController();
    _priceController = TextEditingController();
    // TODO: implement initState
    super.initState();
  }

  void _clearForm(){
    _groupValue=1;
    _isPiece=false;
    _priceController.clear();
    _titleController.clear();

    setState(() {
      _pickedImage=null;
      webImage=Uint8List(8);

    });
  }

  @override
  void dispose() {
    _titleController.dispose();
    _titleController.dispose();
    // TODO: implement dispose
    super.dispose();
  }

  void _uploadForm() async {
    final isValid = _formKey.currentState!.validate();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Utils(context).getTheme;
    final color = Utils(context).color;
    final _scaffoldColor = Theme.of(context).scaffoldBackgroundColor;
    Size size = Utils(context).getScreenSize;

    var inputDecoration = InputDecoration(
        filled: true,
        fillColor: _scaffoldColor,
        border: InputBorder.none,
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: color, width: 1.0)));
    return Scaffold(
      key: context.read<MenuController>().getAddProductscaffoldKey,
      drawer: SideMenuWidget(),
      body: Row(
        children: [
          if (ResponsiveWidget.isDesktop(context))
            Expanded(child: SideMenuWidget()),
          Expanded(
              flex: 5,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      width: size.width > 650 ? 650 : size.width,
                      color: Theme.of(context).cardColor,
                      padding: EdgeInsets.all(16),
                      margin: EdgeInsets.all(16),
                      child: Form(
                        key: _formKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            TextWidget(
                                color: color,
                                maxLines: 1,
                                textSize: 16,
                                isTitle: true,
                                text: "Product title"),
                            SizedBox(
                              height: 10,
                            ),
                            TextFormField(
                              controller: _titleController,
                              key: ValueKey("Title"),
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "Please enter a title";
                                }
                                return null;
                              },
                              decoration: inputDecoration,
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Row(
                              children: [
                                Expanded(
                                    flex: 2,
                                    child: FittedBox(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          TextWidget(
                                              color: color,
                                              isTitle: true,
                                              maxLines: 1,
                                              textSize: 14,
                                              text: "Price in \$"),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          SizedBox(
                                            width: 100,
                                            child: TextFormField(
                                              controller: _priceController,
                                              key: ValueKey("Price\$"),
                                              keyboardType:
                                                  TextInputType.number,
                                              validator: (value) {
                                                if (value!.isEmpty) {
                                                  return "Price is missed";
                                                }
                                                return null;
                                              },
                                              inputFormatters: <
                                                  TextInputFormatter>[
                                                FilteringTextInputFormatter
                                                    .allow(RegExp(r'[0-9]')),
                                              ],
                                              decoration: inputDecoration,
                                            ),
                                          ),
                                          SizedBox(
                                            height: 20,
                                          ),
                                          TextWidget(
                                              color: color,
                                              maxLines: 1,
                                              textSize: 14,
                                              isTitle: true,
                                              text: "Product Category"),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          //drop down menu code here
                                          _categoryDropDown(),

                                          SizedBox(
                                            height: 20,
                                          ),
                                          TextWidget(
                                              color: color,
                                              maxLines: 1,
                                              textSize: 14,
                                              text: "Measure unit"),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          //radio button here
                                          Row(
                                            children: [
                                              TextWidget(
                                                  color: color,
                                                  maxLines: 1,
                                                  textSize: 16,
                                                  text: "KG"),
                                              Radio(
                                                value: 1,
                                                groupValue: _groupValue,
                                                onChanged: (value) {
                                                  setState(() {
                                                    _groupValue = 1;
                                                    _isPiece = false;
                                                  });
                                                },
                                                activeColor: Colors.green,
                                              ),
                                              TextWidget(
                                                  color: color,
                                                  maxLines: 1,
                                                  textSize: 16,
                                                  text: "Pices"),
                                              Radio(
                                                value: 2,
                                                groupValue: _groupValue,
                                                onChanged: (value) {
                                                  setState(() {
                                                    _groupValue = 2;
                                                    _isPiece = true;
                                                  });
                                                },
                                                activeColor: Colors.green,
                                              ),
                                            ],
                                          )
                                        ],
                                      ),
                                    )),
                                //image picker
                                Expanded(
                                    flex: 4,
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Container(
                                        height: size.width > 650
                                            ? 350
                                            : size.width * 0.45,
                                        decoration: BoxDecoration(
                                            color: Theme.of(context)
                                                .scaffoldBackgroundColor,
                                            borderRadius:
                                                BorderRadius.circular(12)),
                                        child: _pickedImage==null?  dottedBorder(color: color):
                                   ClipRRect(
                                     borderRadius: BorderRadius.circular(12),
                                     child:    kIsWeb?Image.memory(webImage,fit: BoxFit.fill,):
                                     Image.file(_pickedImage!),
                                   )
                                      ),
                                    )),
                                Expanded(
                                    flex: 1,
                                    child: FittedBox(
                                      child: Column(
                                        children: [
                                          TextButton(
                                              onPressed: () {
                                              setState(() {
                                                _pickedImage=null;
                                                webImage=Uint8List(8);

                                              });
                                              },
                                              child: TextWidget(
                                                  color: Colors.red,
                                                  maxLines: 1,
                                                  textSize: 12,
                                                  text: "Clear")),
                                          TextButton(
                                              onPressed: () {},
                                              child: TextWidget(
                                                  color: Colors.blue,
                                                  maxLines: 1,
                                                  textSize: 12,
                                                  text: "Update Image")),
                                        ],
                                      ),
                                    ))
                              ],
                            ),
                            Padding(
                              padding: EdgeInsets.all(18.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  ButtonWidget(
                                      onPressed: _clearForm,
                                      icon: Icons.dangerous,
                                      text: "Clear form",
                                      backgroundColor: Colors.red.shade300),
                                  ButtonWidget(
                                      onPressed: () {},
                                      icon: Icons.upload,
                                      text: "Clear form",
                                      backgroundColor: Colors.blue),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ))
        ],
      ),
    );
  }

  Future<void> _pickImage() async {
    if (!kIsWeb) {
      final ImagePicker _picker = ImagePicker();
      XFile? image = await _picker.pickImage(source: ImageSource.gallery);
      if (image != null) {
        final selected = File(image.path);
        setState(() {
          _pickedImage = selected;
        });
      } else {
        print("No image has beenpicker");
      }
    }
    else if (kIsWeb){
      final ImagePicker _picker = ImagePicker();
      XFile? image = await _picker.pickImage(source: ImageSource.gallery);
      if (image != null) {
        var f= await image.readAsBytes();
      setState(() {
        webImage=f;
        _pickedImage=File("a");
      });

      } else {
        print("No image has beenpicker");
      }
    }else{
      print("something went wordng");
    }
  }

  Widget dottedBorder({required Color color}) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: DottedBorder(
        dashPattern: [6.7],
        borderType: BorderType.RRect,
        color: color,
        radius: Radius.circular(12),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(
                Icons.image_outlined,
                color: color,
                size: 50,
              ),
              SizedBox(
                height: 20,
              ),
              TextButton(
                  onPressed: () {
                    _pickImage();
                  },
                  child: TextWidget(
                      color: Colors.black,
                      maxLines: 1,
                      textSize: 14,
                      text: "Chosse image"))
            ],
          ),
        ),
      ),
    );
  }

  Widget _categoryDropDown() {
    return DropdownButtonHideUnderline(
        child: DropdownButton<String>(
      value: _catValue,
      onChanged: (value) {
        setState(() {
          _catValue = value!;
        });
        print(_catValue);
      },
      hint: Text("Select a catagorey"),
      items: const [
        DropdownMenuItem(
          child: Text("Vegetables"),
          value: "Vegetables",
        ),
        DropdownMenuItem(
          child: Text("Fruites"),
          value: "Fruits",
        ),
        DropdownMenuItem(
          child: Text("Grains"),
          value: "Grais",
        ),
        DropdownMenuItem(
          child: Text("Grains"),
          value: "Grais",
        ),
        DropdownMenuItem(
          child: Text("nuts"),
          value: "nuts",
        ),
        DropdownMenuItem(
          child: Text("hubs"),
          value: "hubs",
        ),
        DropdownMenuItem(
          child: Text("spices"),
          value: "spices",
        ),
      ],
    ));
  }
}
