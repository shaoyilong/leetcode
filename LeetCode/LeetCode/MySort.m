//
//  MySort.m
//  LeetCode
//
//  Created by 邵义珑 on 2022/4/8.
//

#import "MySort.h"
#import "BinNode.h"

@interface MySort ()

@property (nonatomic, strong) NSMutableArray *mArray;

@end

@implementation MySort

+ (void)sortTest
{
    MySort *test = [[MySort alloc] init];
    [test logTest];
}

- (void)logTest
{
    
//    [self textDemo1];
    
//    NSLog(@"====%d", [self binaryFind:@[@0,@1,@2,@3,@4,@5,@6,@7,@8,@9] target:10]);
    
//    NSMutableArray *ma = @[@4,@2,@7,@1,@6,@3,@9,@0,@5,@8].mutableCopy;
//    NSLog(@"====%@", ma);
//    [self quickSortArray:ma withLeftIndex:0 andRightIndex:(int)ma.count-1];
//    NSLog(@"====%@", ma);
    
//    NSLog(@"===%d", [self maxArea:@[@1,@8,@6,@2,@5,@4,@8,@3,@7]]);
//    NSLog(@"===%d", fbnq(10));
    
//    int a[]={5,8,1,6,-1,10,3,2};
//
//    int length = sizeof(a)/sizeof(a[0]);
//
////    quickSort(a, 0, 10);
//
//    int res = RS(a, 0, length-1, 5);
//    printf("topK value=%d\n", res);
////
////
////
//////    processSort(a, 0, 5);
//////
//    for (int i=0; i<length; i++) {
//        printf("%d\n", a[i]);
//    }
    
    NSMutableArray *mArr = @[@65,@93,@7,@10,@1,@15,@50,@30,@75,@59,@33,@52,@85,@3,@5].mutableCopy;
//    NSMutableArray *mArr = @[@5,@93,@7,@10,@1,@15].mutableCopy;

//    [self ocQuickSort:mArr low:0 high:(int)(mArr.count-1)];
    int k = 7;
    [self ocRS:mArr low:0 high:(int)(mArr.count-1) k:k];
    for (int i=0; i<k; i++) {
        NSLog(@"top%d = %d", i, [mArr[i] intValue]);
    }
    NSLog(@"====%@",mArr);

//    BinNode *tree = [self creatBinTree:@[@1,@8,@6,@2,@5,@4,@8,@3,@7]];
//    NSLog(@"===%@", tree);
//    BinNode *tree = [self creatBinTree:@[@2,@3,@7,@5,@9,@4,@6,@1,@8]];

//    BinNode *tree = [self creatBinTree:@[@1,@2,@3,@4,@5,@6,@7,@8,@9]];
//    [self printBTree:tree];
//    NSLog(@"#######################");
//
//    tree = [self reverseBinTree1:tree];
//    [self printBTree:tree];
        
    
    
    
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

- (void)printBTree:(BinNode *)root
{
    if (!root) {
        NSLog(@"===end");
        return;
    }
    NSLog(@"%zd", root.value);

    if (root.leftNode) {
        [self printBTree:root.leftNode];
    }
//    NSLog(@"%zd", root.value);

    if (root.rightNode) {
        [self printBTree:root.rightNode];
    }
//    NSLog(@"%zd", root.value);

}

- (BinNode *)reverseBinTree:(BinNode *)root
{
    if (!root) {
        return nil;
    }
    
    if (!root.leftNode && !root.rightNode) {
        return root;
    }
    
    [self reverseBinTree:root.leftNode];
    [self reverseBinTree:root.rightNode];
    
    BinNode *tmp = root.leftNode;
    root.leftNode = root.rightNode;
    root.rightNode = tmp;
    
    return root;
}

- (BinNode *)reverseBinTree1:(BinNode *)root
{
    if (root == nil) {
        return nil;
    }
    NSMutableArray *mArr = [NSMutableArray array];
    [mArr addObject:root];
    
    while (mArr.count != 0) {
        BinNode *node = [mArr firstObject];
        [mArr removeObjectAtIndex:0];
        
        BinNode *left = node.leftNode;
        node.leftNode = node.rightNode;
        node.rightNode = left;
        
        if (node.leftNode) {
            [mArr addObject:node.leftNode];
        }
        
        if (node.rightNode) {
            [mArr addObject:node.rightNode];
        }
        
    }
    return root;
}


- (BinNode *)creatBinTree:(NSArray *)values
{
    BinNode *root = nil;
    NSMutableArray <BinNode *> *queue = [NSMutableArray array];
    root = [BinNode new];
    root.value = [values[0] integerValue];
    for (NSInteger i=1; i<values.count; i++) {
        NSInteger value = [values[i] integerValue];
//        root = [self addTreeNode:root value:value];
        root = [self addBFSTreeNode:root value:value queue:queue];
    }
    return root;
}

- (BinNode *)addTreeNode:(BinNode *)treeNode value:(NSInteger)value
{
    if (!treeNode) {
        treeNode = [BinNode new];
        treeNode.value = value;
    } else if (value <= treeNode.value) {
        treeNode.leftNode = [self addTreeNode:treeNode.leftNode value:value];
    } else {
        treeNode.rightNode = [self addTreeNode:treeNode.rightNode value:value];
    }
    
    return treeNode;
}


- (BinNode *)addBFSTreeNode:(BinNode *)treeNode value:(NSInteger)value queue:(NSMutableArray *)queue
{
    [queue addObject:treeNode];
    
    while (queue.count != 0) {
        BinNode *tmp = queue.firstObject;
        [queue removeObjectAtIndex:0];
        
        if (!tmp.leftNode) {
            tmp.leftNode = [BinNode new];
            tmp.leftNode.value = value;
            break;
        } else {
            [queue addObject:tmp.leftNode];
        }
        
        if (!tmp.rightNode) {
            tmp.rightNode = [BinNode new];
            tmp.rightNode.value = value;
            break;
        } else {
            [queue addObject:tmp.rightNode];
        }
    }
    return treeNode;
}

- (int)binaryFind:(NSArray *)array target:(int)target
{
    int left = 0;
    int right = (int)array.count - 1;
    
    while (left < right) {
        int mid = (left+right)/2;
        
        if (target < [array[mid] intValue]) {
            right = mid - 1;
        } else if (target > [array[mid] intValue]) {
            left = mid + 1;
        } else {
            return mid;
        }
    }
    
    return 0;
}

- (void)quickSortArray:(NSMutableArray *)array withLeftIndex:(NSInteger)leftIndex andRightIndex:(NSInteger)rightIndex
{
    if (leftIndex >= rightIndex) {//如果数组长度为0或1时返回
        return ;
    }
    
    NSInteger i = leftIndex;
    NSInteger j = rightIndex;
    //记录比较基准数
    NSInteger key = [array[i] integerValue];
    
    while (i < j) {
        /**** 首先从右边j开始查找比基准数小的值 ***/
        while (i < j && [array[j] integerValue] >= key) {//如果比基准数大，继续查找
            j--;
        }
        //如果比基准数小，则将查找到的小值调换到i的位置
        array[i] = array[j];
        
        /**** 当在右边查找到一个比基准数小的值时，就从i开始往后找比基准数大的值 ***/
        while (i < j && [array[i] integerValue] <= key) {//如果比基准数小，继续查找
            i++;
        }
        //如果比基准数大，则将查找到的大值调换到j的位置
        array[j] = array[i];
        
    }
    
    //将基准数放到正确位置
    array[i] = @(key);
    
    /**** 递归排序 ***/
    //排序基准数左边的
    [self quickSortArray:array withLeftIndex:leftIndex andRightIndex:i - 1];
    //排序基准数右边的
    [self quickSortArray:array withLeftIndex:i + 1 andRightIndex:rightIndex];
}

- (int)maxArea:(NSArray *)heightArray
{
//    @[@1,@8,@6,@2,@5,@4,@8,@3,@7]
    int low = 0;
    int high = (int)heightArray.count - 1;
    int area = 0;
    
    while (low < high) {
        int tmp = MIN([heightArray[low] intValue], [heightArray[high] intValue])*(high-low);
        
        area = MAX(area, tmp);
        
        if ([heightArray[low] intValue] <= [heightArray[high] intValue]) {
            low++;
        } else {
            high--;
        }
    }

    return area;
}

- (int)maxNum:(NSArray *)array left:(int)left righ:(int)right
{
    if (left == right) {
        return [array[left] intValue];
    }
    int mid = left + (right-left)/2;
    int leftMax = [self maxNum:array left:left righ:mid];
    int rightMax = [self maxNum:array left:mid+1 righ:right];
    return MAX(leftMax, rightMax);
    
}


void processSort(int arr[], int l, int r) {
    
    if (l == r) {
        return ;
    }
    int mid = l+(r-l)/2;
    processSort(arr, l, mid);
    processSort(arr, mid+1, r);
    merge(arr, l, mid, r);
}

void merge(int arr[], int l, int mid, int r) {
    int help[r-l+1];
    int i = 0;
    int p1 = l;
    int p2 = mid+1;
    
    while (p1<=mid && p2<=r) {
        help[i++] = arr[p1]<=arr[p2]?arr[p1++]:arr[p2++];
    }
    
    while (p1<=mid) {
        help[i++] = arr[p1++];
    }
    
    while (p2<=r) {
        help[i++] = arr[p2++];
    }
    
    for (i=0; i<(r-l+1); i++) {
        arr[l+i] = help[i];
    }
    
}


int fbnq(int n) {
    if (n<=1) {
        return n;
    }
//   0 1 1 2 3 5
//    return fbnq(n-1) + fbnq(n-2);
    int a = 0;
    int b = 1;
    int c = 0;
    for (int i = 0; i<n-1; i++) {
        c = a+b;
        a = b;
        b = c;
        NSLog(@"-> %d \n", c);
    }

    return b;
}

int partition(int arr[],  int low, int high) {
    
    int i,j;
    i = low;
    j = high;
    int prvot = arr[low];
    while (i<j) {
        while (i<j && arr[j] >= prvot) {
            j--;
        }
        if (i<j) {
            arr[i] = arr[j];
            i++;
        }
        
        while (i<j && arr[i] <= prvot) {
            i++;
        }
        if (i<j) {
            arr[j] = arr[i];
            j--;
        }
    }
    
    arr[i] = prvot;
    return i;
}

void quickSort(int arr[],  int low, int high) {
    
    int i,j;
    i = low;
    j = high;
    int prvot = arr[low];
    while (i<j) {
        while (i<j && arr[j] >= prvot) {
            j--;
        }
        if (i<j) {
            arr[i] = arr[j];
            i++;
        }
        
        
        while (i<j && arr[i] <= prvot) {
            i++;
        }
        if (i<j) {
            arr[j] = arr[i];
            j--;
        }
        
    }
    
    arr[i] = prvot;
    
    if (low<i) {
        quickSort(arr, low, i);
    }
    
    if (i+1<high) {
        quickSort(arr, i+1, high);
    }
}


int RS(int arr[], int low, int high, int k) {
    if (low == high) {
        return arr[low];
    }
    
    int i = partition(arr, low, high);
    
    int temp = i-low+1;
    
    if (temp == k) {
        return arr[i];
    } else if (temp > k) {
        return RS(arr, low, i, k);
    } else {
        return RS(arr, i+1, high, k-i);
    }
}


- (void)ocQuickSort:(NSMutableArray *)arr low:(int)low high:(int)high
{
    int i,j;
    i = low;
    j = high;
    int prvot = [arr[low] intValue];
    while (i<j) {
        while (i<j && [arr[j] intValue] >= prvot) {
            j--;
        }
        if (i<j) {
            arr[i] = arr[j];
            i++;
        }
        
        while (i<j && [arr[i] intValue] <= prvot) {
            i++;
        }
        if (i<j) {
            arr[j] = arr[i];
            j--;
        }
    }
    
    arr[i] = @(prvot);

    if (low < i) {
        [self ocQuickSort:arr low:low high:i];
    }
    if (i+1<high) {
        [self ocQuickSort:arr low:i+1 high:high];
    }

}


- (int)ocPartition:(NSMutableArray *)arr low:(int)low high:(int)high
{
    int i,j;
    i = low;
    j = high;
    int prvot = [arr[low+(high-low)/2] intValue];
    while (i<j) {
        while (i<j && [arr[j] intValue] >= prvot) {
            j--;
        }
        if (i<j) {
            arr[i] = arr[j];
            i++;
        }
        
        while (i<j && [arr[i] intValue] <= prvot) {
            i++;
        }
        if (i<j) {
            arr[j] = arr[i];
            j--;
        }
    }
    
    arr[i] = @(prvot);
    return i;
}

- (void)ocRS:(NSMutableArray *)arr low:(int)low high:(int)high k:(int)k
{
    if (low < high) {
        int i = [self ocPartition:arr low:low high:high];
        
        if (i == k-1) {
            return;
        }
        
        if (i > k-1) {
            return [self ocRS:arr low:low high:i-1 k:k];
        } else {
            return [self ocRS:arr low:i+1 high:high k:k-i];
        }
    }
}

@end
