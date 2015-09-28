//
//  KCMainTableViewController.m
//  MyTableViewDemo
//
//  Created by Gao on 15/9/24.
//  Copyright (c) 2015年 Gao. All rights reserved.
//

#import "KCMainTableViewController.h"
#import "KCContact.h"
#import "KCContactGroup.h"
#import "KCCell.h"

@interface KCMainTableViewController ()
{
    UITableView *_tableView;
    NSMutableArray *_contacts;
    NSMutableArray *imageArr;
    NSIndexPath *_indexPath ;
}

@end

@implementation KCMainTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIImage *itemImg = nil;
    imageArr = [NSMutableArray array];
    
    for (int index = 1; index <= 7; index++) {
        NSString *fileName = [NSString stringWithFormat:@"pic%d.jpg",index];
        itemImg = [UIImage imageNamed:fileName];
        [imageArr addObject:itemImg];
    }
    NSLog(@"图片的内容大小=%d",[imageArr count]);
    
    
    [self initData];
    
    _tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStyleGrouped ];
    _tableView.dataSource = self;
    _tableView.delegate = self;
    _tableView.bounces = NO;
    
    //    [self.view addSubview:_tableView];
    self.view = _tableView;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void) initData
{
    _contacts = [[NSMutableArray alloc] init];
    
    KCContact *contact1 = [KCContact initWithFirstName:@"Cui" AndLastName:@"KenShin" AndPhoneNumber:@"1123456"];
    KCContact *contact2 = [KCContact initWithFirstName:@"Cui" AndLastName:@"Tom" AndPhoneNumber:@"23232323"];
    KCContactGroup *group1 = [KCContactGroup initWithName:@"C" AndDetail:@"with names begin with C" AndContacts:[NSMutableArray arrayWithObjects:contact1,contact2, nil]];
    [_contacts addObject:group1];
    
    KCContact *contact3 = [KCContact initWithFirstName:@"Lee" AndLastName:@"Terr" AndPhoneNumber:@"233"];
    KCContact *contact4 = [KCContact initWithFirstName:@"Lee" AndLastName:@"Jack" AndPhoneNumber:@"4343"];
    KCContact *contact5 = [KCContact initWithFirstName:@"Lee" AndLastName:@"Rose" AndPhoneNumber:@"434343"];
    KCContactGroup *group2 = [KCContactGroup initWithName:@"L" AndDetail:@"with names begin with L" AndContacts:[NSMutableArray arrayWithObjects:contact3,contact4,contact5, nil]];
    [_contacts addObject:group2];
    
    
    KCContact *contact6 = [KCContact initWithFirstName:@"Sun" AndLastName:@"Kaoru" AndPhoneNumber:@"4343"];
    KCContact *contact7 = [KCContact initWithFirstName:@"Sun" AndLastName:@"Rosa" AndPhoneNumber:@"8980"];
    KCContactGroup *group3 = [KCContactGroup initWithName:@"S" AndDetail:@"with names begin with S" AndContacts:[NSMutableArray arrayWithObjects:contact6,contact7,nil]];
    [_contacts addObject:group3];
    
    KCContact *contact8=[KCContact initWithFirstName:@"Wang" AndLastName:@"Stephone" AndPhoneNumber:@"18500131241"];
    KCContact *contact9=[KCContact initWithFirstName:@"Wang" AndLastName:@"Lucy" AndPhoneNumber:@"18500131242"];
    KCContact *contact10=[KCContact initWithFirstName:@"Wang" AndLastName:@"Lily" AndPhoneNumber:@"18500131243"];
    KCContact *contact11=[KCContact initWithFirstName:@"Wang" AndLastName:@"Emily" AndPhoneNumber:@"18500131244"];
    KCContact *contact12=[KCContact initWithFirstName:@"Wang" AndLastName:@"Andy" AndPhoneNumber:@"18500131245"];
    KCContactGroup *group4=[KCContactGroup initWithName:@"W" AndDetail:@"With names beginning with W" AndContacts:[NSMutableArray arrayWithObjects:contact8,contact9,contact10,contact11,contact12, nil]];
    [_contacts addObject:group4];
    
    KCContact *contact13=[KCContact initWithFirstName:@"Zhang" AndLastName:@"Joy" AndPhoneNumber:@"18500131246"];
    KCContact *contact14=[KCContact initWithFirstName:@"Zhang" AndLastName:@"Vivan" AndPhoneNumber:@"18500131247"];
    KCContact *contact15=[KCContact initWithFirstName:@"Zhang" AndLastName:@"Joyse" AndPhoneNumber:@"18500131248"];
    KCContactGroup *group5=[KCContactGroup initWithName:@"Z" AndDetail:@"With names beginning with Z" AndContacts:[NSMutableArray arrayWithObjects:contact13,contact14,contact15, nil]];
    [_contacts addObject:group5];
    
}



#pragma mark - Table view data source

#pragma mark - 数据源方法
#pragma mark - 返回分组数
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    //    NSLog(@"计算分组数");
    return [_contacts count];
}

#pragma mark - 返回每组行数
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    //    NSLog(@"计算每组（组：%d）行数",section);
    KCContactGroup *group = [_contacts objectAtIndex:section];
    return group.contacts.count;
}


#pragma mark - 返回每行的单元格

/*
 在UITableView内部有一个缓存池，初始化时使用initWithStyle:(UITableViewCellStyle) reuseIdentifier:(NSString *)方法指定一个可重用标识，就可以将这个cell放到缓存池。然后在使用时使用指定的标识去缓存池中取得对应的cell然后修改cell内容即可。
 
 方法调用很频繁，无论是初始化、上下滚动、刷新都会调用此方法，所有在这里执行的操作一定要注意性能；
 可重用标识可以有多个，如果在UITableView中有多类结构不同的Cell，可以通过这个标识进行缓存和重新；
 
 */
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *reuseIdentifier = @"KCCell";
    //    KCCell *cell = [[KCCell alloc] init];
    
    
    //    NSLog(@"生成单元格(组：%d,行：%d)",indexPath.section,indexPath.row);
    KCContactGroup *group = _contacts[indexPath.section];
    KCContact *contact = group.contacts[indexPath.row];
    
    //由于此方法调用十分频繁，cell的标示声明成静态变量有利于性能优化
    static NSString *cellIdentifier = @"UITableViewCellIdentifierKey1";
    static NSString *cellIdentifierForFirstRow=@"UITableViewCellIdentifierKeyWithSwitch";
    
    //首先根据标识去缓存池取
    UITableViewCell *cell = nil;
    if(indexPath.row == 0)
    {
        cell=[tableView dequeueReusableCellWithIdentifier:cellIdentifierForFirstRow];
    }else
    {
        cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    }
    
    //如果缓存池没有到则重新创建并放到缓存池中
    if(!cell){
        if(indexPath.row==0)
        {
            cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:cellIdentifierForFirstRow];
            
            /*
             
             UISwitch继承于UIControl而不是UIView（当然UIControl最终也是继承于UIView）,继承于UIControl的控件使用addTarget添加对应事件而不是代理，同时有“是否可用”、“是否高亮”、“是否选中”等属性；
             
             */
            UISwitch *sw=[[UISwitch alloc]init];
            [sw addTarget:self action:@selector(switchValueChange:) forControlEvents:UIControlEventValueChanged];
            cell.accessoryView=sw;
        }else
        {
            cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:cellIdentifier];
            cell.accessoryType = UITableViewCellAccessoryDetailButton;
        }
    }
    
    if(indexPath.row==0){
        ((UISwitch *)cell.accessoryView).tag=indexPath.section;
    }
    
    //    UITableViewCell *cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:nil];
    
    /*
     
     上面代码中如果有些UITableViewCell的UISwitch设置为on当其他控件重用时状态也是on，解决这个问题可以在模型中设置对应的属性记录其状态，在生成cell时设置当前状态（为了尽可能简化上面的代码这里就不再修复这个问题）；
     
     */
    
    cell.textLabel.text = [contact getName];
    cell.detailTextLabel.text = contact.phoneNum;
    return cell;
}

#pragma mark - 返回每组标题名称
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    //    NSLog(@"生成组（组：%d）名称",section);
    KCContactGroup *group = _contacts[section];
    return group.name;
    
}


#pragma mark - 生成每组尾部说明
- (NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section
{
    //    NSLog(@"生成尾部（组：%d）名称",section);
    KCContactGroup *group = _contacts[section];
    return group.detail;
}

/*
 
 大家在使用iPhone通讯录时会发现右侧可以按字母检索，使用起来很方便，其实这个功能使用UITableView实现很简单，只要实现数据源协议的一个方法，构建一个分组标题的数组即可实现。数组元素的内容和组标题内容未必完全一致，UITableView是按照数组元素的索引和每组数据索引顺序来定位的而不是按内容查找。
 
 
 */
- (NSArray *)sectionIndexTitlesForTableView:(UITableView *)tableView
{
    //    NSLog(@"生成组索引");
    NSMutableArray *indexs = [[NSMutableArray alloc] init];
    for(KCContactGroup *group in _contacts)
    {
        [indexs addObject:group.name];
    }
    return indexs;
}

#pragma mark 设置每行高度（每行高度可以不一样）
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    //    [_contacts objectAtIndex:indexPath.row];
    UITableViewCell *cell = [self tableView:tableView cellForRowAtIndexPath:indexPath];
    return cell.frame.size.height;
}

#pragma mark - 代理方法
#pragma mark 设置分组标题内容高度
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    if(section==0){
        return 50;
    }
    return 40;
}

#pragma mark 设置尾部说明内容高度
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 40;
}


/**
 *  监听点击表格的item
 *
 *  @param tableView <#tableView description#>
 *  @param indexPath indexPath description
 */
#pragma mark 点击行
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    _indexPath = indexPath;
    NSLog(@"didSelectRowAtIndexPath  section=%d, row== %d",indexPath.section,indexPath.row);
    KCContactGroup *group = [_contacts objectAtIndex:indexPath.section];
    KCContact *contact =  group.contacts[indexPath.row];
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:[contact getName] message:contact.phoneNum delegate:self cancelButtonTitle:@"确定" otherButtonTitles:@"修改",nil];
    
    alert.alertViewStyle = UIAlertViewStylePlainTextInput; // 弹出带有输入框的弹窗
    UITextField *field = [alert textFieldAtIndex:0];
    field.text = contact.phoneNum ;
    [alert show];
}


/**
 *  监听Alert的按钮点击事件
 *
 *  @param alertView   <#alertView description#>
 *  @param buttonIndex <#buttonIndex description#>
 */
#pragma mark 窗口的代理方法，用户保存数据
-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (buttonIndex == 1) {
        UITextField *field = [alertView textFieldAtIndex:0];
        KCContactGroup *group = [_contacts objectAtIndex: _indexPath.section];
        KCContact *contact = group.contacts[_indexPath.row];
        contact.phoneNum = field.text;
        
        // 刷新表格的方法：全部刷新，局部刷新
        // 1.全部刷新
        //        [_tableView reloadData]; // 该方法会重新调用数据源方法，包括计算分组、计算每个分组的行数，生成单元格等刷新整个UITableView
        
        
        // 2.局部刷新表格
        NSArray *arr = @[_indexPath];//需要局部刷新的单元格的组、行
        /*
         typedef NS_ENUM(NSInteger, UITableViewRowAnimation) {
         UITableViewRowAnimationFade,
         UITableViewRowAnimationRight,           // slide in from right (or out to right)
         UITableViewRowAnimationLeft,
         UITableViewRowAnimationTop,
         UITableViewRowAnimationBottom,
         UITableViewRowAnimationNone,            // available in iOS 3.0
         UITableViewRowAnimationMiddle,          // available in iOS 3.2.  attempts to keep cell centered in the space it will/did occupy
         UITableViewRowAnimationAutomatic = 100  // available in iOS 5.0.  chooses an appropriate animation style for you
         };
         
         
         */
        
        [_tableView reloadRowsAtIndexPaths:arr withRowAnimation:UITableViewRowAnimationNone]; //后面的参数代表更新时的动画
    }
}


-(NSIndexPath *)tableView:(UITableView *)tableView willSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"willSelectRowAtIndexPath  section=%d, row== %d",indexPath.section,indexPath.row);
    //    KCContactGroup *group = [_contacts objectAtIndex:indexPath.section];
    //    KCContact *contact =  group.contacts[indexPath.row];
    //    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:[contact getName] message:contact.phoneNum delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil];
    //    [alert show];
    return indexPath;
}


#pragma mark 重写状态样式方法
-(UIStatusBarStyle)preferredStatusBarStyle
{
    return  UIStatusBarStyleLightContent;
}

#pragma mark 切换开关转化事件
-(void)switchValueChange:(UISwitch *)sw{
    NSLog(@"section:%i,switch:%i",sw.tag, sw.on);
}



/*
 // Override to support conditional editing of the table view.
 - (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
 // Return NO if you do not want the specified item to be editable.
 return YES;
 }
 */

/*
 // Override to support editing the table view.
 - (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
 if (editingStyle == UITableViewCellEditingStyleDelete) {
 // Delete the row from the data source
 [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
 } else if (editingStyle == UITableViewCellEditingStyleInsert) {
 // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
 }
 }
 */

/*
 // Override to support rearranging the table view.
 - (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
 }
 */

/*
 // Override to support conditional rearranging of the table view.
 - (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
 // Return NO if you do not want the item to be re-orderable.
 return YES;
 }
 */

/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

@end
