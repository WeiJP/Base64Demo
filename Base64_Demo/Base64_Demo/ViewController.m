//
//  ViewController.m
//  Base64_Demo
//
//  Created by use on 16/6/15.
//  Copyright © 2016年 wjp. All rights reserved.
//

#import "ViewController.h"
#import "NSString+Base64.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    NSDictionary *dict = @{@"《演员》":@"薛之谦",
                           @"《悟空》":@"戴荃",
                           @"Hotel California":@"Eagles",
                           @"Let Her Go":@"Passenger"};
    NSError *error = nil;
    NSMutableData *data = [[NSMutableData alloc] init];
    NSKeyedArchiver *archiver = [[NSKeyedArchiver alloc] initForWritingWithMutableData:data];
    [archiver encodeObject:dict forKey:@"QRCodeKey"];
    [archiver finishEncoding];
    if (error) {
        NSLog(@"%@", error);
        return;
    }
    NSMutableString *codeString = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableLeaves error:&error];
    if (error) {
        NSLog(@"%@", error);
        return;
    }

//    NSString *codeString = @"Hello world";
    NSLog(@"原文--%@",codeString);
    
    NSString *base64Str = [codeString base64EncodedString];
    NSLog(@"Base64编码--%@",base64Str);
    
    NSString *decodeStr = [base64Str base64DecodedString];
    NSLog(@"Base64解码--%@",decodeStr);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
