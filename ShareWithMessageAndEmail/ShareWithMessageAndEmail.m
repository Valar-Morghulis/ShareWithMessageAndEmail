//
//  ShareWithMessageAndEmail.m
//  test
//
//  Created by MaYing on 15/9/16.
//  Copyright (c) 2015年 xmg. All rights reserved.
//

#import "ShareWithMessageAndEmail.h"

@implementation ShareWithMessageAndEmail
+(MFMessageComposeViewController *)message:(NSString *)phones msg:(NSString *)message del:(id<MFMessageComposeViewControllerDelegate>)del
{
    if ([MFMessageComposeViewController canSendText])
    {
        MFMessageComposeViewController* controller = [[MFMessageComposeViewController alloc] init];
        NSString * number = phones;//联系人
        //
        controller.body =  message;//消息内容
        NSScanner* numberScanner = [NSScanner scannerWithString:number];
        [numberScanner setCharactersToBeSkipped:[NSCharacterSet characterSetWithCharactersInString:@",，"]];
        NSCharacterSet* charactersToSkip = [NSCharacterSet characterSetWithCharactersInString:@",，"];
        
        NSMutableArray *substrings = [NSMutableArray array];
        NSString *substring = @"";
        while (![numberScanner isAtEnd])
        {
            [numberScanner scanUpToCharactersFromSet:charactersToSkip intoString:&substring];
            [numberScanner scanCharactersFromSet:charactersToSkip intoString:NULL];
            //NSLog(@"%@", substring);
            [substrings addObject:substring];
        }
        
        controller.recipients = substrings;
        controller.messageComposeDelegate = del;
        return [controller autorelease];
    }
    return 0;
}
+(MFMailComposeViewController *)email:(NSString *)recipient mailSubject:(NSString *)mailSubject mailBody:(NSString *)mailBody isHTML:(BOOL)isHTML del:(id<MFMailComposeViewControllerDelegate> )del
{
    if ([MFMailComposeViewController canSendMail])
    {
        MFMailComposeViewController *mailController = [[MFMailComposeViewController alloc] init];
        
        NSString * rec = recipient;//收件人
        //
        NSScanner* recipientScanner = [NSScanner scannerWithString:rec];
        [recipientScanner setCharactersToBeSkipped:[NSCharacterSet characterSetWithCharactersInString:@",，"]];
        NSCharacterSet* charactersToSkip = [NSCharacterSet characterSetWithCharactersInString:@",，"];
        
        NSMutableArray *recipients = [NSMutableArray array];
        NSString *substring = @"";
        while (![recipientScanner isAtEnd])
        {
            [recipientScanner scanUpToCharactersFromSet:charactersToSkip intoString:&substring];
            [recipientScanner scanCharactersFromSet:charactersToSkip intoString:NULL];
            //NSLog(@"%@", substring);
            [recipients addObject:substring];
        }

        [mailController setToRecipients:recipients];
        mailController.mailComposeDelegate = del;
        [mailController setSubject:mailSubject];
        [mailController setMessageBody:mailBody isHTML:isHTML];
        mailController.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
        return [mailController autorelease];
    }
    return 0;
}

@end
