//
//  MyViewController.m
//  WisdomSiteSuiNing
//
//  Created by 董亚杰 on 2018/6/20.
//  Copyright © 2018年 dyj. All rights reserved.
//

#import "MyViewController.h"
#import "PersonTableViewCell.h"
#import "CategoryTableViewCell.h"
#import "MyProfileViewController.h"
#import "IntroduceViewController.h"
#import "LoginViewController.h"

@interface MyViewController ()<UITableViewDelegate,UITableViewDataSource>{
    
}

@property (strong, nonatomic) IBOutlet UITableView *tableView;
@property(nonatomic,strong)NSMutableArray *dataArr;

@end

@implementation MyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    self.title=@"个人";
     [self setNavBackButton:@"green_contruction.png"];
    
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tableView.delegate=self;
    self.tableView.dataSource=self;
    
    
    NSArray *array = @[@[@{@"title":@"我的资料",@"pic":@"my_material.png",@"type":@"0"},
                         @{@"title":@"我的会议",@"pic":@"my_meeting.png",@"type":@"20"}],
                       @[
                           @{@"title":@"系统介绍",@"pic":@"my_sys_introduce.png",@"type":@"10"}],
                       @[@{@"title":@"退出登录",@"pic":@"my_quit.png",@"type":@"0"}]
                       ];
    [self.dataArr addObjectsFromArray:array];
    
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return self.dataArr.count+1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (section==0) {
        return 1;
    }else{
        NSArray *sectionArr = [self.dataArr objectAtSafeIndex:section-1];
        return sectionArr.count;
    }
    return 10;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row==0&&indexPath.section==0) {
        return 115;
    }
    return 38.5;
}
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section==0) {
        PersonTableViewCell*cell = [tableView dequeueReusableCellWithIdentifier:@"PersonTableViewCell"];
        if (!cell) {
            cell = [[NSBundle mainBundle]loadNibNamed:@"PersonTableViewCell" owner:nil options:nil].firstObject;
        }
        cell.selectionStyle=UITableViewCellSelectionStyleNone;
        [cell reloadCelldata:nil];
        return cell;
    }else{
        CategoryTableViewCell*cell = [tableView dequeueReusableCellWithIdentifier:@"CategoryTableViewCell"];
        if (!cell) {
            cell = [[NSBundle mainBundle]loadNibNamed:@"CategoryTableViewCell" owner:nil options:nil].firstObject;
        }
        cell.selectionStyle=UITableViewCellSelectionStyleNone;
        NSArray *sectionArr = [self.dataArr objectAtSafeIndex:indexPath.section-1];
        NSDictionary *dic = [sectionArr objectAtSafeIndex:indexPath.row];
        [cell reloadCellData:dic];
        
        return cell;
    }
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section>0) {
         NSArray *sectionArr = [self.dataArr objectAtSafeIndex:indexPath.section-1];
        NSDictionary*dic=[sectionArr objectAtSafeIndex:indexPath.row];
        switch (indexPath.section) {
            case 1:{
                switch ([[dic objectForKey:@"type"] integerValue]) {
                    case 0:{//我的资料
                        MyProfileViewController*myProVC=[[MyProfileViewController alloc]init];
                        myProVC.hidesBottomBarWhenPushed=YES;
                        [self.navigationController pushViewController:myProVC animated:YES];
                    }
                        break;
                    case 20:{//我的会议
//                        MeetingViewController*meetingVC=[[MeetingViewController alloc]init];
//                        meetingVC.hidesBottomBarWhenPushed=YES;
//                        [self.navigationController pushViewController:meetingVC animated:YES];
                    }
                        break;
                        
                    default:
                        break;
                }
            }
                break;
            case 2:{
                switch ([[dic objectForKey:@"type"] integerValue]) {
                    case 10:{//系统介绍
                        IntroduceViewController*introduceVC=[[IntroduceViewController alloc]init];
                        introduceVC.hidesBottomBarWhenPushed=YES;
                        [self.navigationController pushViewController:introduceVC animated:YES];
                    }
                        break;
                        
                    default:
                        break;
                }
                
            }
                break;
            case 3:{
                switch ([[dic objectForKey:@"type"] integerValue]) {
                    case 0:{//退出登录
                        UIAlertController*alertController=[UIAlertController alertControllerWithTitle:@"提示" message:@"退出登录" preferredStyle:UIAlertControllerStyleAlert];//提示视图在中央
                        UIAlertAction*cancelAction=[UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil];
                       UIAlertAction*okAction=[UIAlertAction actionWithTitle:@"确认" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
                            NSUserDefaults*defatluts=[NSUserDefaults standardUserDefaults];
                            //移除NSUserDefaults中所有的数据
                            NSDictionary*dictionary=[defatluts dictionaryRepresentation];
                            for (NSString*key in [dictionary allKeys]) {
                                [defatluts removeObjectForKey:key];
                                [defatluts synchronize];
                            }
                            LoginViewController*loginVC=[[LoginViewController alloc]init];
                            loginVC.hidesBottomBarWhenPushed=YES;
                            [self.navigationController pushViewController:loginVC animated:YES];
                        }];
                        [alertController addAction:cancelAction];
                        [alertController addAction:okAction];
                        [self presentViewController:alertController animated:YES completion:nil];
                    }
                        break;
                        
                    default:
                        break;
                }
            }
                break;
                
            default:
                break;
        }
        
    }
}

//区头
-(UIView*)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    
    UITableViewHeaderFooterView*view=[tableView dequeueReusableHeaderFooterViewWithIdentifier:@"headView"];
    if (!view) {
        view=[[UITableViewHeaderFooterView alloc]initWithReuseIdentifier:@"headView"];
    }
    return view;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    if (section>0) {
        return 8.5;
    }
    return 0;
}


-(NSMutableArray *)dataArr{
    if (!_dataArr) {
        _dataArr = [NSMutableArray array];
    }
    return _dataArr;
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
