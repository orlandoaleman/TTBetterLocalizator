//
//  Language.h
//  closett
//
//  Created by Orlando Aleman Ortiz on 26/04/14.
//  Copyright (c) 2014 Orlando Aleman Ortiz. All rights reserved.
//

#import <Foundation/Foundation.h>

#pragma mark - Helpers
#define BetterLocalizator     [TTBetterLocalizator sharedInstance]


@interface TTBetterLocalizator : NSObject
+ (instancetype)sharedInstance;
- (NSString *)localizedStringForKey:(NSString *)key alternative:(NSString *)alt;

@property (nonatomic) NSString *language;
@end
