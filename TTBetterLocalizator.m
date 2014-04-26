//
//  Language.m
//  closett
//
//  Created by Orlando Aleman Ortiz on 26/04/14.
//  Copyright (c) 2014 Orlando Aleman Ortiz. All rights reserved.
//

#import "TTBetterLocalizator.h"

@interface TTBetterLocalizator()
@property (nonatomic) NSBundle *bundle;
@end


@implementation TTBetterLocalizator

@synthesize language = _language;



+ (instancetype)sharedInstance
{
    static dispatch_once_t pred = 0;
    __strong static id _sharedObject = nil;

    dispatch_once(&pred, ^{
        _sharedObject = [[self alloc] init];
    });
    return _sharedObject;
}

- (NSBundle *)bundle
{
    if (!_bundle) {
        NSString *path = [[NSBundle mainBundle] pathForResource:self.language
                                                         ofType:@"lproj"];
        _bundle = [NSBundle bundleWithPath:path];
    }
    return _bundle;
}


- (NSString *)language
{
    if (!_language) {
        NSArray *languages = [NSLocale preferredLanguages];
        if (languages.count > 0) { _language = languages[0]; }
    }
    return _language;
}


- (void)setLanguage:(NSString *)language
{
    self.bundle = nil;
    _language = language;
}


- (NSString *)localizedStringForKey:(NSString *)key alternative:(NSString *)alt
{
    NSBundle *bundle = self.bundle;
    if (!bundle) return key;
    return [bundle localizedStringForKey:key value:alt table:nil];
}


@end