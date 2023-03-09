


class BooksModel{

  BooksModel({required this.id,
    required  this.name,
    required  this.author,
    required  this.section,
    required  this.pages,
    required  this.fileSize,
    required  this.publisher,
    required  this.releaseDate,
    required  this.price,
    required  this.language,
    required  this.imageUrl,
  });

  final  int id ;
  final  int pages;
  final  double fileSize;
  final  double price;
  final  String name;
  final  String author;
  final  String section;
  final  String publisher;
  final  String language;
  final  String imageUrl;
  final  String releaseDate;


  factory BooksModel.fromeJson(Map<String , dynamic> jsonData){
    return BooksModel(
      id: jsonData['id'],
      name: jsonData['Title'],
      author: jsonData['Author'],
      section: jsonData['Section'],
      pages: jsonData['NumberOfPages'],
      fileSize: jsonData['Size'],
      publisher: jsonData['Publisher'],
      releaseDate: jsonData['ReleaseDate'],
      price: jsonData['Price'],
      language: jsonData['Language'],
      imageUrl: jsonData['ImageUrl'],
    );
  }

}