# iOS2FlutterPageRoute


## 使用

1. 导入`#import "iOS2FlutterPageRoute.h"`

2. 跳转Flutter页面
    * `iOS`端
        
        ```
        - (IBAction)pushFlutterView:(UIButton *)sender {
                [PushInAFlutterView pushInFlutterWithRoute:@"/saleorder" eventChannelName:@"sold_list" arguments:@{
                    @"token": @"传递的数据"
                }];
        }
        ```
    * `Flutter`端
        * 设置页面
        
            ```
              static Widget widgetForRoute(String route) {
                switch (route) {
                  case '/saleorder': // 我的销售订单
                    return SaleOrderPage();
                  default:
                    return MyHomePage();
                }
              }
            ```
        * `Flutter`页面代码
          
            ```
            class SaleOrderPageState extends State<SaleOrderPage> with WidgetsBindingObserver {
            
              /* 定义一个变量用来接受原生数据 */
              String token = "";
              /* 创建一个EventChannel通道 */
              static const EventChannel eventChannel = const EventChannel("sold_list");
              
              @override
              Widget build(BuildContext context) {
                return MaterialApp(
                  title: "我是Flutter页面",
                  home: Material(
                    child: Scaffold(
                      appBar: AppBar(
                        title: Text("我是Flutter页面"),
                        leading: InkWell(
                          // 返回按钮，返回到原生页面
                          onTap: () => Flutter2NativeRoute.flutter2native_channel.invokeMethod("closeFlutterPage"),
                          child: Icon(
                            Icons.arrow_back_ios,
                            color: Colors.white
                          ),
                        ),
                      ),
            
                      body: Center(
                        // 用来展示原生传递过来的数据
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              token,
                              style: TextStyle(
                                fontSize: 20.0,
                                color: Colors.deepOrange
                              ),
                            ),
                            RaisedButton(
                              child: Text("点我跳转原生页面"),
                              onPressed: () => Flutter2NativeRoute.flutter2native_channel.invokeMethod("openNativePage", {
                                "iosPageName": "RefundRecordViewController",
                                "result": "1"
                              }),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              }
              @override
              void initState() {
                // TODO: implement initState
                super.initState();
            
                // 在当前channel上添加监听方法
                eventChannel.receiveBroadcastStream(null).listen(_oneEvent, onError: _oneError);
                /* 添加观察者 */
                WidgetsBinding.instance.addObserver(this);
              }
            
              /* 监听来自原生的数据传递 */
              void _oneEvent(Object event) {
            
                Map dict = event as Map;
                token = dict["token"];
                setState(() {
                  // token = event.toString();
                });
              }
            
              void _oneError(Object error) {
            
              }
            
              @override
              void dispose() {
                // TODO: implement dispose
                super.dispose();
                // 销毁观察者
                WidgetsBinding.instance.removeObserver(this);
      }
    }
    ```


[![CI Status](https://img.shields.io/travis/onexf/iOS2FlutterPageRoute.svg?style=flat)](https://travis-ci.org/onexf/iOS2FlutterPageRoute)
[![Version](https://img.shields.io/cocoapods/v/iOS2FlutterPageRoute.svg?style=flat)](https://cocoapods.org/pods/iOS2FlutterPageRoute)
[![License](https://img.shields.io/cocoapods/l/iOS2FlutterPageRoute.svg?style=flat)](https://cocoapods.org/pods/iOS2FlutterPageRoute)
[![Platform](https://img.shields.io/cocoapods/p/iOS2FlutterPageRoute.svg?style=flat)](https://cocoapods.org/pods/iOS2FlutterPageRoute)

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Requirements

## Installation


## Author

onexf, 630850673@qq.com

## License

iOS2FlutterPageRoute is available under the MIT license. See the LICENSE file for more info.
