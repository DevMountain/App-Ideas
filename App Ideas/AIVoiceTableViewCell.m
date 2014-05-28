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

@property (nonatomic, strong) UIButton *wantsButton;
@property (nonatomic, strong) UIButton *mightUseButton;
@property (nonatomic, strong) UIButton *wontUseButton;

@end

@implementation AIVoiceTableViewCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        UITextField *textField = [[UITextField alloc] initWithFrame:CGRectMake(margin, 0, self.contentView.bounds.size.width - (3 * margin) - 100, self.contentView.bounds.size.height)];
        textField.placeholder = @"User Name";
        self.userNameField = textField;
        [self.contentView addSubview:textField];

        UIButton *wantsButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [wantsButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        wantsButton.frame = CGRectMake(self.frame.size.width - 100, 0, 100, 40);
        wantsButton.tag = 3;
        [wantsButton setTitle:@"Wants Now" forState:UIControlStateNormal];
        [wantsButton addTarget:self action:@selector(scoreButtonSelected:) forControlEvents:UIControlEventTouchUpInside];
        [self.contentView addSubview:wantsButton];
        
        self.wantsButton = wantsButton;
        
        UIButton *mightUseButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [mightUseButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        mightUseButton.frame = CGRectMake(self.frame.size.width - 100, 40, 100, 40);
        mightUseButton.tag = 2;
        [mightUseButton setTitle:@"Might Use" forState:UIControlStateNormal];
        [mightUseButton addTarget:self action:@selector(scoreButtonSelected:) forControlEvents:UIControlEventTouchUpInside];
        [self.contentView addSubview:mightUseButton];
        
        self.mightUseButton = mightUseButton;

        UIButton *wontUseButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [wontUseButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        wontUseButton.frame = CGRectMake(self.frame.size.width - 100, 80, 100, 40);
        wontUseButton.tag = 1;
        [wontUseButton setTitle:@"Won't Use" forState:UIControlStateNormal];
        [wontUseButton addTarget:self action:@selector(scoreButtonSelected:) forControlEvents:UIControlEventTouchUpInside];
        [self.contentView addSubview:wontUseButton];
        
        self.wontUseButton = wontUseButton;

        
    }
    return self;
}

- (void)updateWithVoice:(NSDictionary *)voice {
    self.userNameField.text = voice[userNameKey];
    
    [self updateScore:[voice[scoreKey] integerValue]];
}

- (void)scoreButtonSelected:(id)sender {
    [self updateScore:[sender tag]];
}

- (void)updateScore:(NSInteger)score {

    [self resetButtons];

    if (score == 1) {
        [self.wontUseButton setBackgroundColor:[UIColor redColor]];
        [self.wontUseButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    }
    
    if (score == 2) {
        [self.mightUseButton setBackgroundColor:[UIColor yellowColor]];
        [self.mightUseButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    }
    
    if (score == 3) {
        [self.wantsButton setBackgroundColor:[UIColor greenColor]];
        [self.wantsButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    }
}

- (void)resetButtons {

    [self.wantsButton setBackgroundColor:[UIColor whiteColor]];
    [self.mightUseButton setBackgroundColor:[UIColor whiteColor]];
    [self.wontUseButton setBackgroundColor:[UIColor whiteColor]];
    
    [self.wantsButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [self.mightUseButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [self.wontUseButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];

}

@end
