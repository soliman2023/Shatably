
import 'package:get/get.dart';
import 'package:graduation_project/model/product_models.dart';
import 'package:graduation_project/services/category_services.dart';


class CategoryController extends GetxController {
  var categoryNameList = <String>[].obs;
  var categoryList = <ProductModels>[].obs;

  var isCategoryLoading = false.obs;
  var isAllCategory = false.obs;

  List<String> imageCategory = [
    "https://www.aldar2030.com/UserFiles/NewsSizes/400/2021/06/20/3629.jpg?210620212200",
    "https://www.aldar2030.com/UserFiles/NewsSizes/400/2021/06/20/3629.jpg?210620212200",
    "https://www.aldar2030.com/UserFiles/NewsSizes/400/2021/06/20/3629.jpg?210620212200",
    "https://www.aldar2030.com/UserFiles/NewsSizes/400/2021/06/20/3629.jpg?210620212200",
  ].obs;

  @override
  void onInit() {
    super.onInit();
    getCategory();
  }

  void getCategory() async {
    var categoryName = await CategoryServices.getCategory();

    try {
      isCategoryLoading(true);
      if (categoryName.isNotEmpty) {
        categoryNameList.addAll(categoryName);
      }
    } finally {
      isCategoryLoading(false);
    }
  }

  getAllCategory(String nameCategory) async {
    isAllCategory(true);
    categoryList.value =
        await AllCategorySercvises.getAllCatehory(nameCategory);

    isAllCategory(false);
  }

  getCategoryIndex(int index) async {
    var categoryAllName = await getAllCategory(categoryNameList[index]);

    if (categoryAllName != null) {
      categoryList.value = categoryAllName;
    }
  }
}
