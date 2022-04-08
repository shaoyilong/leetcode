//
//  BinNode.h
//  OCTestDemo
//
//  Created by 邵义珑 on 2021/12/3.
//  Copyright © 2021 邵义珑. All rights reserved.
//

#import <Foundation/Foundation.h>

@class BinNode;

NS_ASSUME_NONNULL_BEGIN

@interface BinNode : NSObject

@property (nonatomic, assign) NSInteger value;
@property (nonatomic, strong) BinNode *leftNode;
@property (nonatomic, strong) BinNode *rightNode;

@end

NS_ASSUME_NONNULL_END
