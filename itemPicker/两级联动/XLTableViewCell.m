//
//  XLTableViewCell.m
//  两级联动
//
//  Created by Jason on 15/8/23.
//  Copyright (c) 2015年 Jason. All rights reserved.
//

#import "XLTableViewCell.h"

@interface XLTableViewCell ()
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@end

@implementation XLTableViewCell {
    UIView *_bgView;
    UIView *_bgRedView;
}

- (void)awakeFromNib {
    // Initialization code
    _bgView = [[UIView alloc] init];
    _bgView.backgroundColor = [UIColor groupTableViewBackgroundColor];
    _bgRedView = [[UIView alloc] init];
    _bgRedView.backgroundColor = [UIColor redColor];
    [_bgView addSubview:_bgRedView];
    self.selectedBackgroundView = _bgView;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    _bgRedView.frame = CGRectMake(0, 0, 3, CGRectGetHeight(_bgView.frame));
//    NSLog(@"%@",NSStringFromCGRect(_bgView.frame));
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)setTitle:(NSString *)title {
    _title = title;
    self.titleLabel.text = title;
}

@end
