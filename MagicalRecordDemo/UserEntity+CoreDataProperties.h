//
//  UserEntity+CoreDataProperties.h
//  
//
//  Created by xylong on 16/7/24.
//
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "UserEntity.h"

NS_ASSUME_NONNULL_BEGIN

@interface UserEntity (CoreDataProperties)

@property (nullable, nonatomic, retain) NSString *uname;
@property (nullable, nonatomic, retain) NSSet<MessageEntity *> *mesages;

@end

@interface UserEntity (CoreDataGeneratedAccessors)

- (void)addMesagesObject:(MessageEntity *)value;
- (void)removeMesagesObject:(MessageEntity *)value;
- (void)addMesages:(NSSet<MessageEntity *> *)values;
- (void)removeMesages:(NSSet<MessageEntity *> *)values;

@end

NS_ASSUME_NONNULL_END
