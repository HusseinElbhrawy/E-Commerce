import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/utils/app_assets.dart';
import '../../../../core/utils/constant.dart';
import '../../../../core/utils/dimensions.dart';
import '../../../../core/utils/enums.dart';
import '../../../../core/utils/fonts_manager.dart';
import '../../../../core/utils/media_query_values.dart';
import '../../../../core/widgets/big_text_widget.dart';
import '../../../../core/widgets/small_text_widget.dart';
import '../bloc/home_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(AppConstant.defaultPadding(context)),
      child: CustomScrollView(
        slivers: [
          SliverAppBar(
            title: SvgPicture.asset(
              AppSvgAssets.appLogo,
              height: AppDimensions.height45(context),
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                const HomeSearchWidget(),
                const HomeBannerWidget(),
                AppConstant.horizontalDivider(),
                const BigTextWidget(
                  'Categories',
                  fontWeight: AppFontsWeight.bold,
                ),
                const HomeCategoriesWidget(),
                const BigTextWidget(
                  'Products',
                  fontWeight: AppFontsWeight.bold,
                ),
                AppConstant.horizontalDivider(),
              ],
            ),
          ),
          SliverGrid.builder(
            itemCount: 15,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: AppDimensions.height20(context),
              crossAxisSpacing: AppDimensions.width20(context),
              childAspectRatio: .8,
            ),
            itemBuilder: (context, index) {
              return const SingleProductItemWidget();
            },
          ),
        ],
      ),
    );
  }
}

class SingleProductItemWidget extends StatelessWidget {
  const SingleProductItemWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey.shade300,
        borderRadius: BorderRadius.circular(
          AppConstant.defaultPadding(context) / 2,
        ),
      ),
      child: Column(
        children: [
          Align(
            alignment: AlignmentDirectional.topEnd,
            child: IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.favorite_border,
                color: Colors.black,
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Material(
                clipBehavior: Clip.antiAlias,
                borderRadius: BorderRadius.circular(
                  AppConstant.defaultPadding(context) / 2,
                ),
                child: Image.asset(
                  'assets/images/on_boarding_1.png',
                  fit: BoxFit.fill,
                  width: double.infinity,
                ),
              ),
            ),
          ),
          Column(
            children: const [
              SmallTextWidget(
                'Product Name',
                fontWeight: AppFontsWeight.bold,
              ),
              BigTextWidget(
                'Rs. 1000',
                fontWeight: AppFontsWeight.bold,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class HomeCategoriesWidget extends StatelessWidget {
  const HomeCategoriesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.only(bottom: kToolbarHeight / 2),
      scrollDirection: Axis.horizontal,
      child: Row(
        children: List.generate(
          6,
          (index) => Column(
            children: [
              Container(
                height: context.height / 6,
                width: context.width / 3,
                margin: const EdgeInsets.only(
                  top: kToolbarHeight / 2,
                  left: 8,
                  right: 8,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(
                    AppConstant.defaultPadding(context) / 2,
                  ),
                  color: Colors.grey.shade300,
                  image: const DecorationImage(
                    image: AssetImage(
                      'assets/images/on_boarding_1.png',
                    ),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              AppConstant.horizontalDivider(),
              const SmallTextWidget(
                'Category Name',
                fontWeight: AppFontsWeight.bold,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class HomeBannerWidget extends StatelessWidget {
  const HomeBannerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: context.height / 6,
      child: PageView.builder(
        itemCount: 3,
        itemBuilder: (context, index) {
          return Container(
            margin: const EdgeInsets.only(
              top: kToolbarHeight / 2,
              left: 8,
              right: 8,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(
                AppConstant.defaultPadding(context) / 2,
              ),
              color: Colors.grey.shade300,
              image: DecorationImage(
                image: AssetImage('assets/images/on_boarding_${index + 1}.png'),
                fit: BoxFit.cover,
              ),
            ),
          );
        },
      ),
    );
  }
}

class HomeSearchWidget extends StatelessWidget {
  const HomeSearchWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Material(
            elevation: 20,
            color: Colors.transparent,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.grey.shade300,
                borderRadius: BorderRadius.circular(
                  AppConstant.defaultPadding(context) / 2,
                ),
              ),
              child: TextFormField(
                scrollPadding: EdgeInsets.zero,
                textInputAction: TextInputAction.search,
                keyboardType: TextInputType.text,
                onFieldSubmitted: (value) {},
                decoration: const InputDecoration(
                  hintText: 'Search',
                  prefixIcon: Icon(
                    Icons.search,
                    color: Colors.black,
                  ),
                  errorBorder: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  disabledBorder: InputBorder.none,
                  focusedErrorBorder: InputBorder.none,
                  border: InputBorder.none,
                ),
              ),
            ),
          ),
        ),
        AppConstant.verticalDivider(),
        Material(
          elevation: 20,
          color: Colors.transparent,
          child: IconButton(
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(
                Colors.grey.shade300,
              ),
              shape: MaterialStatePropertyAll(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(
                    AppConstant.defaultPadding(context) / 2,
                  ),
                ),
              ),
              padding: MaterialStateProperty.all(
                const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 16,
                ),
              ),
            ),
            onPressed: () {},
            icon: const Icon(Icons.filter_alt),
          ),
        ),
      ],
    );
  }
}

class HomeBody extends StatelessWidget {
  const HomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        log(state.toString(), error: state);
        switch (state.state) {
          case RequestState.loading:
            return const Center(
              child: CircularProgressIndicator.adaptive(),
            );
          case RequestState.loaded:
            return Center(
              child: Text(
                state.data.toString(),
                maxLines: null,
                overflow: TextOverflow.visible,
              ),
            );
          case RequestState.error:
            return Center(
              child: BigTextWidget(state.errorMessage.toString()),
            );
        }
      },
    );
  }
}
