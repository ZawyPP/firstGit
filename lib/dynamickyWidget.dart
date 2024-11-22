import 'dart:convert';
import 'dart:html' as html;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


class EditTestForm extends StatefulWidget {
  final String testId;
  final String loginUserEmail;

  const EditTestForm({super.key, required this.testId, required this.loginUserEmail});

  @override
  _EditTestFormState createState() => _EditTestFormState();
}

class _EditTestFormState extends State<EditTestForm> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController _publicNameController = TextEditingController();
  bool isLoading = false;
  TextEditingController _descriptionController = TextEditingController();
  Uint8List? fileInBytes;

  @override
  void initState() {
    super.initState();

    // ApiHelper.callApi(
    //   method: ApiMethod.GET,
    //   url: '/test/a/${widget.testId}',
    //   storage: loginStorage,);
    //
    _publicNameController = widget.david.name;
    _fetchTest();


    print('dfdf');

  }

  Future<bool> _fetchTest() async {
    setState(() {
      isLoading = true;
    });


    final response = await ApiHelper.callApi(
      method: ApiMethod.GET,
      url: '/test/a/${widget.testId}',
      storage: loginStorage,);

    response.statusCode;

    setState(() {
      isLoading = true;
    });

    if (response.statusCode == 200) {
      final Map<String, dynamic> decodedData = json.decode(
          utf8.decode(response.bodyBytes));
      test = TestEditResponseDto.fromJson(decodedData);

      setState(() {
        isNecessaryFetchData = false;
      });
    };
  }


  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width * 2 / 3;

    if(test == null){
      return Container();
    }

    return Container(
      width: width, // Nastavenie šírky na dve tretiny obrazovky
      child: AlertDialog(
        title: Text('Nazov'),
        content: SingleChildScrollView(
          child: Form(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[

                if(isLoading)
                  Container()

              ],
            ),
          ),
        ),

        actions: <Widget>[

          ElevatedButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text('Zrušit'),
          ),
        ],
      ),
    );
  }

  Widget testDetailDialog(){
    _publicNameController.text = test?.publicName ?? "";
    _descriptionController.text = test?.description ?? "";
    _publishStatus = test?.publishStatus ?? _publishStatus;

    return AlertDialog(
      title: Text('Upraviť test'),
      content: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[

              TextFormField(
                controller: _publicNameController,
                decoration: InputDecoration(labelText: 'Názov'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Vyplňte prosím název';
                  }
                  return null;
                },
              ),
              TextFormField(
                  maxLength: 1000,
                  minLines: 3,
                  maxLines: null, // Nastavte null pre dynamický počet riadkov
                  controller: _descriptionController,
                  decoration: InputDecoration(labelText: 'Popis'),
                  onChanged: (value) {
                    setState(() {
                      _descriptionController;
                    });
                  }
              ),

            ],
          ),
        ),
      ),
      actions: <Widget>[
        ElevatedButton(
          onPressed: () {
            if (_formKey.currentState!.validate()) {
              _registration();
              // Zde můžete uložit hodnoty formuláře nebo provést další akce
              // Navigator.of(context).pop(true);
            }
          },
          child: Text('Uložit'),
        ),
        ElevatedButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Text('Zrušit'),
        ),
      ],
    );
  }

  Future<void> _registration() async {
    final Map<String, dynamic> requestDto = {
      'id': test!.id,
      'publicName' : _publicNameController!.text,
      'description' : _descriptionController!.text,
      'publishStatus': _publishStatus.name,
    };

    final response = await ApiHelper.callApi(
        method: ApiMethod.POST,
        url: '/test/a/edit',
        storage: widget.loginStorage,
        requestDto: requestDto
    );

    if(await (response.statusCode == 200)){
      Navigator.of(context).pop(true);
    }else{
      //todo error message
      // Navigator.of(context).pop(false);
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Upravovanie zlyhalo!', style: TextStyle(color: Colors.white)),
            backgroundColor: Colors.red.shade900, // Farba tmavočervená
            duration: Duration(seconds: 8), // Trvanie 8 sekúnd),

          ));
    }
  }

}
