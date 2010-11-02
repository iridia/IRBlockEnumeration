//	IRBlockEnumeration.j
//	Evadne Wu at Iridia, 2010
	
@import <Foundation/CPArray.j>
@import <Foundation/CPDictionary.j>





IRTerminateEnumeration = @"IRTerminateEnumeration";

@implementation CPDictionary (BlockEnumeration)

- (void) enumerate:(Function)enumerationBlock {

	for (key in _buckets)
	if (_buckets.hasOwnProperty(key))
	if (!enumerationBlock(key, _buckets[key])) return;

}

@end

@implementation CPArray (BlockEnumeration)

- (void) enumerate:(Function)enumerationBlock {

	var enumerator = [self objectEnumerator], object = nil;
	while (object = [enumerator nextObject]) {
		
		if (enumerationBlock(object) == IRTerminateEnumeration)
		return;
		
	}

}

@end




