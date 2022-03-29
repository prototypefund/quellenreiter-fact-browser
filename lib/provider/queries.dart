import 'package:statementmanager/models/statement.dart';

import '../models/fact.dart';

class Queries {
  static String statementText = "statement";
  static String statementPicture = "pictureUrl";
  static String statementYear = "year";
  static String statementMonth = "month";
  static String statementDay = "day";
  static String statementMediatype = "mediatype";
  static String statementLanguage = "language";
  static String statementCorrectness = "correctness";
  static String statementLink = "link";
  static String statementRectification = "rectification";
  static String statementCategory = "category";
  static String statementPictureCopyright = "samplePictureCopyright";
  static String statementAuthor = "author";
  static String statementMedia = "media";
  static String statementFactcheckIDs = "factcheckIDs";
  static String statementPictureFile = "PictureFile";

  static String factText = "fact";
  static String factYear = "year";
  static String factMonth = "month";
  static String factDay = "day";
  static String factLanguage = "language";
  static String factLink = "link";
  static String factArchivedLink = "archivedLink";
  static String factAuthor = "author";
  static String factMedia = "media";

  static List<String> correctnessValues = [
    "richtig",
    "unbelegt",
    "falscher Kontext",
    "manipuliert",
    "irreführend",
    "frei erfunden",
    "Fehlinformation"
  ];

  static List<String> categoryValues = [
    "Politik",
    "Sport",
    "Wirtschaft",
    "Gesellschaft",
    "Wissenschaft",
    "Kultur",
    "Geschichte"
  ];

  static List<String> mediatypeValues = [
    "Online-Artikel",
    "Print-Artikel",
    "Interview",
    "Social Media Post",
    "Werbung",
    "Foto",
    "Video",
    "TV-Beitrag",
    "Mythos"
  ];

  // static String[4] categories = [];

  //
  static String searchStatements(String query) {
    String ret = '''
  query searchStatementsByWord{
  statements(
    where:{
      OR:[
        { $statementText: { matchesRegex: "$query", options: "i"} }
        { $statementFactcheckIDs : { have:{ $factText:{ matchesRegex: "$query", options: "i" } } } }
      ]
  }){
    edges{
      node{
        objectId
        $statementText
        $statementPicture
        $statementYear
        $statementMonth
        $statementDay
        $statementCorrectness
        $statementMedia
        $statementLanguage
        $statementCategory
        $statementMediatype
        $statementAuthor
        $statementLink
        $statementRectification
        $statementPictureCopyright
        $statementFactcheckIDs{
            edges{
              node{
                objectId
                $factText
                $factAuthor
                $statementYear
                $statementMonth
                $statementDay
                $factLanguage
                $factMedia
                $factLink
                $factArchivedLink
              }
            }
        }
      }
    }
  }
}
  ''';
    return ret;
  }

  static String createFile() {
    String ret = '''
  mutation createAFile(\$file: Upload!){
  createFile(
    input:{
      upload: \$file
    }
  ){
    fileInfo{
      name
      url
    }
  }
}
  ''';
    return ret;
  }

  static String createStatement() {
    String ret = '''
  mutation createAStatement(\$input: CreateStatementInput!){
  createStatement(
       input: \$input
    ){
  statement{
    objectId
    $statementText
    $statementPicture
    $statementYear
    $statementMonth
    $statementDay
    $statementCorrectness
    $statementMedia
    $statementLanguage
    $statementCategory
    $statementMediatype
    $statementAuthor
    $statementLink
    $statementRectification
    $statementPictureCopyright
    $statementFactcheckIDs{
        edges{
          node{
            objectId
            $factText
            $factAuthor
            $factYear
            $factMonth
            $factDay
            $factLanguage
            $factMedia
            $factLink
            $factArchivedLink
          }
        }
      }
    }
  }
}
  ''';
    return ret;
  }

  static String updateStatement() {
    String ret = '''
  mutation updateAStatement(\$input: UpdateStatementInput!){
  updateStatement(
       input: \$input
    ){
  statement{
    objectId
    $statementText
    $statementPicture
    $statementYear
    $statementMonth
    $statementDay
    $statementCorrectness
    $statementMedia
    $statementLanguage
    $statementCategory
    $statementMediatype
    $statementAuthor
    $statementLink
    $statementRectification
    $statementPictureCopyright
    $statementFactcheckIDs{
        edges{
          node{
            objectId
              $factText
              $factAuthor
              $factYear
              $factMonth
              $factDay
              $factLanguage
              $factMedia
              $factLink
              $factArchivedLink
          }
        }
      }
    }
  }
}
  ''';
    return ret;
  }

  static String deleteFact(String factId) {
    // how to ensure that facts are not duplicated but changes
    //are still updated..??

    String ret = '''
  mutation deleteAFact{
  deleteFactcheck(
    input:{
      id: "$factId"
    }
    ){
    factcheck{
      fact
    }
  }
}
  ''';
    return ret;
  }

  static String login(String username, String password) {
    String ret = '''
mutation LogIn{
  logIn(input: {
    username: "$username"
    password: "$password"
  }){
    viewer{
      sessionToken
    }
  }
}
''';
    return ret;
  }

  static String getCurrentUser() {
    String ret = '''
query GetCurrentUser{
  viewer{
    sessionToken
  }
}
''';
    return ret;
  }

  static String getStatement(String? statementID) {
    String ret = '''
query getStatement{
  statement(
    	id: "$statementID"
  ){
    objectId
    $statementText
    $statementPicture
    $statementYear
    $statementMonth
    $statementDay
    $statementCorrectness
    $statementMedia
    $statementLanguage
    $statementCategory
    $statementMediatype
    $statementAuthor
    $statementLink
    $statementRectification
    $statementPictureCopyright
    $statementFactcheckIDs{
      edges{
        node{
          objectId
            $factText
            $factAuthor
            $factYear
            $factMonth
            $factDay
            $factLanguage
            $factMedia
            $factLink
            $factArchivedLink
        }
      }
    }
  }
}
''';
    return ret;
  }
}
