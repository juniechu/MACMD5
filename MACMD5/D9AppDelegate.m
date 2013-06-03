//
//  D9AppDelegate.m
//  MACMD5
//
//  Created by zhu junjie on 13-6-3.
//  Copyright (c) 2013年 zhu junjie. All rights reserved.
//

#import "D9AppDelegate.h"
#include "NSString+MD5Addition.h"

@implementation D9AppDelegate

- (void)dealloc
{
    [super dealloc];
}

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
    // Insert code here to initialize your application
//    NSString *inputStr = @"660908B123";
//    NSString *outputStr = [inputStr stringFromMD5];
//    NSLog(@"%@", outputStr);
    NSString *filePath = @"/Users/juniechu0618/Desktop/input";
//    NSError *error;
    NSString *tmp = [[NSString alloc] initWithContentsOfFile:filePath encoding:NSUTF8StringEncoding error:NULL];
    NSString *output;
    
    NSArray *numArr = [tmp componentsSeparatedByString:@"\n"];
    for (NSString *key in numArr) {
        output = [key stringFromMD5];
        NSLog(@"%@", output);
    }
}

@end
