import 'dart:io';

class Article{
  String aTitle;
  String aIMage;
  String aSmallTitle;
  String aTag;
  String aWriteUp;
  File  aPhotoAttached;
  File  aClipAttached;

  Article({this.aTitle, 
            this.aTag,
            this.aSmallTitle,
            this.aWriteUp,
            this.aIMage});
}