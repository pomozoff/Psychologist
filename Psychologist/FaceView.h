//
//  FaceView.h
//  Happines
//
//  Created by Антон Помозов on 01.06.12.
//  Copyright (c) 2012 Штрих-М. All rights reserved.
//

#import <UIKit/UIKit.h>

@class FaceView;

@protocol FaceViewDataSource <NSObject>

- (float)smileForFaceView:(FaceView *)sender;

@end

@interface FaceView : UIView

@property (nonatomic) CGFloat scale;

- (void)pinch:(UIPinchGestureRecognizer *)recognizer;

@property (nonatomic, weak) IBOutlet id <FaceViewDataSource> dataSource;

@end
