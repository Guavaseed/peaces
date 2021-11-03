import '../Models/article.dart';
import '../Models/post.dart';
import '../Models/story.dart';
import '../constants.dart';



class Data{
  static final p1 = Post(pImage: postImage,pLikes: 300,pTimeStamp: 4,pTitle: 'How Nanotechnology will change security',
                  pDes: '$articleContent', );
  static final p2 = Post(pImage: articleImage1,pLikes: 300,pTimeStamp: 4,pTitle: 'How Nanotechnology will change security',
                  pDes: '$articleContent', );
  static final p3 = Post(pImage: articleImage2,pLikes: 300,pTimeStamp: 4,pTitle: 'How Nanotechnology will change security',
                  pDes: '$articleContent', );

 static  final _a1 = Article(aIMage:articleImage,aTitle: 'The revolution of the necro mongers',aSmallTitle: 'The life of Richard B Riddick',
              aWriteUp: '$articleContent', aTag:'Technology');

  static final _a2 = Article(aIMage:articleImage1,aTitle: 'The revolution of the necro mongers',aSmallTitle: 'The life of Richard B Riddick',
              aWriteUp: '$articleContent',aTag:'Medecine' );

  static final _a3 = Article(aIMage:articleImage2,aTitle: 'The revolution of the necro mongers',aSmallTitle: 'The life of Richard B Riddick',
              aWriteUp: '$articleContent',aTag:'Astronomy');

  static final s1 = Story(profileUrl: '$storyProfilePix',profileName: 'Victor');
  static final s2 = Story(profileUrl: '$storyProfilePix1',profileName: 'Gbamis');
  static final s3 = Story(profileUrl: '$storyProfilePix2',profileName: 'Elon');
  static final s4 = Story(profileUrl: '$storyProfilePix3',profileName: 'Bezoz');

  static List<Post> dataPost = [p1,p2,p3];
  static List<Article> dataArticles = [_a1,_a2,_a3];
  static List<Story> dataStories = [s1,s2,s3,s4,s1,s2,s3,s4];
  
}