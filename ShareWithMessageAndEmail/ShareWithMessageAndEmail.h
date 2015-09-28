//
//  ShareWithMessageAndEmail.h
//  test
//
//  Created by MaYing on 15/9/16.
//  Copyright (c) 2015年 xmg. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MessageUI/MessageUI.h>
#import <AddressBookUI/AddressBookUI.h>

@interface ShareWithMessageAndEmail : NSObject

+(MFMessageComposeViewController *)message:(NSString *)phones msg:(NSString *)message del:(id<MFMessageComposeViewControllerDelegate>)del;//phones 用「,」分割
+(MFMailComposeViewController *)email:(NSString *)recipient mailSubject:(NSString *)mailSubject mailBody:(NSString *)mailBody isHTML:(BOOL)isHTML del:(id<MFMailComposeViewControllerDelegate> )del;//recipient 收件人 用 ,分割
@end
