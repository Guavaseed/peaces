import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:html_editor/html_editor.dart';

import '../widget/myWidgets.dart';

import '../constants.dart';
import '../Models/article.dart';

import '../Provider/articleProvider.dart';



class CreateArticleDialog extends StatefulWidget{

  final VoidCallback onSubmitted;

  CreateArticleDialog({Key key, this.onSubmitted}) : super(key:key);

  @override
  _CreateArticleDialogState createState()=> _CreateArticleDialogState();
}

class _CreateArticleDialogState extends State<CreateArticleDialog>{

  double _h;
  double _w;

  final bigTitleText = TextEditingController();
  final smallTitleText = TextEditingController();
  final articleText = TextEditingController();
  final tagText = TextEditingController();

  final _formState = GlobalKey<FormState>();
  final _keyEditor = GlobalKey<HtmlEditorState>();

  List<String> _tags =['A.I'];
 

  @override
  void initState(){
    super.initState();
  }

  @override
  void dispose(){
    bigTitleText.dispose();
    smallTitleText.dispose();
    articleText.dispose();
    tagText.dispose();
    
    super.dispose();
  }

  @override
  Widget build(BuildContext con){
    _h = MediaQuery.of(con).size.height;
    _w = MediaQuery.of(con).size.width;

    return Container(
      height: _h,
      width: _w,
      padding:EdgeInsets.fromLTRB(45, 10, 45, 10),
      child:Form(
        key:_formState,
        autovalidate: true,
        child:Column(
        crossAxisAlignment:CrossAxisAlignment.start,
        children: <Widget>[
          Expanded(
           flex:2,
           child:SizedBox(height:10)
         ),
         Expanded(
           flex:1,
           child: _heading(),
         ),
          Expanded(
           flex:1,
           child:SizedBox(height:10)
         ),
         Expanded(
                  flex:2,
                  child:_bigTitle()
         ),
          Expanded(
           flex:1,
           child:SizedBox(height:5)
         ),
          Expanded(
           flex:1,
           child:_chipSection()
         ),
         Expanded(
                  flex:2,
                  child:_smallTitle(),
          ),
          Expanded(
           flex:1,
           child:SizedBox(height:10)
         ),
          Expanded(
                  flex:1,
                  child:_articleHeading(),
          ),
          Expanded(
                  flex:6,
                  child:_articleWriteUp()
          ),
          Expanded(
           flex:2,
           child:SizedBox(height:20)
         ),

        Expanded(
           flex:2,
           child:_editorPanel(con)
         ),
         Expanded(
           flex:2,
           child:SizedBox(height:20)
         ),

        ],
      ),
      ),
    );
  }

  Widget _heading(){
    return Row(
      children: <Widget>[
        Expanded(
          flex:3,
          child:Text("New Article", style:TextStyle(fontWeight: FontWeight.bold, fontSize:29))
        ),

        Expanded(
          child:GestureDetector(
            onTap:(){},
            child:Icon(Icons.file_download),
          ),
        )
      ],
    );
  }

  Widget _bigTitle(){
    return TextFormField(
      controller: bigTitleText,
      validator: (value){
        if(value.isEmpty || value==null){
          return 'Please Fill this';
        }
        return null;
      },
      textCapitalization: TextCapitalization.words,
      style: TextStyle(fontWeight: FontWeight.bold, fontSize:24),
      decoration: InputDecoration(
        hintText: 'The main title of the article',
      ),
    );
  }

  Widget _smallTitle(){
    return TextFormField(
      controller: smallTitleText,
      validator: (value){
        if(value.isEmpty || value==null){
          return 'Please Fill this';
        }
        return null;
      },
      textCapitalization: TextCapitalization.words,
      style: TextStyle(fontSize:18),
      decoration: InputDecoration(
        hintText: 'The sub title of the article',
      ),
    );
  }

  Widget _chipSection(){
    return Container(
      width:_w,
      height:30,
      child:Row(
        children:<Widget>[
          GestureDetector(
            onTap:(){
              if(!(tagText.text==null || tagText.text.isEmpty)){
                _tags.add(tagText.text);
                tagText.clear();
              }
            },
            child:Text("Add Tag",style:TextStyle(fontSize:18,color:appColorLight))
          ),
          Expanded(
            child:TextFormField(
              controller:tagText,
              validator: (value){
                if(value.isEmpty || value==null){
                  return 'Please Fill this';
                }
                return null;
              },
              decoration: InputDecoration(
                 hintText: 'Tag e.g Technology'
              ),
            ),
          ),
        ]
      ),
    );
  }
  List<Widget> buildChip(){
    List<Widget> chips = new List();
    for(int i=0; i < _tags.length; i++){
      InputChip chip = InputChip(
        label:Text(_tags[i]),
        onDeleted:(){
          _tags.removeAt(i);

          setState((){});
        }
      );
      chips.add(chip);
    }
    return chips;
  }

  Widget _articleHeading(){
    return Text('Article Content', textAlign:TextAlign.start,
          style:TextStyle(fontWeight:FontWeight.bold,fontSize:20));
  }

  /*Widget _articleWriteUp(){
   return Container(
     //color:Colors.blueGrey[500],
     child:TextFormField(
        controller: articleText,
        validator: (value){
          if(value.isEmpty || value==null){
            return 'Please Fill this';
          }
          return null;
        },
        textCapitalization: TextCapitalization.sentences,
        maxLines:120,
        style: TextStyle(fontSize:15),
        decoration: InputDecoration(
          hintText: 'Type content here',
        ),
      ),
   );
  }*/
  Widget _articleWriteUp(){
   return Container(
     height:_h/2,
     //color:Colors.blueGrey[500],
     child:HtmlEditor(
       hint:"Article content here",
       key:_keyEditor,
       //showBottomToolbar: true,

     ),
   );
  }


  Widget _editorPanel(BuildContext con){
    return Container(
      padding:EdgeInsets.fromLTRB(40,0,40,0),
      child:EditorCard(
        mBgColor: appColor,
        mHeight: 210,
        mRadius:20,
        onAddClip: (){},
        onAddImage: (){},
        onAttachFile: (){},
        onFormatText: (){},
        onSend: (){         
          if(_formState.currentState.validate()){
             submitArticle(con);
          }
        },
      )
    );
  }

  void submitArticle(BuildContext con) async{
    var article = Article(
      aTitle:bigTitleText.text,
      aSmallTitle: smallTitleText.text,
      aWriteUp: articleText.text,
      aTag: 'Mathematcis',
      aIMage: articleImage2,
    );

   Provider.of<ArticleProvider>(con,listen:false).addArtcile(article);
   widget.onSubmitted();
  }

}