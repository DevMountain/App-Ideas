//
//  AIVoiceTableViewCell.m
//  App Ideas
//
//  Created by Joshua Howland on 5/28/14.
//  Copyright (c) 2014 DevMountain. All rights reserved.
//

#import "AIVoiceTableViewCell.h"

static CGFloat margin = 15;

static NSString * const userNameKey = @"userName";
static NSString * const scoreKey = @"score";

@interface AIVoiceTableViewCell ()

@end

@implementation AIVoiceTableViewCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        UITextField *textField = [[UITextField alloc] initWithFrame:CGRectMake(margin, 0, self.contentView.bounds.size.width - (3 * margin), self.contentView.bounds.size.height)];
        textField.placeholder = @"User Name";
        self.userNameField = textField;
        [self.contentView addSubview:textField];
        
    }
    return self;
}

- (void)updateWithVoice:(NSDictionary *)voice {
    self.userNameField.text = voice[userNameKey];
}

@end
