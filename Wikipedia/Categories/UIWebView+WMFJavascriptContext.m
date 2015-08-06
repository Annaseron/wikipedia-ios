//  Created by Monte Hurd on 8/6/15.
//  Copyright (c) 2015 Wikimedia Foundation. Provided under MIT-style license; please copy and modify!

#import "UIWebView+WMFJavascriptContext.h"

@import JavaScriptCore;

static NSString* const WMFWebViewJavascriptContextPath = @"documentView.webView.mainFrame.javaScriptContext";

@implementation UIWebView (WMFJavascriptContext)

- (JSContext*)wmf_javascriptContext {
    JSContext* context = [self valueForKeyPath:WMFWebViewJavascriptContextPath];
    NSAssert([context isKindOfClass:[JSContext class]], @"No javascript context found for webView!");
    return context;
}

- (NSArray*)wmf_getArrayFromJavascriptFunctionNamed:(NSString*)name withArguments:(NSArray*)arguments {
    return [[[self wmf_javascriptContext][name] callWithArguments:arguments] toArray];
}

@end
