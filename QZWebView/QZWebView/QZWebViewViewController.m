//
//  QZWebViewViewController.m
//  QZWebView
//
//  Created by 曲终叶落 on 2017/7/13.
//  Copyright © 2017年 曲终叶落. All rights reserved.
//

#import "QZWebViewViewController.h"
#import "QZWebView.h"

@interface QZWebViewViewController () <QZWebViewDelegate>

@property (nonatomic,  copy ) NSString *url;

@property (nonatomic, strong) QZWebView *webView;

@property (nonatomic,  copy ) NSString *filePath;

@property (nonatomic, strong) UIActivityIndicatorView *activityIndicatorView;

@end

@implementation QZWebViewViewController

#pragma mark - 初始化
- (instancetype)initWithURL:(NSString *)url{
    if (self = [super init]) {
        self.url = url;
    }
    return self;
}

- (instancetype)initWithFilePath:(NSString *)filePath{
    if (self = [super init]) {
        self.filePath = filePath;
    }
    return self;
}

#pragma mark -
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self webView];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - QZWebView代理
- (void)webViewTitle:(NSString *)title{
    self.title = title;
}

/**
 网页开始加载
 */
- (void)didStartProvisional{
    [self.activityIndicatorView startAnimating];
}

/**
 加载完成
 */
- (void)didFinish{
    [self.activityIndicatorView stopAnimating];
}

#pragma mark - get and set
- (QZWebView *)webView{
    
    if (!_webView) {
        
        if (self.url) {
            _webView = [[QZWebView alloc] initWithFrame:self.view.bounds url:self.url];
            [self.view addSubview:_webView];
        }else{
            _webView = [[QZWebView alloc] initWithFrame:self.view.bounds filePath:self.filePath];
            [self.view addSubview:_webView];
        }
        
        _webView.deleget = self;
        
    }
    return _webView;
}

- (UIActivityIndicatorView *)activityIndicatorView{
    if (!_activityIndicatorView) {
        _activityIndicatorView = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:(UIActivityIndicatorViewStyleWhiteLarge)];
        _activityIndicatorView.frame = CGRectMake(0, 0, 100, 100);
        _activityIndicatorView.center = CGPointMake(self.view.frame.size.width / 2, self.view.frame.size.height / 2);
        _activityIndicatorView.color = [UIColor grayColor];
        [self.view addSubview:_activityIndicatorView];
    }
    return _activityIndicatorView;
}

@end
