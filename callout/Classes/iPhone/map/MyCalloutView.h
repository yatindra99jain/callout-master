
// Several authors. Based on code by Asynchrony Solutions.
// See http://stackoverflow.com/questions/8018841/customize-the-mkannotationview-callout/8019308#8019308

#import "CalloutView.h"
#import "CalloutAnnotation.h"

@interface MyCalloutView : CalloutView

@property (nonatomic, retain) IBOutlet UILabel* title;
@property (nonatomic, retain) IBOutlet UILabel* subtitle;
@property (nonatomic, retain) IBOutlet UILabel* subtitle1;
@property (nonatomic, retain) IBOutlet UILabel* subtitle2;

-(IBAction) handleTouch:(id)sender;
- (id) initWithAnnotation:(CalloutAnnotation*)annotation;

@end
