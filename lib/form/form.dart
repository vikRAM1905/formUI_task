import 'package:flutter/material.dart';
import 'package:form_demo/form/form_controller.dart';
import 'package:get/get.dart';

class FormView extends StatefulWidget {
  FormView({Key? key}) : super(key: key);

  @override
  State<FormView> createState() => _FormViewState();
}

class _FormViewState extends State<FormView> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {});
  }

  final formController = Get.put(FormController());

  TextEditingController idController = TextEditingController();

  TextEditingController nameController = TextEditingController();

  TextEditingController contactController = TextEditingController();

  TextEditingController regionController = TextEditingController();

  TextEditingController addressController = TextEditingController();

  TextEditingController typeController = TextEditingController();

  // TextEditingController idController =  TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 27, 141, 31),
        title: const Text(
          "Lead",
          style: TextStyle(color: Colors.white),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          IconButton(
              icon: const Icon(Icons.add_box, color: Colors.white),
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (builder) {
                      return AlertDialog(
                        content: Container(
                          height: 400,
                          child: Column(children: [
                            TextField(
                              controller: idController,
                              decoration: InputDecoration(
                                label: Text("Lead Id"),
                              ),
                            ),
                            TextField(
                              controller: nameController,
                              decoration: InputDecoration(
                                label: Text("Lead Name"),
                              ),
                            ),
                            TextField(
                              controller: contactController,
                              decoration: InputDecoration(
                                label: Text("Contact"),
                              ),
                            ),
                            TextField(
                              controller: regionController,
                              decoration: InputDecoration(
                                label: Text("Region"),
                              ),
                            ),
                            TextField(
                              controller: addressController,
                              decoration: InputDecoration(
                                label: Text("Address"),
                              ),
                            ),
                            TextField(
                              controller: typeController,
                              decoration: InputDecoration(
                                label: Text("Type"),
                              ),
                            ),
                          ]),
                        ),
                        actions: [
                          TextButton(
                              child: Text("cancel"),
                              onPressed: () {
                                Navigator.pop(context);
                              }),
                          TextButton(
                              child: Text("Add"),
                              onPressed: () {
                                // idController.text == "" ||
                                //         idController.text.isEmpty ||
                                //         nameController.text == "" ||
                                //         nameController.text.isEmpty ||
                                //         contactController.text == "" ||
                                //         contactController.text.isEmpty ||
                                //         regionController.text == "" ||
                                //         regionController.text.isEmpty ||
                                //         addressController.text == "" ||
                                //         addressController.text.isEmpty ||
                                //         typeController.text == "" ||
                                //         typeController.text.isEmpty
                                //     ? Get.snackbar(
                                //         "Oops", "Fill All the Fields",
                                //         backgroundColor: Colors.blue,
                                //         snackPosition: SnackPosition.BOTTOM)
                                //     :
                                formController.addNewForm(
                                    idController.text,
                                    nameController.text,
                                    contactController.text,
                                    regionController.text,
                                    addressController.text,
                                    typeController.text);
                                setState(() {
                                  idController.clear();
                                  nameController.clear();
                                  contactController.clear();
                                  regionController.clear();
                                  addressController.clear();
                                  typeController.clear();
                                });
                                Navigator.pop(context);
                              })
                        ],
                      );
                    });
              }),
          IconButton(
              icon: const Icon(Icons.menu, color: Colors.white),
              onPressed: () {})
        ],
      ),
      body: GetBuilder<FormController>(
          builder: (controller) => controller.forms.isEmpty
              ? Center(child: CircularProgressIndicator())
              : SafeArea(
                  child: SingleChildScrollView(
                      child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(5),
                      child: const TextField(
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            label: Text("Search"),
                            prefixIcon:
                                Icon(Icons.search, color: Colors.black)),
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    SizedBox(
                      child: ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemBuilder: (context, item) {
                          return ListTile(
                            onTap: () {
                              showDialog(
                                  context: context,
                                  builder: (builder) {
                                    return AlertDialog(
                                        content: Container(
                                            height: 200,
                                            child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceEvenly,
                                                children: [
                                                  Text(
                                                      "Lead Id : ${controller.forms[item].leadId}"),
                                                  Text(
                                                      "Lead Name : ${controller.forms[item].leadName}"),
                                                  Text(
                                                      "Contact : ${controller.forms[item].contact}"),
                                                  Text(
                                                      "Region : ${controller.forms[item].region}"),
                                                  Text(
                                                      "Address : ${controller.forms[item].address}"),
                                                  Text(
                                                      "Type : ${controller.forms[item].type}"),
                                                ])));
                                  });
                            },
                            tileColor: Colors.green[100],
                            leading: Icon(Icons.arrow_drop_down,
                                color: Colors.black),
                            title: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("Lead ID   ",
                                    style: TextStyle(color: Colors.black)),
                                Text(controller.forms[item].leadName!,
                                    style: TextStyle(color: Colors.blue)),
                                SizedBox(width: 20)
                              ],
                            ),
                            trailing:
                                Icon(Icons.menu_sharp, color: Colors.black),
                          );
                        },
                        itemCount: controller.forms.length,
                      ),
                    )
                  ],
                )))),
    );
  }
}
