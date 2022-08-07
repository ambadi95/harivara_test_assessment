import 'package:flutter/material.dart';
import 'package:splash/splash/splash_screen_args.dart';
import 'package:splash/splash/state/splash_state.dart';
import 'package:splash/splash/view_model/splash_coordinator.dart';
import 'package:splash/splash_module.dart';
import 'package:core/view/base_view.dart';
import 'package:config/Config.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:get/get.dart';
import 'package:welcome/sub_features/welcome/data_model/welcome_model.dart';
import 'package:widget_library/page_header/text_ui_data_model.dart';
import 'package:widget_library/static_text/crayon_payment_text.dart';
import 'package:crayon_payment_customer/util/cross_fade.dart';

class CrayonSplashScreen extends StatefulWidget {
  static const viewPath = '${SplashModule.moduleIdentifier}/splash';
  final WelcomeScreenArgs welcomeScreenArgs;

  const CrayonSplashScreen({Key? key, required this.welcomeScreenArgs})
      : super(key: key);

  @override
  State<CrayonSplashScreen> createState() => _CrayonSplashScreenState();

  factory CrayonSplashScreen.forCustomerApp() => CrayonSplashScreen(
        welcomeScreenArgs: WelcomeScreenArgs(
          '',
          '',
          'Customer',
          false,
        ),
      );

  factory CrayonSplashScreen.forMerchantApp() => CrayonSplashScreen(
        welcomeScreenArgs: WelcomeScreenArgs('', '', 'Agent', false),
      );
}

class _CrayonSplashScreenState extends State<CrayonSplashScreen>
    with TickerProviderStateMixin {
  Animation? _containerRadiusAnimation,
      _containerSizeAnimation,
      _containerColorAnimation,
      _logoAnimation;
  AnimationController? _containerAnimationController, _logoAnimationController;
  SplashCoordinator? _splashCoordinator;
  bool? _isShow = false;
  bool isSigned = false;
  late final AnimationController _controller = AnimationController(
    duration: const Duration(seconds: 2),
    vsync: this,
  )..repeat(reverse: true);
  late final Animation<double> _animation = CurvedAnimation(
    parent: _controller,
    curve: Curves.easeIn,
  );

  @override
  void initState() {
    super.initState();
    _containerAnimationController = AnimationController(
        vsync: this, duration: Duration(milliseconds: 6000));

    _containerRadiusAnimation = BorderRadiusTween(
            begin: BorderRadius.circular(100.0),
            end: BorderRadius.circular(0.0))
        .animate(CurvedAnimation(
            curve: Curves.ease, parent: _containerAnimationController!));

    _containerSizeAnimation = Tween(begin: 0.0, end: 2.0).animate(
        CurvedAnimation(
            curve: Curves.ease, parent: _containerAnimationController!));

    _containerColorAnimation =
        ColorTween(begin: Color(0xFFC83732), end: Color(0xFFC83732)).animate(
            CurvedAnimation(
                curve: Curves.ease, parent: _containerAnimationController!));

    _containerAnimationController!.forward();
    _logoAnimationController =
        AnimationController(vsync: this, duration: Duration(seconds: 3));

    //Implement animation here
    _logoAnimation = Tween(
      begin: 1.0,
      end: 0.0,
    ).animate(_logoAnimationController!);

    _addListener();
  }

  @override
  Widget build(BuildContext context) =>
      BaseView<SplashCoordinator, SplashState>(
        setupViewModel: (coordinator) async {
          _splashCoordinator = coordinator;
          isSigned = await coordinator.isSignedin();
          coordinator.initialiseState(context, 'Title', '');
        },
        builder: (context, state, coordinator) => Scaffold(
          body: SafeArea(
            bottom: false,
            top: false,
            child: state.when(
              initialState: () => SizedBox(),
              ready: (
                _,
                __,
                ___,
              ) =>
                  _buildMainUIWithLoading(
                context,
                coordinator,
                (state as SplashScreenReady),
              ),
            ),
          ),
        ),
      );

  Widget _buildMainUIWithLoading(
    BuildContext context,
    SplashCoordinator coordinator,
    SplashScreenReady state,
  ) {
    return Stack(
      children: [
        _buildMainUI(context, coordinator, state),
        // if (state.isLoading) _createLoading(state),
      ],
    );
  }

  Widget _buildMainUI(
    BuildContext context,
    SplashCoordinator coordinator,
    SplashScreenReady state,
  ) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Center(
        child: AnimatedBuilder(
          animation: _containerAnimationController!,
          builder: (context, index) {
            return Container(
              width: _containerSizeAnimation!.value * height,
              height: _containerSizeAnimation!.value * height,
              decoration: BoxDecoration(
                  borderRadius: _containerRadiusAnimation!.value,
                  color: _containerColorAnimation!.value),
              child: Center(
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _isShow == false
                          ? SizedBox()
                          : Column(
                              children: [
                                _buildLogo(context),
                                const SizedBox(width: 0.0, height: 10.0),

                                // FadeTransition(
                                //     opacity: _animation,
                                //     child: Row(
                                //       mainAxisAlignment: MainAxisAlignment.center,
                                //       children: [
                                //         Text('SP_ni'.tr,
                                //           style: const TextStyle(
                                //               color: Colors.white,
                                //               fontSize: 32,
                                //               fontWeight: FontWeight.normal,
                                //               fontFamily: 'Montserrat',
                                //               fontStyle: FontStyle.italic),),
                                //         Text('SP_bora'.tr,
                                //           style: const TextStyle(
                                //               color: Colors.white,
                                //               fontSize: 32,
                                //               fontWeight: FontWeight.bold,
                                //               fontFamily: 'Montserrat',
                                //               fontStyle: FontStyle.italic),),
                                //       ],
                                //     )
                                // ),
                                CrossFade<String>(
                                  initialData: '1',
                                  data: "2",
                                  builder: (value) => value == '1'
                                      ? Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              'SP_ni'.tr,
                                              style: const TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 32,
                                                  fontWeight: FontWeight.normal,
                                                  fontFamily: 'Montserrat',
                                                  fontStyle: FontStyle.italic),
                                            ),
                                            Text(
                                              'SP_bora'.tr,
                                              style: const TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 32,
                                                  fontWeight: FontWeight.bold,
                                                  fontFamily: 'Montserrat',
                                                  fontStyle: FontStyle.italic),
                                            ),
                                          ],
                                        )
                                      : Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              'SP_is'.tr,
                                              style: const TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 32,
                                                  fontWeight: FontWeight.normal,
                                                  fontFamily: 'Montserrat',
                                                  fontStyle: FontStyle.italic),
                                            ),
                                            Text(
                                              'SP_better'.tr,
                                              style: const TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 32,
                                                  fontWeight: FontWeight.bold,
                                                  fontFamily: 'Montserrat',
                                                  fontStyle: FontStyle.italic),
                                            ),
                                          ],
                                        ),
                                ),
                                // Row(
                                //   mainAxisAlignment: MainAxisAlignment.center,
                                //
                                //   children: [
                                //
                                //     const SizedBox(width: 0.0, height: 10.0),
                                //
                                //
                                //     SizedBox(
                                //       child: AnimatedTextKit(
                                //         totalRepeatCount: 3,
                                //         animatedTexts: [
                                //           // FadeAnimatedText(
                                //           //   'SP_bora'.tr,
                                //           //   textStyle: const TextStyle(
                                //           //       color: Colors.white,
                                //           //       fontSize: 32,
                                //           //       fontWeight: FontWeight.bold,
                                //           //       fontFamily: 'Montserrat',
                                //           //       fontStyle: FontStyle.italic),
                                //           // ),
                                //           FadeAnimatedText(
                                //             'SP_isBetter'.tr,
                                //             textStyle: const TextStyle(
                                //                 color: Colors.white,
                                //                 fontSize: 32,
                                //                 fontWeight: FontWeight.bold,
                                //                 fontFamily: 'Montserrat',
                                //                 fontStyle: FontStyle.italic),
                                //           ),
                                //         ],
                                //         onTap: () {},
                                //       ),
                                //     ),
                                //   ],
                                // ),
                              ],
                            )
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  void _addListener() {
    _containerAnimationController!.addStatusListener((AnimationStatus status) {
      if (status == AnimationStatus.completed) {
        setState(() {
          _isShow = true;
        });

        _moveToDestinationPath();
      }
    });
  }

  void _moveToDestinationPath() {
    Future.delayed(const Duration(seconds: 8), () {
      _splashCoordinator!.navigateToDestinationPath(widget.welcomeScreenArgs.userType,isSigned);
    });
  }

  Widget _buildLogo(BuildContext context) {
    return Hero(
      tag: 'splashLogo',
      child: FadeTransition(
        opacity: AlwaysStoppedAnimation<double>(2),
        child: Image.asset(
          "assets/images/splashlogo.png",
          key: const Key('splashLogo'),
          scale: 3.0,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
