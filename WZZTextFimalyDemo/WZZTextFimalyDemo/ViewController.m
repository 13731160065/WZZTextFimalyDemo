//
//  ViewController.m
//  WZZTextFimalyDemo
//
//  Created by 王泽众 on 16/10/11.
//  Copyright © 2016年 wzz. All rights reserved.
//

#import "ViewController.h"
#import "WZZTextDetailVC.h"

@interface ViewController ()<UITableViewDelegate, UITableViewDataSource>
{
    NSMutableArray * dataArr;
}
@property (weak, nonatomic) IBOutlet UITableView *mainTableView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [_mainTableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
    [self textFimaly];
}

- (void)textFimaly {
    dataArr = [NSMutableArray array];
    NSArray *familyNames = [[NSArray alloc] initWithArray:[UIFont familyNames]];
    NSArray *fontNames;
    NSInteger indFamily, indFont;
    for (indFamily=0; indFamily<[familyNames count]; ++indFamily)
    {
        fontNames = [[NSArray alloc] initWithArray:
                     [UIFont fontNamesForFamilyName:
                      [familyNames objectAtIndex:indFamily]]];
        for (indFont=0; indFont<[fontNames count]; ++indFont)
        {
            [dataArr addObject:[NSString stringWithFormat:@"%@", [fontNames objectAtIndex:indFont]]];
        }
    }
    [_mainTableView reloadData];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return dataArr.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    
    [cell.textLabel setText:dataArr[indexPath.row]];
    [cell.textLabel setFont:[UIFont fontWithName:dataArr[indexPath.row] size:15]];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    WZZTextDetailVC * vc = [[WZZTextDetailVC alloc] init];
    vc.fontName = dataArr[indexPath.row];
    [self presentViewController:vc animated:YES completion:nil];
}

@end
