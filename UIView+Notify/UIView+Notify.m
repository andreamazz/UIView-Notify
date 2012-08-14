//
//  UIView+Notify.m
//

#import "UIView+Notify.h"
#import <QuartzCore/QuartzCore.h>

#define kPaddingX			10.0
#define kPaddingY			10.0
#define kOpacity			0.8
#define kFontSize			16.0
#define kMaxMessageLines	999
#define kColorDefault		[UIColor colorWithRed:0.31f green:0.47f blue:0.78f alpha:kOpacity]

@implementation UIView (Notify)

- (void)notify:(NSString *)message
{
	[self notify:message withBackgroundColor:kColorDefault];
}

- (void)notify:(NSString *)message withBackgroundColor:(UIColor*)color
{
	UIView *notify = [self viewForMessage:message withBackgroundColor:color];
	
	// Add the view to the bottom of the parent
	CGPoint point = CGPointMake(self.bounds.size.width / 2, self.bounds.size.height + (notify.frame.size.height / 2));
	[notify setCenter:point];
    [self addSubview:notify];
	
	[UIView animateWithDuration:0.3
					 animations:^{
						 [notify setFrame:CGRectMake(0, self.bounds.size.height - (notify.frame.size.height),
													 notify.frame.size.width, notify.frame.size.height)];
					 }
					 completion:^(BOOL finished){
						 [NSTimer scheduledTimerWithTimeInterval:2 target:self selector:@selector(hideNotify:) userInfo:notify repeats:NO];
					 }];
}

- (void)hideNotify:(NSTimer*)timer
{
	// Slide the view out
	UIView* view = timer.userInfo;
	[UIView animateWithDuration:0.3
					 animations:^{
						 [view setFrame:CGRectMake(0, self.bounds.size.height + (view.frame.size.height / 2),
												   view.frame.size.width, view.frame.size.height)];
					 }
					 completion:^(BOOL finished){
						 [view removeFromSuperview];
					 }];
}

- (UIView *)viewForMessage:(NSString *)message withBackgroundColor:(UIColor*)color
{
    if(message == nil)
		return nil;
	
    UILabel *labelMessage = nil;
    
	// Create the background view
    UIView *wrapperView = [[UIView alloc] init];
    [wrapperView setBackgroundColor:color];
	
	// Create the message label
	labelMessage = [[UILabel alloc] init];
	[labelMessage setNumberOfLines:kMaxMessageLines];
	[labelMessage setFont:[UIFont systemFontOfSize:kFontSize]];
	[labelMessage setLineBreakMode:UILineBreakModeWordWrap];
	[labelMessage setTextColor:[UIColor whiteColor]];
	[labelMessage setBackgroundColor:[UIColor clearColor]];
	[labelMessage setText:message];
	
	// Size the label frame according to the length of the text
	CGSize maxSize = CGSizeMake((self.bounds.size.width * 0.8), self.bounds.size.height * 0.8);
	CGSize currentSize = [message sizeWithFont:labelMessage.font
							 constrainedToSize:maxSize
								 lineBreakMode:UILineBreakModeWordWrap];
	[labelMessage setFrame:CGRectMake(0.0, self.frame.size.height, currentSize.width, currentSize.height)];
		
    CGFloat wrapperHeight = labelMessage.bounds.size.height + kPaddingY * 2;
	
    [wrapperView setFrame:CGRectMake(0.0, 0.0, 320, wrapperHeight)];
	
	[labelMessage setFrame:CGRectMake(kPaddingX, kPaddingY,
									  labelMessage.bounds.size.width, labelMessage.bounds.size.height)];
	[wrapperView addSubview:labelMessage];
	
    return wrapperView;
}

@end
