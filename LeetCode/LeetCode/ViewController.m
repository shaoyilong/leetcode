//
//  ViewController.m
//  LeetCode
//
//  Created by 邵义珑 on 2022/4/8.
//

#import "ViewController.h"
#import "MySort.h"
#import "MultiThread.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [MySort sortTest];
    
    [MultiThread threadTest];
    
}

@end
