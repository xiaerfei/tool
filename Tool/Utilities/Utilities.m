//
//  Utilities.m
//  Tool
//
//  Created by xiaerfei on 15/7/15.
//  Copyright (c) 2015年 RongYu100. All rights reserved.
//

#import "Utilities.h"

@implementation Utilities
#pragma mark - 图片类操作
/**
 *   @author xiaerfei, 15-07-15 09:07:08
 *
 *   改变图片的尺寸
 *
 *   @param image 原图片
 *   @param size  所需要的图片尺寸
 *
 *   @return 返回对应尺寸的图片
 */
+ (UIImage *)originImage:(UIImage *)image scaleToSize:(CGSize)size
{
    UIGraphicsBeginImageContext(size);  //size 为CGSize类型，即你所需要的图片尺寸
    
    [image drawInRect:CGRectMake(0, 0, size.width, size.height)];
    
    UIImage* scaledImage = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    return scaledImage;   //返回的就是已经改变的图片
}

+ (UIImage *)imageWithImage:(UIImage *)image scaledToSize:(CGSize)newSize {
    //UIGraphicsBeginImageContext(newSize);
    UIGraphicsBeginImageContextWithOptions(newSize, NO, 0.0);
    [image drawInRect:CGRectMake(0, 0, newSize.width, newSize.height)];
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return newImage;
}
#pragma mark - 字符串类操作
/**
 *   @author xiaerfei, 15-07-15 09:07:39
 *
 *   返回定宽度字符串的高度
 *
 *   @param text     text
 *   @param fontSize fontSize
 *   @param width    width
 *
 *   @return height
 */
+ (CGFloat)heightForString:(NSString *)text fontSize:(float)fontSize andWidth:(float)width
{
    NSDictionary *attribute = @{NSFontAttributeName:[UIFont systemFontOfSize:fontSize]};
    
    CGSize retSize = [text boundingRectWithSize:CGSizeMake(width, CGFLOAT_MAX)
                                        options:
                      NSStringDrawingTruncatesLastVisibleLine |
                      NSStringDrawingUsesLineFragmentOrigin |
                      NSStringDrawingUsesFontLeading
                                     attributes:attribute
                                        context:nil].size;
    
    return retSize.height;
}
/**
 *   @author xiaerfei, 15-07-15 09:07:40
 *
 *   返回定高度字符串的宽度
 *
 *   @param text     text
 *   @param fontSize fontSize
 *   @param height   height
 *
 *   @return width
 */
+ (CGFloat)widthForString:(NSString *)text fontSize:(float)fontSize andHeight:(float)height
{
    NSDictionary *attribute = @{NSFontAttributeName:[UIFont systemFontOfSize:fontSize]};
    
    CGSize retSize = [text boundingRectWithSize:CGSizeMake(CGFLOAT_MAX,height)
                                        options:
                      NSStringDrawingTruncatesLastVisibleLine |
                      NSStringDrawingUsesLineFragmentOrigin |
                      NSStringDrawingUsesFontLeading
                                     attributes:attribute
                                        context:nil].size;
    
    return retSize.width;
}
/**
 *   @author xiaerfei, 15-07-15 10:07:15
 *
 *   修改特定位置字体的属性
 *
 *   @param text     text
 *   @param leftPos  leftPos
 *   @param rightPos rightPos
 *   @param color    color
 *   @param font     font
 *
 *   @return NSMutableAttributedString
 */
+ (NSMutableAttributedString *)text:(NSString*)text leftPosition:(NSInteger)leftPos rightPosition:(NSInteger)rightPos color:(UIColor*)color font:(UIFont*)font
{
    NSMutableAttributedString *attri= [[NSMutableAttributedString alloc] initWithString:text];
    [attri addAttribute:NSForegroundColorAttributeName value:color range:NSMakeRange(leftPos,rightPos)];
    [attri addAttribute:NSFontAttributeName value:font range:NSMakeRange(leftPos, rightPos)];
    return attri;
}

#pragma mark - 日期操作
+ (NSString *)getCurrentDate
{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    return [dateFormatter stringFromDate:[NSDate date]];
}

#pragma mark - 文件类操作
/**
 *   @author xiaerfei, 15-07-15 10:07:20
 *
 *   删除对应路径的文件
 *
 *   @param path path
 *
 *   @return YES：删除成功 NO：删除失败
 */
+ (BOOL)deleteFileWithPath:(NSString *)path
{
    NSFileManager *fileManager = [NSFileManager defaultManager];
    BOOL ret = [fileManager fileExistsAtPath:path];
    if (ret) {
        NSError *error = nil;
        if ([fileManager removeItemAtPath:path error:&error]) {
            return YES;
        }
    }
    return NO;
}

@end
