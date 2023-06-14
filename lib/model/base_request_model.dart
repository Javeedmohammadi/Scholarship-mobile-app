

class BaseRequestModel {

  final String? id;
  final int? page;
  final int? perPage;
  final String? searchKeyWord;
  final int? categoryId;

  BaseRequestModel({
    this.id,
    this.page,
    this.perPage,
    this.searchKeyWord,
    this.categoryId,
  });
}
