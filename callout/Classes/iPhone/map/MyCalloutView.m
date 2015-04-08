// Several authors. Based on code by Asynchrony Solutions.
// See http://stackoverflow.com/questions/8018841/customize-the-mkannotationview-callout/8019308#8019308

#import "MyCalloutView.h"


@implementation MyCalloutView

@synthesize title = _title;
@synthesize subtitle = _subtitle;
@synthesize subtitle1 = _subtitle1;
@synthesize subtitle2 = _subtitle2;





-(IBAction) handleTouch:(id)sender {
    //debug(@"touch %@", sender);
}


- (id)initWithAnnotation:(CalloutAnnotation*)annotation
{
    self = [super initWithAnnotation:annotation];
    self.title.text = [annotation.content.values objectForKey:@"title"];
    self.subtitle.text = [annotation.content.values objectForKey:@"subtitle"];
    self.subtitle1.text = [annotation.content.values objectForKey:@"subtitle1"];
    self.subtitle2.text = [annotation.content.values objectForKey:@"subtitle2"];
    return self;
}

- (void)setAnnotation:(CalloutAnnotation *)annotation
{
    self.title.text = [annotation.content.values objectForKey:@"title"];
    self.subtitle.text = [annotation.content.values objectForKey:@"subtitle"];
    self.subtitle1.text = [annotation.content.values objectForKey:@"subtitle1"];
    self.subtitle2.text = [annotation.content.values objectForKey:@"subtitle2"];
    [super setAnnotation:annotation];
}

#pragma mark - NSObject

- (void)dealloc {
    self.title = nil;
    [super dealloc];
}


@end
