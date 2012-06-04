//
//  HappinesViewController.h
//  Happines
//
//  Created by Антон Помозов on 01.06.12.
//  Copyright (c) 2012 Штрих-М. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SplitViewBarButtonItemPresenter.h"

@interface HappinesViewController : UIViewController <SplitViewBarButtonItemPresenter>

@property (nonatomic) int happines; // 0 is sad, 100 is very happy

@end
