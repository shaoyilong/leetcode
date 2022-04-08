//
//  MultiThread.m
//  LeetCode
//
//  Created by 邵义珑 on 2022/4/8.
//

#import "MultiThread.h"

@interface MultiThread ()

@end

@implementation MultiThread

+ (void)threadTest
{
    MultiThread *thread = [[MultiThread alloc] init];
    [thread logTest];
}

- (void)logTest
{
    
}

- (void)textDemo2{
    dispatch_queue_t queue = dispatch_queue_create("cooci", DISPATCH_QUEUE_CONCURRENT);
    NSLog(@"1");
    dispatch_async(queue, ^{
        NSLog(@"2");
        dispatch_sync(queue, ^{
            NSLog(@"3");
        });
        NSLog(@"4");
    });
    NSLog(@"5");
}

- (void)textDemo1{
    
    NSMutableArray *arr = [NSMutableArray arrayWithObjects:@"1",@"2", nil];
        self.mArray = arr;

    [arr addObject:@"3"];
    NSLog(@"Cooci: %@",self.mArray);
    
//        void (^kcBlock)(void) = ^{
//            [arr addObject:@"3"];
//            [self.mArray addObject:@"a"];
//            NSLog(@"KC %@",arr);
//            NSLog(@"Cooci: %@",self.mArray);
//        };
//        [arr addObject:@"4"];
//        [self.mArray addObject:@"5"];
//
//        arr = nil;
//        self.mArray = nil;
//
//        kcBlock();
}


@end
