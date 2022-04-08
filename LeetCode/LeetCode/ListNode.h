//
//  ListNode.h
//  LeetCode
//
//  Created by 邵义珑 on 2022/4/8.
//

#import <Foundation/Foundation.h>

@class ListNode;

NS_ASSUME_NONNULL_BEGIN

@interface ListNode : NSObject

@property (nonatomic, assign) NSInteger value;

@property (nonatomic, strong) ListNode *next;

@end

NS_ASSUME_NONNULL_END
