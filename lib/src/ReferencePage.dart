import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'references.dart';
import 'customExpansionTile.dart';
import 'referencelists.dart';
import 'addReferenceDialog.dart';
import 'referenceCardWidget.dart';



class ReferencePage extends StatefulWidget {
  ReferencePage(this.referenceList) : super();
  final ReferenceList referenceList;


  @override
  _ReferencePageState createState() => _ReferencePageState();
}

class _ReferencePageState extends State<ReferencePage> {

  ReferenceList referenceList;
  @override
  void initState(){
    super.initState();
    referenceList = widget.referenceList;
  }

  void addreference(Reference reference){
    setState(() {
      widget.referenceList.references.add(reference);
    });
  }


  Widget list(){
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: referenceList.backgroundColor.shade900,
            floating: true,
            pinned: true,
            snap: false,
            collapsedHeight: 60.0,
            expandedHeight: 250.0,
            flexibleSpace: FlexibleSpaceBar(
              title: SafeArea(child: Text(referenceList.title)),
              background: Container(
                width: double.infinity,
                child: Column(
                  children: [
                    Text("Authors:" + referenceList.author),
                    Text(referenceList.notes),
                  ],
                ),
              ),
            ),
            actions: [
              IconButton(
                icon: Icon(Icons.search),
                onPressed: (){}
              ),
              IconButton(
                icon: Icon(Icons.more_vert),
                onPressed: (){},
              )
            ],
          ),
          SliverList(delegate: SliverChildListDelegate((referenceList.references).map(referenceCardWidget).toList(),))
        ],
        controller: ScrollController(initialScrollOffset: 190.0),
      ),

      backgroundColor: referenceList.backgroundColor.shade700,
      drawer: Drawer(
          child: ListView()
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: referenceList.backgroundColor.shade900,
        child: Center(
          child: Icon(Icons.add,color: Colors.white,),
        ),
        onPressed: (){
          Navigator.of(context).push(PageRouteBuilder(
            opaque: false,
            barrierDismissible: true,
            pageBuilder: (BuildContext context, _, __){
              return AddReferenceDialog(addReferenceToList: (Reference newReference) => setState(() => referenceList.references.add(newReference)),);
            },
          ));
        },
        //onPressed: ()async{
          //await addReferenceDialog(context, (Reference newReference) => setState(() => referenceList.references.add(newReference)));
        //},
      ),
      resizeToAvoidBottomPadding: false,
    );
  }


  Widget AddListPage(){
    return Scaffold(
      appBar: AppBar(
        title: Text("New Reference List"),
        backgroundColor: Colors.grey,
      ),
      body: Center(
        child: Column(
          children: [IconButton(
            icon: Icon(Icons.add),
            onPressed: (){},
          ),
            Text("Add New Reference List")
          ],
        ),
      ),
      backgroundColor: Colors.grey.shade700,
    );
  }

  @override
  Widget build(BuildContext context) {
    return list();
  }
}
