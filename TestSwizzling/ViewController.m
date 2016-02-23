//
//  ViewController.m
//  TestSwizzling
//
//  Created by yanluojun on 15/11/16.
//  Copyright © 2015年 yanluojun. All rights reserved.
//

#import "ViewController.h"
#import "Swizzl_Foundation.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    NSMutableArray *ar = [[NSMutableArray alloc] initWithObjects:@"1",@"2",@"3",@"4", nil];
    id aa = [ar objectAtIndex:-1];
    NSLog(@"aa:%@",aa);
    
    [ar insertObject:nil atIndex:5];
    NSLog(@"AR：%@",ar);
    NSMutableDictionary *dic = [NSMutableDictionary dictionary];
    [dic setObject:nil forKey:@"sss"];
    
    [dic setValue:nil forKey:@"11"];
    NSLog(@"dic:%@",dic);

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
