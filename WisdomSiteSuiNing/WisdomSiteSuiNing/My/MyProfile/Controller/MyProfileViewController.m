

//
//  MyProfileViewController.m
//  WisdomSiteSuiNing
//
//  Created by 董亚杰 on 2018/6/22.
//  Copyright © 2018年 dyj. All rights reserved.
//

#import "MyProfileViewController.h"
#import "HeadTableViewCell.h"
#import "InformationTableViewCell.h"

@interface MyProfileViewController ()<UITableViewDelegate,UITableViewDataSource,UINavigationControllerDelegate>

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property(nonatomic,strong)NSMutableArray *dataArr;

@end

@implementation MyProfileViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.title=@"我的资料";
    self.tableView.delegate=self;
    self.tableView.dataSource=self;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    NSArray*array=@[@{@"title":@"姓名:",@"type":@"0"},
                    @{@"title":@"性别:",@"type":@"1"},
                    @{@"title":@"年龄:",@"type":@"2"},
                    @{@"title":@"电话:",@"type":@"3"},
                    @{@"title":@"身份证:",@"type":@"4"},
                    @{@"title":@"地址:",@"type":@"5"},
                    ];
    [self.dataArr addObjectsFromArray:array];
    
    [self registerNotification];//注册键盘通知
}
-(void)registerNotification{
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(keyboardWillShow:) name:UIKeyboardWillShowNotification object:nil];
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(keyboardWillHide:) name:UIKeyboardWillHideNotification object:nil];
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 2;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (section==0) {
        return 1;
    }else{
        return self.dataArr.count;
    }
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section==0) {
        return 160;
    }
    return 46;
}
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section==0) {
        HeadTableViewCell*cell = [tableView dequeueReusableCellWithIdentifier:@"HeadTableViewCell"];
        if (!cell) {
            cell = [[NSBundle mainBundle]loadNibNamed:@"HeadTableViewCell" owner:nil options:nil].firstObject;
        }
        cell.selectionStyle=UITableViewCellSelectionStyleNone;
        [cell reloadCelldata:indexPath];
        return cell;
    }else{
        InformationTableViewCell*cell = [tableView dequeueReusableCellWithIdentifier:@"InformationTableViewCell"];
        if (!cell) {
            cell = [[NSBundle mainBundle]loadNibNamed:@"InformationTableViewCell" owner:nil options:nil].firstObject;
        }
        NSDictionary*dic=[self.dataArr objectAtSafeIndex:indexPath.row];
        [cell reloadCelldata:dic WithTitle:nil WithIndexPath:indexPath];
        cell.selectionStyle=UITableViewCellSelectionStyleNone;
        return cell;
    }

}
#pragma mark keyboard
- (void)keyboardWillShow:(NSNotification *)notification{
    NSDictionary*info=[notification userInfo];
    CGSize keyboardSize=[[info objectForKey:UIKeyboardFrameEndUserInfoKey] CGRectValue].size;
    self.tableView.contentInset= UIEdgeInsetsMake(0,0, keyboardSize.height,0);
}
-(void)keyboardWillHide:(NSNotification*)notification{
    self.tableView.contentInset= UIEdgeInsetsZero;
}
-(NSMutableArray *)dataArr{
    if (!_dataArr) {
        _dataArr = [NSMutableArray array];
    }
    return _dataArr;
}

- (IBAction)buttonAction:(UIButton *)sender {
    [self.tableView endEditing:YES];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
