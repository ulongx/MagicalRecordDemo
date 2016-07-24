//
//  MessageEntity+CoreDataProperties.h
//  
//
//  Created by xylong on 16/7/24.
//
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "MessageEntity.h"

NS_ASSUME_NONNULL_BEGIN

@interface MessageEntity (CoreDataProperties)

@property (nullable, nonatomic, retain) NSString *msgtext;
@property (nullable, nonatomic, retain) NSManagedObject *user;

@end

NS_ASSUME_NONNULL_END
