CTATransitApiWrapper
=====================

This is library that you can use to quickly get up to speed an utilize the data that the CTA is throwing down as of 5/10/2012. 

Usage
--------

I've included a sample iOS to show what you can do but there are two steps. 

* create an instance of SGCTATrainTool with `+(id)trainToolWithApiKey:(NSString *)incomingApiKey`
* use either `-(void)getCTAInfoForStopID:(NSString *)stopID andMaxResponses:(int)maxResponses withCallback:(void (^)(SGTrainResponse *, NSError *))trainHandler` or `-(void)getCTAInfoForMapID:(NSString *)mapID andMaxResponses:(int)maxResponses withCallback:(void (^)(SGTrainResponse *, NSError *))trainHandler` to get the response in the form of a SGTrainResponse object.

If you want to use your own Network service, you can just use `SGTrainResponseGenerator` with `+ (SGTrainResponse *)trainResponseFromXMLData:(NSData *)xmlData` to get a SGTrainResponse object.

Need to more about the [CTA Train Api](http://www.transitchicago.com/developers/ttdocs/default.aspx)?


 