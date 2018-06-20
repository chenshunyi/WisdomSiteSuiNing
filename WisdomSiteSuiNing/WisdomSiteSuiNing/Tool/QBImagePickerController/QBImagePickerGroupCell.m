/*
 Copyright (c) 2013 Katsuma Tanaka
 
 Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:
 
 The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.
 
 THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
 */

#import "QBImagePickerGroupCell.h"

@interface QBImagePickerGroupCell()

@property (nonatomic, strong) UIView *downLine;

@end

@implementation QBImagePickerGroupCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    if(self) {
        /* Initialization */
        // Title
        UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0)];
        titleLabel.font = [UIFont boldSystemFontOfSize:17];
        titleLabel.textColor = UIColorFromRBGString(@"0x404040");
//        titleLabel.highlightedTextColor = [UIColor whiteColor];
        titleLabel.autoresizingMask = UIViewAutoresizingFlexibleRightMargin | UIViewAutoresizingFlexibleWidth;
        
        [self.contentView addSubview:titleLabel];
        self.titleLabel = titleLabel;
        
        // Count
        UILabel *countLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0)];
        countLabel.font = [UIFont systemFontOfSize:17];
        countLabel.textColor = UIColorFromRBGString(@"0x404040");
//        countLabel.highlightedTextColor = [UIColor whiteColor];
        countLabel.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin;
        
        [self.contentView addSubview:countLabel];
        self.countLabel = countLabel;
        
        _downLine = [ZHUtil createLineWithColor:UIColorFromRBGString(@"0xd9d9d9") widthOrHeight:ScreenWidth isHorizontal:YES];
        [self.contentView addSubview:_downLine];
    }
    
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];
    
//    self.titleLabel.highlighted = selected;
//    self.countLabel.highlighted = selected;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    self.imageView.frame = CGRectMake(13, 13, 70, 70);
    
    CGFloat height = self.contentView.bounds.size.height;
    CGFloat imageViewSize = height - 1;
    CGFloat width = self.contentView.bounds.size.width - 20;
    
    CGSize titleTextSize = [self.titleLabel.text sizeWithFont:self.titleLabel.font forWidth:width lineBreakMode:NSLineBreakByTruncatingTail];
    CGSize countTextSize = [self.countLabel.text sizeWithFont:self.countLabel.font forWidth:width lineBreakMode:NSLineBreakByTruncatingTail];
    
    CGRect titleLabelFrame;
    CGRect countLabelFrame;
    
    if((titleTextSize.width + countTextSize.width + 10) > width) {
        titleLabelFrame = CGRectMake(self.imageView.rightValue + 17, 0, width - countTextSize.width - 10, imageViewSize);
        countLabelFrame = CGRectMake(titleLabelFrame.origin.x + titleLabelFrame.size.width + 10, 0, countTextSize.width, imageViewSize);
    } else {
        titleLabelFrame = CGRectMake(self.imageView.rightValue + 17, 0, titleTextSize.width, imageViewSize);
        countLabelFrame = CGRectMake(titleLabelFrame.origin.x + titleLabelFrame.size.width + 10, 0, countTextSize.width, imageViewSize);
    }
    
    self.titleLabel.frame = titleLabelFrame;
    self.countLabel.frame = countLabelFrame;
    
    _downLine.topValue = self.heightValue - _downLine.heightValue;
}


@end
