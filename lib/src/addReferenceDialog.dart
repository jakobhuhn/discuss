import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'references.dart';
import 'customExpansionTile.dart';
import 'referencelists.dart';
import 'package:http/http.dart' as http;
import 'package:metadata_fetch/metadata_fetch.dart';
import 'references.dart';

Future<Reference> getReferenceFromUrl(String url) async{
  final response = await http.Client().get(url);
  if (response.statusCode ==200){
    var document = responseToDocument(response);
    var data = MetadataParser.htmlMeta(document).toMap();
    var ogdata = MetadataParser.openGraph(document).toMap();
    //print(data);
    print(ogdata);
    Reference newReference = Reference(name: data["title"],statement: "I need to figure out how to get the statement",domain: data["url"],author: "me",imageurl: ogdata["image"]);
    return newReference;
  }else{
    throw Exception();
  }
}


Future<void> addReferenceDialog(BuildContext context, Function addReferenceToList)async{
  bool window = true;
  TextEditingController _urlcontroller = TextEditingController();
  return await showDialog(context: context,
      builder: (context){
        return AddReferenceDialog(addReferenceToList: addReferenceToList,);
        });
}

class AddReferenceDialog extends StatefulWidget {
  final Function(Reference) addReferenceToList;
  AddReferenceDialog({this.addReferenceToList});

  bool window = true;
  TextEditingController urlcontroller = TextEditingController();

  @override
  _AddReferenceDialogState createState() => _AddReferenceDialogState();
}

class _AddReferenceDialogState extends State<AddReferenceDialog> {
  @override
  Widget build(BuildContext context) {
    return DialogWidget(window: widget.window, urlcontroller: widget.urlcontroller,changeWindow: ()=>setState(()=> widget.window = false,), addReferenceToList: widget.addReferenceToList, );
  }
}


class DialogWidget extends StatelessWidget {
  final bool window;
  final TextEditingController urlcontroller;
  final Function changeWindow;
  final Function(Reference) addReferenceToList;
  DialogWidget({this.window,this.urlcontroller,this.changeWindow,this.addReferenceToList});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(8.0)),
      ),
      child: AnimatedContainer(
        duration: Duration(seconds: 1,),
        child: window == true ? Window1(urlcontroller: urlcontroller,urlAdded: () => changeWindow()) : Window2(url: urlcontroller.text,addReferenceToList: addReferenceToList,pop: () => Navigator.of(context).pop(),),
      ),

    );
  }
}



class Window1 extends StatelessWidget {

  final TextEditingController urlcontroller;
  final Function urlAdded;
  Window1({this.urlcontroller,this.urlAdded,});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(
            controller: urlcontroller,
            decoration: InputDecoration(
              hintText: "Url",
              labelText: "Create new Reference",
              labelStyle: TextStyle(color:Colors.black),
              border: OutlineInputBorder(borderSide: BorderSide(color: Colors.black)),
              focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.black)),
            ),
          ),
          FlatButton(
            child: Text("Add"),
            onPressed: (){
              print(urlcontroller.text);
              urlAdded();
            },
          )
        ],
      ),
    );
  }
}

class Window2 extends StatelessWidget {
  final String url;
  final Function(Reference) addReferenceToList;
  final VoidCallback pop;
  Window2({this.url,this.addReferenceToList,this.pop});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: getReferenceFromUrl(url),
        builder: (BuildContext context, AsyncSnapshot snapshot){
          if (snapshot.data == null){
            return Padding(padding: EdgeInsets.all(8.0),
              child: Text("loading"),);
          }else{
            return Padding(padding: EdgeInsets.all(8.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Hero(child: Text(snapshot.data.name),tag: snapshot.data.name,),
                    FlatButton(
                      child: Text("Add Reference"),
                      onPressed: (){
                        addReferenceToList(snapshot.data);
                        pop();
                      },
                    ),
                  ],
                ));
          }
        }
    );
  }
}