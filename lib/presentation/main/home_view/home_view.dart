import 'package:carousel_slider/carousel_slider.dart';
import 'package:culture_circle_app_task/presentation/main/product_view/product_view.dart';
import 'package:culture_circle_app_task/presentation/resources/assets_manager.dart';
import 'package:culture_circle_app_task/presentation/resources/colors_manager.dart';
import 'package:culture_circle_app_task/presentation/resources/icons_manager.dart';
import 'package:culture_circle_app_task/presentation/resources/strings_manager.dart';
import 'package:culture_circle_app_task/presentation/resources/values_manager.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;

  // SAMPLE DATA
  final List<String> _carouselImages = [
    ImageAssetManager.banner5,
    ImageAssetManager.banner2,
    ImageAssetManager.banner3,
    ImageAssetManager.banner4,
  ];

  // SAMPLE DATA
  final List<Map<String, String>> _categories = [
    {
      'image': ImageAssetManager.category1,
      'category_name': StringManager.categorySneakers,
    },
    {
      'image': ImageAssetManager.category2,
      'category_name': StringManager.categoryApparel,
    },
    {
      'image': ImageAssetManager.category3,
      'category_name': StringManager.categoryElectronics,
    },
    {
      'image': ImageAssetManager.category4,
      'category_name': StringManager.categoryShoes,
    },
    {
      'image': ImageAssetManager.category5,
      'category_name': StringManager.categoryTradingCards,
    },
  ];

  final List<Map<String, String>> _listOfProducts = [
    {
      'image': ImageAssetManager.product1,
      'name': StringManager.shoe1,
      'ask': StringManager.lowestAsk,
      'price': StringManager.price,
      'last_sale': StringManager.lastSale,
    },
    {
      'image': ImageAssetManager.product2,
      'name': StringManager.shoe2,
      'ask': StringManager.lowestAsk,
      'price': StringManager.price,
      'last_sale': StringManager.lastSale,
    },
    {
      'image': ImageAssetManager.product3,
      'name': StringManager.shoe3,
      'ask': StringManager.lowestAsk,
      'price': StringManager.price,
      'last_sale': StringManager.lastSale,
    },
    {
      'image': ImageAssetManager.product4,
      'name': StringManager.shoe4,
      'ask': StringManager.lowestAsk,
      'price': StringManager.price,
      'last_sale': StringManager.lastSale,
    },
    {
      'image': ImageAssetManager.product5,
      'name': StringManager.shoe5,
      'ask': StringManager.lowestAsk,
      'price': StringManager.price,
      'last_sale': StringManager.lastSale,
    },
    {
      'image': ImageAssetManager.product6,
      'name': StringManager.shoe6,
      'ask': StringManager.lowestAsk,
      'price': StringManager.price,
      'last_sale': StringManager.lastSale,
    },
  ];

  final List<Map<String, String>> _listOfBrands = [
    {
      'image': ImageAssetManager.brand1,
    },
    {
      'image': ImageAssetManager.brand2,
    },
    {
      'image': ImageAssetManager.brand3,
    },
    {
      'image': ImageAssetManager.brand4,
    },
    {
      'image': ImageAssetManager.brand5,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _getCarousel(_carouselImages),
            _getSpacing(AppSizeManager.s20),
            _getTextSection(StringManager.shopByCategory),
            _getAllCategories(_categories),
            _getTextSection(StringManager.recommendedForYou),
            _getProductsList(_listOfProducts),
            _getSpacing(AppSizeManager.s20),
            _getTextSection(StringManager.popularBrands),
            _getBrands(_listOfBrands),
            _getSpacing(AppSizeManager.s20),
            _getBanner(),
            _getSpacing(AppSizeManager.s20),
          ],
        ),
      ),
    );
  }

  _getSpacing(double height) {
    return SizedBox(
      height: height,
    );
  }

  _getTextSection(String title) {
    return Padding(
      padding: const EdgeInsets.all(AppSizeManager.s10),
      child: Text(
        title,
        style: Theme.of(context).textTheme.titleLarge,
      ),
    );
  }

  _getCarousel(List carouselImages) {
    return Stack(
      alignment: Alignment.bottomRight,
      fit: StackFit.loose,
      children: [
        CarouselSlider.builder(
          itemCount: carouselImages.length,
          itemBuilder: (context, index, realIndex) {
            final image = carouselImages[index];
            return _buildImage(image, index);
          },
          options: CarouselOptions(
            height: AppSizeManager.s340,
            viewportFraction: AppSizeManager.s1,
            reverse: false,
            onPageChanged: (index, reason) {
              setState(() {
                _currentIndex = index;
              });
            },
          ),
        ),
        Container(
          height: AppSizeManager.s40,
          padding: const EdgeInsets.all(AppPaddingManager.p10),
          child: ListView.separated(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemCount: carouselImages.length,
            itemBuilder: (context, index) => Center(
              child: Container(
                height: AppSizeManager.s10,
                width: AppSizeManager.s10,
                decoration: BoxDecoration(
                  color: (_currentIndex == index)
                      ? ColorManager.darkGrey
                      : ColorManager.white,
                  borderRadius: const BorderRadius.all(
                      Radius.circular(AppSizeManager.s2)),
                ),
              ),
            ),
            separatorBuilder: (context, index) =>
                const SizedBox(width: AppSizeManager.s10),
          ),
        ),
      ],
    );
  }

  _buildImage(String image, int index) {
    return Image.asset(
      image,
      fit: BoxFit.cover,
      width: double.maxFinite,
    );
  }

  _getAllCategories(List categories) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppPaddingManager.p10),
      child: SizedBox(
        height: AppSizeManager.s130,
        child: ListView.separated(
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemCount: categories.length,
          itemBuilder: (context, index) => Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox.square(
                dimension: AppSizeManager.s80,
                child: Image.asset(categories[index]['image'].toString()),
              ),
              const SizedBox(height: AppPaddingManager.p8),
              Text(
                categories[index]['category_name'].toString(),
                style: Theme.of(context).textTheme.labelSmall,
              ),
            ],
          ),
          separatorBuilder: (context, index) =>
              const SizedBox(width: AppSizeManager.s10),
        ),
      ),
    );
  }

  _getProductsList(List listOfProducts) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppPaddingManager.p10),
      child: SizedBox(
        height: AppSizeManager.s260,
        child: ListView.separated(
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemCount: listOfProducts.length,
          itemBuilder: (context, index) => GestureDetector(
            onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (_) => ProductView(listOfProducts[index]))),
            child: Container(
              width: AppSizeManager.s140,
              decoration: BoxDecoration(
                border: Border.all(
                  color: ColorManager.grey,
                  width: AppSizeManager.s1,
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(AppPaddingManager.p10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      flex: AppValueManager.v4,
                      child: Image.asset(
                        listOfProducts[index]['image'].toString(),
                        fit: BoxFit.cover,
                        width: double.maxFinite,
                      ),
                    ),
                    const SizedBox(height: AppPaddingManager.p8),
                    Expanded(
                      flex: AppValueManager.v4,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            listOfProducts[index]['name'].toString(),
                            style: Theme.of(context).textTheme.labelMedium,
                            maxLines: AppValueManager.v2,
                            overflow: TextOverflow.ellipsis,
                          ),
                          Text(
                            listOfProducts[index]['ask'].toString(),
                            style: Theme.of(context).textTheme.labelSmall,
                          ),
                          Text(
                            listOfProducts[index]['price'].toString(),
                            style: Theme.of(context).textTheme.labelLarge,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: AppPaddingManager.p8),
                    Expanded(
                      flex: AppValueManager.v1,
                      child: Container(
                        color: ColorManager.grey,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const Icon(
                              IconManager.dot,
                              color: ColorManager.primary,
                              size: AppSizeManager.s14,
                            ),
                            Text(
                              listOfProducts[index]['last_sale'].toString(),
                              style: Theme.of(context).textTheme.titleSmall,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          separatorBuilder: (context, index) =>
              const SizedBox(width: AppSizeManager.s10),
        ),
      ),
    );
  }

  _getBrands(List categories) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppPaddingManager.p10),
      child: SizedBox(
        height: AppSizeManager.s80,
        child: ListView.separated(
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemCount: categories.length,
          itemBuilder: (context, index) => SizedBox(
            height: AppSizeManager.s80,
            width: AppSizeManager.s120,
            child: Image.asset(
              categories[index]['image'].toString(),
              fit: BoxFit.cover,
              width: double.maxFinite,
            ),
          ),
          separatorBuilder: (context, index) =>
              const SizedBox(width: AppSizeManager.s10),
        ),
      ),
    );
  }

  _getBanner() {
    return Padding(
      padding: const EdgeInsets.all(AppPaddingManager.p10),
      child: SizedBox.square(
        dimension: MediaQuery.of(context).size.width,
        child: Image.asset(ImageAssetManager.banner6),
      ),
    );
  }
}
