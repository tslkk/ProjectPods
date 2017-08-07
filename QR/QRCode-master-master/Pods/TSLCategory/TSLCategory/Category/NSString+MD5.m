//
//  NSString+MD5.m
//  WXArchitecture
//
//  Created by tangshilei on 16/8/11.
//  Copyright © 2016年 mc. All rights reserved.
//

#import "NSString+MD5.h"
#import <CommonCrypto/CommonDigest.h>
@implementation NSString (MD5)


// MD5大写
- (NSString *) MD5{
    const char * cStrValue = [self UTF8String];
    unsigned char theResult[CC_MD5_DIGEST_LENGTH];
    CC_MD5(cStrValue, (CC_LONG)strlen(cStrValue), theResult);
    return [NSString stringWithFormat:@"%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X",
            theResult[0], theResult[1], theResult[2], theResult[3],
            theResult[4], theResult[5], theResult[6], theResult[7],
            theResult[8], theResult[9], theResult[10], theResult[11],
            theResult[12], theResult[13], theResult[14], theResult[15]];
}

//小写的md5 
- (NSString * )md5{
    
    const char *cStr = [self UTF8String];
    unsigned char digest[CC_MD5_DIGEST_LENGTH];
    CC_MD5( cStr, (CC_LONG)self.length, digest );
    NSMutableString *result = [NSMutableString stringWithCapacity:CC_MD5_DIGEST_LENGTH * 2];
    for(int i = 0; i < CC_MD5_DIGEST_LENGTH; i++){
        [result appendFormat:@"%02x", digest[i]];
    }
    
    return result;
}

@end
