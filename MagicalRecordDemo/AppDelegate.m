//
//  AppDelegate.m
//  MagicalRecordDemo
//
//  Created by xylong on 16/7/24.
//  Copyright © 2016年 Mapath Technology Co., Ltd. All rights reserved.
//

#import "AppDelegate.h"
#import <MagicalRecord/MagicalRecord.h>

#import "UserEntity.h"
#import "MessageEntity.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    [MagicalRecord setupCoreDataStackWithStoreNamed:@"MyDatabase.sqlite"];
    
    //创建数据
    [self persistNewUserWithName:@"demowork"];
    
    //查询素所有数据
    NSArray* users = [UserEntity MR_findAll];
    NSLog(@"用户数: %lu", (unsigned long)[users count]);
    
    //循环取出User和对应Message的内容
    for(UserEntity* user in users) {
        NSLog(@"%@", [user uname]);
        //Message表内容
        for (MessageEntity* msg in user.mesages) {
            NSLog(@"%@", [msg msgtext]);
        }
    }
    
//    根据user查询Message表的内容
//    NSArray* matchingMessages = [MessageEntity MR_findByAttribute:@"user.uname" withValue:@"demowork"];
//    for (MessageEntity* msg in matchingMessages) {
//        NSLog(@"%@", [msg msgtext]);
//    }
    
    return YES;
}

- (void)applicationWillTerminate:(UIApplication *)application {
    [MagicalRecord cleanUp];
}

- (void)persistNewUserWithName:(NSString*) name {
    
    NSManagedObjectContext* defaultContext = [NSManagedObjectContext MR_defaultContext];
    //删除Message表，对应user的数据信息
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"user.uname = %@", name];
    [MessageEntity MR_deleteAllMatchingPredicate:predicate];
    
    NSPredicate *predicate2 = [NSPredicate predicateWithFormat:@"uname = %@", name];
    [UserEntity MR_deleteAllMatchingPredicate:predicate2];
    
    UserEntity* myUser = [UserEntity MR_findFirstByAttribute:@"uname" withValue:name];
    //数据不存在，创建一条
    if (!myUser) {
        myUser = [UserEntity MR_createEntityInContext:defaultContext];
    }
    [myUser setUname: name];
    
    MessageEntity* msg1 = [MessageEntity MR_createEntityInContext:defaultContext];
    [msg1 setMsgtext:@"Hello"];
    [msg1 setUser:myUser];
    
    MessageEntity* msg2 = [MessageEntity MR_createEntityInContext:defaultContext];
    [msg2 setMsgtext:@"Bye Bye"];
    [msg2 setUser:myUser];
    
    //保存到数据库，当然这里也可以用另外一个方式，saveWithBlock 的方法
    [defaultContext MR_saveToPersistentStoreAndWait];
    
}
@end
