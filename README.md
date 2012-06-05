CTATransitApiWrapper
=====================

This is library that you can use to quickly get up to speed an utilize the data that the CTA is throwing down as of 5/10/2012. 

Installation
--------
1. Within your own application, add the CTATransitApiWrapper.xcodeproj into your own project. 
2. Within your project's target, under "Build Settings -> Linking -> Other Linker Flags", add "-ObjC -all_load"
3. Within your project's target, under "Build Settings -> Search Paths -> Header Search Paths", enter "$(BUILT_PRODUCTS_DIR)/headers" (include the quotes!)
4. Within your project's target, under "Build Phases -> Target Dependencies", add CTATransitApiWrapper-Universal
5. Within your project's target, under "Build Phases -> Link Binaries", add libCTATransitApi.a
6. In the same section, add the following library: libxml2.dylib.

Usage
--------

I've included a sample iOS to show what you can do but there are two steps. (Be sure to import SGTrainTool.h!)

* Create an instance of SGCTATrainTool with `+(id)trainToolWithApiKey:(NSString *)incomingApiKey`
* Then, using the instance you just created, call either `-(void)getCTAInfoForStopID:(NSString *)stopID andMaxResponses:(int)maxResponses withCallback:(void (^)(SGTrainResponse *, NSError *))trainHandler` or `-(void)getCTAInfoForMapID:(NSString *)mapID andMaxResponses:(int)maxResponses withCallback:(void (^)(SGTrainResponse *, NSError *))trainHandler` to get the response in the form of a SGTrainResponse object.

If you want to use your own Network service, you can just use `SGTrainResponseGenerator` with `+ (SGTrainResponse *)trainResponseFromXMLData:(NSData *)xmlData` to get a SGTrainResponse object.

NOTE: You can find the MapIDs under "Parent Stop ID" and StopIDs under "Individual Stop IDs" at the CTA api site.

Need to know more about the [CTA Train Api](http://www.transitchicago.com/developers/ttdocs/default.aspx)?
 