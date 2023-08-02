import 'package:culture_circle_app_task/presentation/resources/assets_manager.dart';
import 'package:culture_circle_app_task/presentation/resources/colors_manager.dart';
import 'package:culture_circle_app_task/presentation/resources/icons_manager.dart';
import 'package:culture_circle_app_task/presentation/resources/strings_manager.dart';
import 'package:culture_circle_app_task/presentation/resources/values_manager.dart';
import 'package:flutter/material.dart';

class ProductView extends StatefulWidget {
  final Map<String, String> _product;
  const ProductView(this._product, {super.key});

  @override
  State<ProductView> createState() => _ProductViewState();
}

class _ProductViewState extends State<ProductView> {
  final List<Map<String, String>> _listOfProducts = [
    {
      'image': ImageAssetManager.product5,
      'name': StringManager.shoe5,
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
      'image': ImageAssetManager.product2,
      'name': StringManager.shoe2,
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
    {
      'image': ImageAssetManager.product1,
      'name': StringManager.shoe1,
      'ask': StringManager.lowestAsk,
      'price': StringManager.price,
      'last_sale': StringManager.lastSale,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(context),
      body: _body(widget._product),
    );
  }

  _appBar(context) {
    return AppBar(
      leading: IconButton(
        icon: const Icon(IconManager.backArrow),
        onPressed: () => Navigator.pop(context),
      ),
      actions: const [
        Padding(
          padding: EdgeInsets.all(AppPaddingManager.p10),
          child: Icon(IconManager.share),
        ),
        Padding(
          padding: EdgeInsets.all(AppPaddingManager.p10),
          child: Icon(IconManager.add),
        ),
      ],
      bottom: _bottomAppBar(),
    );
  }

  _bottomAppBar() {
    return PreferredSize(
      preferredSize: const Size.fromHeight(AppSizeManager.s140),
      child: SizedBox(
        height: AppSizeManager.s140,
        child: Padding(
          padding: const EdgeInsets.all(AppPaddingManager.p10),
          child: Column(
            children: [
              Expanded(
                flex: AppValueManager.v1,
                child: _sizeChart(),
              ),
              const SizedBox(height: AppSizeManager.s10),
              Expanded(
                flex: AppValueManager.v1,
                child: _buttons(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  _sizeChart() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: AppPaddingManager.p10),
      height: AppSizeManager.s40,
      width: double.maxFinite,
      decoration: BoxDecoration(
        border: Border.all(
          width: AppSizeManager.s1,
          color: Colors.black,
        ),
        borderRadius:
            const BorderRadius.all(Radius.circular(AppSizeManager.s10)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            StringManager.size,
            style: Theme.of(context).textTheme.titleSmall,
          ),
          SizedBox(
            child: Row(
              children: [
                Text(
                  StringManager.all,
                  style: Theme.of(context).textTheme.titleSmall,
                ),
                const Icon(IconManager.downArrow),
              ],
            ),
          ),
        ],
      ),
    );
  }

  _buttons() {
    return Row(
      children: [
        Expanded(
          flex: AppValueManager.v6,
          child: Container(
            width: double.maxFinite,
            height: double.maxFinite,
            color: ColorManager.primary,
            child: _buyOrSellButton(StringManager.buyPrice,
                StringManager.buySize, StringManager.buyORBid),
          ),
        ),
        const Expanded(
          flex: AppValueManager.v1,
          child: SizedBox(),
        ),
        Expanded(
          flex: AppValueManager.v6,
          child: Container(
            width: double.maxFinite,
            height: double.maxFinite,
            color: ColorManager.black,
            child: _buyOrSellButton(StringManager.sellPrice,
                StringManager.sellSize, StringManager.sellORAsk),
          ),
        ),
      ],
    );
  }

  _buyOrSellButton(
      String price, String size, String ask) {
    return Padding(
      padding: const EdgeInsets.all(AppPaddingManager.p4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            flex: AppValueManager.v4,
            child: Padding(
              padding: const EdgeInsets.only(left: AppPaddingManager.p8),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    price,
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  Text(
                    size,
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                ],
              ),
            ),
          ),
          const Expanded(
            flex: AppValueManager.v1,
            child: VerticalDivider(
              thickness: AppSizeManager.s1,
              color: ColorManager.white,
            ),
          ),
          Expanded(
            flex: AppValueManager.v2,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  ask,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  _body(Map product) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _getSpacing(AppSizeManager.s10),
          _getTitle(product['name'].toString()),
          _getProductImage(widget._product['image'].toString()),
          _getProductStatus(),
          _getSpacing(AppSizeManager.s10),
          _getPricingData(StringManager.lastSaleText, StringManager.lastSalePrice, StringManager.lastSaleAnalytics),
          _getSpacing(AppSizeManager.s10),
          _getDivider(),
          _getExpandableSection(StringManager.stockXVerified, IconManager.verified, StringManager.stockXVerifiedText),
          _getDivider(),
          _getExpandableSection(StringManager.ourPromise, IconManager.trust, StringManager.ourPromiseTxet),
          _getDivider(),
          _getRelatedProductsBanner(),
          _getSpacing(AppSizeManager.s10),
          _getProductsList(_listOfProducts),
          _getSpacing(AppSizeManager.s40),
        ],
      ),
    );
  }

  _getSpacing(double height) {
    return SizedBox(
      height: height,
    );
  }

  _getDivider() {
    return const Divider(
      height: AppSizeManager.s1,
      color: ColorManager.darkGrey,
      thickness: AppSizeManager.s1,
    );
  }

  _getTitle(String title) {
    return Padding(
      padding: const EdgeInsets.all(AppPaddingManager.p10),
      child: Text(
        title,
        style: Theme.of(context).textTheme.titleLarge,
      ),
    );
  }

  _getProductImage(String image) {
    return Padding(
      padding: const EdgeInsets.all(AppPaddingManager.p10),
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: AppSizeManager.s300,
        child: Image.asset(
          image,
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  _getProductStatus() {
    return Padding(
      padding: const EdgeInsets.all(AppPaddingManager.p10),
      child: Container(
        height: AppSizeManager.s60,
        width: double.maxFinite,
        decoration: BoxDecoration(
          border: Border.all(
            width: AppSizeManager.s1,
            color: Colors.black,
          ),
          borderRadius:
              const BorderRadius.all(Radius.circular(AppSizeManager.s10)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Expanded(
              flex: AppValueManager.v1,
              child: Icon(
                IconManager.flash,
                size: AppSizeManager.s50,
                color: ColorManager.yellow,
              ),
            ),
            const SizedBox(width: AppSizeManager.s10),
            Expanded(
              flex: AppValueManager.v10,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    StringManager.productSellingFast,
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  const SizedBox(height: AppSizeManager.s4),
                  Text(
                    StringManager.purchases,
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  _getPricingData(String pricingText, String price, String analytic) {
    return Padding(
      padding: const EdgeInsets.all(AppPaddingManager.p10),
      child: Row(
        children: [
          Expanded(
            flex: AppValueManager.v1,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  pricingText,
                  style: Theme.of(context).textTheme.titleSmall,
                ),
                const SizedBox(height: AppSizeManager.s4),
                Text(
                  price,
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                const SizedBox(height: AppSizeManager.s4),
                Text(
                  analytic,
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
              ],
            ),
          ),
          Expanded(
            flex: AppValueManager.v1,
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(
                  width: AppSizeManager.s1,
                  color: ColorManager.black,
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(AppPaddingManager.p10),
                child: Center(
                  child: Text(
                    StringManager.viewMarketData,
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                ),
                ),
            ),
          ),
        ],
      ),
    );
  }

  _getExpandableSection(String title, IconData logo, String text) {
    return ExpansionTile(
      title: Row(
        children: [
          Icon(logo),
          const SizedBox(width: AppSizeManager.s8),
          Text(title),
        ],
      ),
      children: [
        Padding(
          padding: const EdgeInsets.only(
            left: AppPaddingManager.p30,
            right: AppPaddingManager.p30,
            bottom: AppPaddingManager.p10,
          ),
          child: Text(
            text,
            style: Theme.of(context).textTheme.labelSmall,
          ),
        )
      ],
    );
  }

  _getRelatedProductsBanner() {
    return SizedBox(
      height: AppSizeManager.s40,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: AppPaddingManager.p10),
        child: Container(
          color: ColorManager.black,
          child: Padding(
            padding: const  EdgeInsets.all(AppPaddingManager.p10),
            child: Text(
              StringManager.relatedProducts,
              style: Theme.of(context).textTheme.displayMedium,
            ),
          ),
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
            onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => ProductView(listOfProducts[index]))),
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
}
