//
//  XLCollectionViewCell.m
//  两级联动
//
//  Created by Jason on 15/8/23.
//  Copyright (c) 2015年 Jason. All rights reserved.
//

#import "XLCollectionViewCell.h"

@interface XLCollectionViewCell ()
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@end

@implementation XLCollectionViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setTitle:(NSString *)title {
    _title = title;
    self.titleLabel.text = title;
}

@end
