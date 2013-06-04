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
    NSString *filePath = @"/Users/juniechu/Desktop/ad_stat_1370230071.1370230071";

    NSString *tmp = [[NSString alloc] initWithContentsOfFile:filePath encoding:NSUTF8StringEncoding error:NULL];
    NSString *output;
    
    NSFileHandle *outfile = [NSFileHandle fileHandleForUpdatingAtPath:@"/Users/juniechu/Desktop/output"];
    
    NSArray *numArr = [tmp componentsSeparatedByString:@"\n"];
    
    for (NSString *key in numArr) {
        if ([key length] < 2 || [[key substringToIndex:1] isEqualToString:@"<"] || [[key substringToIndex:1] isEqualToString:@" "]) {
            continue;
        }
        if ([[key substringToIndex:4] isEqualToString:@"2013"]) {
            if ([key length] == 27) {
                key = [key substringWithRange:NSMakeRange(15, 12)];
                NSLog(@"%@", key);
                output = [key stringFromMD5];
                output = [NSString stringWithFormat:@"%@\n",output];
                [outfile seekToEndOfFile];
                [outfile writeData:[output dataUsingEncoding:NSUTF8StringEncoding]];
                
            } else {
                continue;
            }
        }
    }
    [outfile closeFile];
}

@end
