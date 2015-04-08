
// Several authors. Based on code by Asynchrony Solutions.
// See http://stackoverflow.com/questions/8018841/customize-the-mkannotationview-callout/8019308#8019308


#import "MapViewController.h"

/**
 * Delegates (de)selection to a view conforming to the AnnotationViewProtocol.
 * Delegates creation of the view to an annotation conforming to the AnnotationProtocol.
 */
@implementation MapViewController

@synthesize mapView;


// toolbar button
-(IBAction) leftButton:(id)sender 
{   
    // create 10 annotations
    NSArray *annotations = [MapUtil createAnnotationsForVisibleMap:self.mapView number:10];
    [self.mapView addAnnotations:annotations];
}


#pragma mark - MKMapViewDelegate

/** 
 * Delegates the SELECTION to the view implementation.
 */
- (void)mapView:(MKMapView *)aMapView didSelectAnnotationView:(MKAnnotationView *)view 
{
    // delegate the implementation to the annotation view
    if ([view conformsToProtocol:@protocol(AnnotationViewProtocol)]) {
        //debug(@"%@ conforms", NSStringFromClass([view class]));
        [((NSObject<AnnotationViewProtocol>*)view) didSelectAnnotationViewInMap:mapView];
    } else {
        //debug(@"%@ DOES NOT conform", NSStringFromClass([view class]));
    }
    view.image = [UIImage imageNamed:@"emoji-ghost.png"];
}


/** 
 * Delegates the DESELECTION to the view implementation.
 */
- (void)mapView:(MKMapView *)aMapView didDeselectAnnotationView:(MKAnnotationView *)view 
{
    //debug(@"%@", [view class]);
    // delegate the implementation to the annotation view
    if ([view conformsToProtocol:@protocol(AnnotationViewProtocol)]) {
        [((NSObject<AnnotationViewProtocol>*)view) didDeselectAnnotationViewInMap:mapView];
    }
    view.image = [UIImage imageNamed:@"commentactive_discuss_jmu.png"];
}


/** 
 * Delegates CREATION of the view to the annotation.
 * 
 * If the annotation doesn't conform to AnnotationProtocol, 
 * a standard MKPinAnnotationView is returned.
 */

- (MKAnnotationView *)mapView:(MKMapView *)aMapView viewForAnnotation:(id<MKAnnotation>)annotation 
{
    
    // if this is a custom annotation
    if ([annotation conformsToProtocol:@protocol(AnnotationProtocol)])
    {
        // delegate the implementation to it
        
        return [((NSObject<AnnotationProtocol>*)annotation) annotationViewInMap:mapView];
        
    }
    else
    {
        
        // else, return a standard annotation view
        static NSString *viewId = @"MKPinAnnotationView";
        MKAnnotationView *view = (MKPinAnnotationView*) [self.mapView dequeueReusableAnnotationViewWithIdentifier:viewId];
        if (view == nil)
        {
            view = [[MKPinAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:viewId];
        }
        return view;
    }
}

-(void)mapView:(MKMapView *)mapView annotationView:(MKAnnotationView *)view calloutAccessoryControlTapped:(UIControl *)control
{
    
    CGPoint annotationCenter=CGPointMake(control.frame.origin.x+(control.frame.size.width/2),control.frame.origin.y+(control.frame.size.height/2));
    
    CLLocationCoordinate2D newCenter=[self.mapView convertPoint:annotationCenter toCoordinateFromView:control.superview];
    [self.mapView setCenterCoordinate:newCenter animated:YES];
    
}

#pragma mark - NSObject

- (void)dealloc {
    mapView.delegate=nil;
    [super dealloc];
}


@end
