import 'package:culture_circle_app_task/presentation/resources/assets_manager.dart';
import 'package:culture_circle_app_task/presentation/resources/icons_manager.dart';
import 'package:culture_circle_app_task/presentation/resources/strings_manager.dart';
import 'package:culture_circle_app_task/presentation/resources/values_manager.dart';
import 'package:flutter/material.dart';

class AuthView extends StatefulWidget {
  const AuthView({super.key});

  @override
  State<AuthView> createState() => _AuthViewState();
}

class _AuthViewState extends State<AuthView>
    with TickerProviderStateMixin<AuthView>, AutomaticKeepAliveClientMixin<AuthView> {

  late TabController _tabController;
  int _selectedTab = 0;
  bool _hidePassword = true;
  
  @override
  void initState() {
    super.initState();
    _tabController = TabController(
      length: AppValueManager.v2, 
      vsync: this,
    ); 
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  bool get wantKeepAlive => true; 
  //* FOR KEEPING THE TABS STATE ALIVE
  //! TEXT FIELDS' CAN ALSO BE KEPT ALIVE BY USING CONTROLLERS

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return DefaultTabController(
      length: AppValueManager.v2,
      child: Scaffold(
        body: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return [
              SliverAppBar(
                title: Image.asset(ImageAssetManager.categories),
                pinned: true,
                floating: true,
                automaticallyImplyLeading: false,
                bottom: TabBar(
                  controller: _tabController,
                  tabs: const [
                    Tab(child: Text(StringManager.signUp)),
                    Tab(child: Text(StringManager.logIn)),
                  ],
                ),
              ),
            ];
          },
          body: _body(),
        ),
      ),
    );
  }

  _body() {
    return TabBarView(
      controller: _tabController,
      children: [
        _signUpView(), 
        _loginView(),
      ],
    );
  }

  _signUpView() {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: AppPaddingManager.p10,
        ),
        child: Form(
          child: Column(
            children: [
              _getFormSpacing(AppSizeManager.s30),
              _getTextField(StringManager.firstName),
              _getFormSpacing(AppSizeManager.s10),
              _getTextField(StringManager.lastName),
              _getFormSpacing(AppSizeManager.s10),
              _getTextField(StringManager.emailAddress),
              _getFormSpacing(AppSizeManager.s10),
              _getPasswordField(true),
              _getFormSpacing(AppSizeManager.s10),
              _getButton(StringManager.signUp),
              _getFormSpacing(AppSizeManager.s8),
              _getConditionsText(StringManager.signUpConditions),
              _getFormSpacing(AppSizeManager.s10),
              _getORField(),
              _getFormSpacing(AppSizeManager.s10),
              _getSignUpButton(ImageAssetManager.categories, StringManager.continueWithGoogle),
              _getFormSpacing(AppSizeManager.s10),
              _getSignUpButton(ImageAssetManager.categories, StringManager.continueWithFacebook),
              _getFormSpacing(AppSizeManager.s10),
              _getSignUpButton(ImageAssetManager.categories, StringManager.continueWithTwitter),
              _getFormSpacing(AppSizeManager.s10),
              _getSwitchForm(StringManager.moveToLogin),
              _getFormSpacing(AppSizeManager.s100),
            ],
          ),
        ),
      ),
    );
  }

  _getFormSpacing(double height) {
    return SizedBox(
      height: height,
    );
  }

  _getTextField(String text) {
    return TextFormField(
      decoration: InputDecoration(
        labelText: text,
      ),
    );
  }

  _getPasswordField(bool helperText) {
    return TextFormField(
      obscureText: _hidePassword,
      decoration: InputDecoration(
        helperText: (helperText) ? StringManager.passwordHelperText : null,
        labelText: StringManager.password,
        suffix: IconButton(
          icon: Icon((_hidePassword == false)
              ? IconManager.hidePassword
              : IconManager.showPassword),
          onPressed: () {
            setState(() {
              (_hidePassword == false)
                  ? (_hidePassword = true)
                  : (_hidePassword = false);
            });
          },
        ),
      ),
    );
  }

  _getButton(String text) {
    return SizedBox(
      height: AppSizeManager.s50,
      width: double.maxFinite,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          minimumSize: const Size(double.maxFinite, double.maxFinite),
        ),
        child: Text(text),
        onPressed: () {},
      ),
    );
  }

  _getConditionsText(String text) {
    return Text(
      text,
      style: Theme.of(context).textTheme.displaySmall,
    );
  }

  _getORField() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Expanded(
          child: Divider(thickness: AppSizeManager.s2),
        ),
        Padding(
          padding: const EdgeInsets.all(AppPaddingManager.p10),
          child: Text(
            StringManager.or,
            style: Theme.of(context).textTheme.displaySmall,
          ),
        ),
        const Expanded(child: Divider(thickness: AppSizeManager.s2)),
      ],
    );
  }

  _getSignUpButton(String image, String text) {
    return SizedBox(
      height: AppSizeManager.s50,
      width: double.maxFinite,
      child: OutlinedButton(
        onPressed: () {},
        child: Row(
          children: [
            Image.asset(image),
            Text(
              text,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ],
        ),
      ),
    );
  }

  _getSwitchForm(String text) {
    return InkWell(
      child: Text(
        text,
        style: Theme.of(context).textTheme.displaySmall,
      ),
      onTap: () {
        _tabController.animateTo((_selectedTab == 0) ? (AppValueManager.v1) : (AppValueManager.v0));
        setState(() {
          _selectedTab = (_selectedTab == 0) ? (AppValueManager.v1) : (AppValueManager.v0);
        });
      },
    );
  }

  _loginView() {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: AppPaddingManager.p10,
        ),
        child: Form(
          child: Column(
            children: [
              _getFormSpacing(AppSizeManager.s30),
              _getTextField(StringManager.emailAddress),
              _getFormSpacing(AppSizeManager.s10),
              _getPasswordField(false),
              _getFormSpacing(AppSizeManager.s10),
              _getForgotPassword(),
              _getButton(StringManager.logIn),
              _getFormSpacing(AppSizeManager.s8),
              _getConditionsText(StringManager.logInConditions),
              _getFormSpacing(AppSizeManager.s10),
              _getORField(),
              _getFormSpacing(AppSizeManager.s10),
              _getSignUpButton(ImageAssetManager.categories, StringManager.continueWithGoogle),
              _getFormSpacing(AppSizeManager.s10),
              _getSignUpButton(ImageAssetManager.categories, StringManager.continueWithFacebook),
              _getFormSpacing(AppSizeManager.s10),
              _getSignUpButton(ImageAssetManager.categories, StringManager.continueWithTwitter),
              _getFormSpacing(AppSizeManager.s10),
              _getSwitchForm(StringManager.moveToSignup),
            ],
          ),
        ),
      ),
    );
  }

  _getForgotPassword() {
    return Container(
      padding: const EdgeInsets.only(bottom: AppPaddingManager.p8),
      alignment: Alignment.centerRight,
      child: Text(
        StringManager.forgotPassword,
        style: Theme.of(context).textTheme.displaySmall,
      ),
    );
  }
}
