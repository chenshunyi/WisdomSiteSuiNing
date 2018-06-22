//
//  InformationTableViewCell.m
//  WisdomSite
//
//  Created by 董亚杰 on 2018/5/10.
//  Copyright © 2018年 董亚杰. All rights reserved.
//

#import "InformationTableViewCell.h"

@interface InformationTableViewCell()<UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UILabel *typeLabel;
@property (weak, nonatomic) IBOutlet UITextField *typeField;
@property(nonatomic,strong)NSDictionary*dic;
@property(nonatomic,strong)NSIndexPath*indexPath;
@end

@implementation InformationTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

-(void)reloadCelldata:(id)data WithTitle:(NSString*)titleStr WithIndexPath:(NSIndexPath*)indexPath{
    self.indexPath=indexPath;
    self.dic=(NSDictionary*)data;
    self.typeLabel.text=[self.dic objectForKey:@"title"];
    
//    self.typeField.text=_titleStr;
    self.typeField.delegate=self;
    NSString *title = @"请输入信息";
    self.typeField.userInteractionEnabled = YES;//是否可以编辑
    switch ([[_dic objectForKey:@"type"] integerValue]) {
        case 0:{
            title=@"请输入姓名";
            self.typeField.userInteractionEnabled = NO;
        }
            break;
        case 1:{
            title=@"请输入性别男/女";
            self.typeField.userInteractionEnabled = NO;
        }
            break;
        case 2:{
            title=@"请输入年龄";
            self.typeField.userInteractionEnabled = NO;
        }
            break;
        case 3:{
            title=@"请输入电话";
        }
            break;
        case 4:{
            title=@"请输入身份证号";
            self.typeField.userInteractionEnabled = NO;
        }
            break;
        case 5:{
            title=@"请输入地址";
        }
            break;
            
        default:
            break;
    }
    self.typeField.placeholder = title;
    
}
//吊起键盘,改变cell的高度
- (void)textFieldDidBeginEditing:(UITextField *)textField{
    if (self.textFieldDidBeginEditingBLock) {
        self.textFieldDidBeginEditingBLock(self.indexPath);
    }
}
-(void)textFieldDidEndEditing:(UITextField *)textField{//结束编辑的时候  把输入的数据放到试图控制器中的字典中
    if (self.textFieldDidEndEditingBLock) {
        self.textFieldDidEndEditingBLock(self.indexPath, textField.text);
    }
    
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
