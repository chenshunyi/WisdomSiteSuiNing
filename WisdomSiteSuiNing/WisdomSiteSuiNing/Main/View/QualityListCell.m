//
//  QualityListCell.m
//  WisdomSite
//
//  Created by chenshunyi on 2018/5/9.
//  Copyright © 2018年 董亚杰. All rights reserved.
//

#import "QualityListCell.h"
#import "QualityListModel.h"

@interface QualityListCell (){
    
    QualityListModel  *_qlistModel;
    NSString        *_confromTimespStr;
}

@property (strong, nonatomic) IBOutlet UIView *bgView;
@property (strong, nonatomic) IBOutlet UILabel *bgLabel;//发起人
@property (strong, nonatomic) IBOutlet UILabel *zerenLabel;//责任人
@property (strong, nonatomic) IBOutlet UILabel *faqiLabel;//发起人
@property (strong, nonatomic) IBOutlet UILabel *zhenggaiLabel;//整改结构
@property (strong, nonatomic) IBOutlet UILabel *timeLabel;//发布日期
@property (strong, nonatomic) IBOutlet UILabel *dateLineLabel;//整改期限
@property (strong, nonatomic) IBOutlet UILabel *statelabel;//状态   未整改 待审核 已整改


@end


@implementation QualityListCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    
}
-(void)reloadCellData:(id)cellData{
    
    self.zerenLabel.font=[UIFont systemFontOfSize:kTFStandardFontBy375(14)];
    self.faqiLabel.font=[UIFont systemFontOfSize:kTFStandardFontBy375(14)];
    self.zhenggaiLabel.font=[UIFont systemFontOfSize:kTFStandardFontBy375(14)];
    self.timeLabel.font=[UIFont systemFontOfSize:kTFStandardFontBy375(14)];
    self.dateLineLabel.font=[UIFont systemFontOfSize:kTFStandardFontBy375(14)];
    self.statelabel.font=[UIFont systemFontOfSize:kTFStandardFontBy375(13)];
    

    self.bgLabel.layer.borderColor = UIColorFromRGB(0xd9d9d9).CGColor;
    self.bgLabel.layer.borderWidth = 1;
//    self.bgLabel.layer.shadowOffset = CGSizeMake(0, 0);
//    self.bgLabel.layer.shadowColor = UIColorFromRGB(0x626262).CGColor;
//    self.bgLabel.layer.shadowRadius = 4;
//    self.bgLabel.layer.shadowOpacity = 0.4;
    self.bgLabel.layer.shouldRasterize = YES;//缓存layer   不是每次都重新画取
    
    _qlistModel=(QualityListModel*)cellData;
    
    if ([CustomString isNotEmptyString:_qlistModel.zid_user.tit]) {
       self.zerenLabel.text = [NSString stringWithFormat:@"责任人:%@",_qlistModel.zid_user.tit];
    } else {
        self.zerenLabel.text =@"责任人:";
    }
    
    if ([CustomString isNotEmptyString:_qlistModel.aid_user.tit]) {
        self.faqiLabel.text = [NSString stringWithFormat:@"发起人:%@",_qlistModel.aid_user.tit];
    } else {
         self.faqiLabel.text =@"发起人:";
    }
    
    if ([CustomString isNotEmptyString:_qlistModel.dte]) {
        [self time];
       self.timeLabel.text =[NSString stringWithFormat:@"发布日期:%@",_confromTimespStr];
    } else {
        self.timeLabel.text =@"发布日期:";
    }
        
    
    
    self.zhenggaiLabel.text = [NSString stringWithFormat:@"整改部位:%@",_qlistModel.ptn];
    
    
    
    
    self.dateLineLabel.text = [NSString stringWithFormat:@"整改期限:%@天",_qlistModel.zgq];
    self.statelabel.layer.borderColor=(__bridge CGColorRef _Nullable)([UIColor redColor]);
    
    self.statelabel.layer.cornerRadius=4;//设置圆角大小
    self.statelabel.layer.masksToBounds=YES;
        switch ([(_qlistModel.ste)integerValue]) {
            case 0:
                self.statelabel.text = @"未整改";
//                self.statelabel.textColor = UIColorFromRGB(0xcc4400);
                self.statelabel.textColor = UIColorFromRGB(0xcc4400);
                self.statelabel.layer.borderColor= [UIColorFromRGB(0xcc4400) CGColor];
                self.statelabel.layer.borderWidth=1;//边框的宽度
                break;
            case 1:
                self.statelabel.text = @"不通过";
                self.statelabel.textColor = UIColorFromRGB(0x77b200);
                self.statelabel.layer.borderColor= [UIColorFromRGB(0x77b200) CGColor];
                self.statelabel.layer.borderWidth=1;//边框的宽度
                break;
            case 2:
                self.statelabel.text = @"已整改";
                self.statelabel.textColor = UIColorFromRGB(0x3cb200);
                self.statelabel.layer.borderColor= [UIColorFromRGB(0x3cb200) CGColor];
                self.statelabel.layer.borderWidth=1;//边框的宽度
                break;
            case 3:
                self.statelabel.text = @"审核不通过";
                self.statelabel.textColor = UIColorFromRGB(0x77b200);
                self.statelabel.layer.borderColor= [UIColorFromRGB(0x77b200) CGColor];
                self.statelabel.layer.borderWidth=1;//边框的宽度
                break;
            case 4:
                self.statelabel.text = @"审核通过";
                self.statelabel.textColor = UIColorFromRGB(0x3cb200);
                self.statelabel.layer.borderColor= [UIColorFromRGB(0x3cb200) CGColor];
                self.statelabel.layer.borderWidth=1;//边框的宽度
                break;
                
            default:
//                self.statelabel.text = @"未整改";
//                self.statelabel.textColor = [UIColor blackColor];
//                self.statelabel.layer.borderColor= [[UIColor blackColor] CGColor];
//                self.statelabel.layer.borderWidth=1;//边框的宽度
                break;
        }
    
    
    
}
-(void)time{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateStyle:NSDateFormatterMediumStyle];
    [formatter setTimeStyle:NSDateFormatterShortStyle];
    [formatter setDateFormat:@"YYYY-MM-dd HH:mm:ss"]; // ----------设置你想要的格式,hh与HH的区别:分别表示12小时制,24小时制
    
    //设置时区,这个对于时间的处理有时很重要
    //例如你在国内发布信息,用户在国外的另一个时区,你想让用户看到正确的发布时间就得注意时区设置,时间的换算.
    //例如你发布的时间为2010-01-26 17:40:50,那么在英国爱尔兰那边用户看到的时间应该是多少呢?
    //他们与我们有7个小时的时差,所以他们那还没到这个时间呢...那就是把未来的事做了
    
    NSTimeZone* timeZone = [NSTimeZone timeZoneWithName:@"Asia/Shanghai"];
    [formatter setTimeZone:timeZone];
    NSDate *datenow = [NSDate date];//现在时间,你可以输出来看下是什么格式
    NSString *nowtimeStr = [formatter stringFromDate:datenow];//----------将nsdate按formatter格式转成nsstring
    NSDate *dateNow2 = [formatter dateFromString:nowtimeStr];
    
    NSDate *confromTimesp = [NSDate dateWithTimeIntervalSince1970:[[NSString stringWithFormat:@"%@",_qlistModel.dte]integerValue]];
//    NSLog(@"1296035591  = %@",confromTimesp);
    _confromTimespStr = [formatter stringFromDate:confromTimesp];
//    NSLog(@"confromTimespStr =  %@",_confromTimespStr);
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
