//
//  ViewController.h
//  calculator
//
//  Created by serge 徐 on 16/6/27.
//  Copyright © 2016年 serge xu. All rights reserved.
//

/*
 实例一个self的weak指针
 */
#define WEAK_SELF(weakSelf)  __weak __typeof(&*self)(weakSelf) = self;
#import <UIKit/UIKit.h>

@interface ViewController : UIViewController


@end

