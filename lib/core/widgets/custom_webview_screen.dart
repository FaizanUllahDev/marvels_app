import 'package:flutter/material.dart';
import 'package:test_app_marvels/core/utils/constants.dart';
import 'package:test_app_marvels/core/utils/utils.dart';
import 'package:test_app_marvels/core/widgets/common_alerts.dart';
import 'package:webview_flutter/webview_flutter.dart';

class CustomWebviewScreen extends StatefulWidget {
  const CustomWebviewScreen({super.key, required this.url});

  final String url;

  @override
  State<CustomWebviewScreen> createState() => _CustomWebviewScreenState();
}

class _CustomWebviewScreenState extends State<CustomWebviewScreen> {
  late final WebViewController webController;
  double progress = 0.5;
  String str = '';
  final subSetState = GlobalKey();
  @override
  void initState() {
    webController = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(kBackgroundColor)
      ..loadRequest(Uri.parse(widget.url))
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {
            this.progress = (progress / 100.0);
            Utils.debug("Progress: $progress");
            subSetState.currentState?.setState(() {});
          },
          onPageStarted: (String url) {
            // CommonAlerts.showToast('Loading: $url');
          },
          onPageFinished: (String url) {
            // CommonAlerts.showToast('Loaded: $url');
          },
          onHttpError: (HttpResponseError error) {
            CommonAlerts.showToast(error.response.toString());
          },
          onWebResourceError: (WebResourceError error) {
            CommonAlerts.showToast(error.description.toString());
            str = error.description;
            subSetState.currentState?.setState(() {});
          },
        ),
      );
    Utils.debug("Init state: ${widget.url}");
    super.initState();
  }

  @override
  Widget build(BuildContext context) => Material(
        child: SafeArea(
          child: Scaffold(
            appBar: AppBar(
              title: const Text("Web Portal"),
              bottom: PreferredSize(
                preferredSize: const Size.fromHeight(2),
                child: StatefulBuilder(
                  key: subSetState,
                  builder: (c, subState) {
                    if (str.isNotEmpty) {
                      return Center(
                        child: Padding(
                          padding: kAPadding12,
                          child: Text(
                            str,
                            maxLines: 2,
                            textAlign: TextAlign.center,
                          ),
                        ),
                      );
                    }

                    return Align(
                      alignment: Alignment.topCenter,
                      child: LinearProgressIndicator(
                        value: progress,
                        valueColor: const AlwaysStoppedAnimation(kPrimaryBlue),
                        backgroundColor: kLighterGray,
                        color: kPrimaryBlue,
                      ),
                    );
                  },
                ),
              ),
            ),
            body: WebViewWidget(controller: webController),
          ),
        ),
      );
}
