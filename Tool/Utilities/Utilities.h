//
//  Utilities.h
//  Tool
//
//  Created by xiaerfei on 15/7/15.
//  Copyright (c) 2015年 RongYu100. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Utilities : NSObject

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
+ (UIImage *)originImage:(UIImage *)image scaleToSize:(CGSize)size;

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
+ (CGFloat)heightForString:(NSString *)text fontSize:(float)fontSize andWidth:(float)width;
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
+ (CGFloat)widthForString:(NSString *)text fontSize:(float)fontSize andHeight:(float)height;
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
+ (NSMutableAttributedString *)text:(NSString*)text leftPosition:(NSInteger)leftPos rightPosition:(NSInteger)rightPos color:(UIColor*)color font:(UIFont*)font;

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
+ (BOOL)deleteFileWithPath:(NSString *)path;



@end
