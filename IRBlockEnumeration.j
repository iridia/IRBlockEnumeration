//	IRBlockEnumeration.j
//	Evadne Wu at Iridia, 2010
	
@import <Foundation/CPArray.j>
@import <Foundation/CPDictionary.j>





IRTerminateEnumeration = @"IRTerminateEnumeration";

@implementation CPDictionary (BlockEnumeration)

- (void) enumerate:(Function)enumerationBlock {

	var enumerator = [self keyEnumerator], object = nil;
	while (key = [enumerator nextObject]) {
		
		if (enumerationBlock(key, [self objectForKey:key]) == IRTerminateEnumeration)
		return;
		
	}

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

- (void) enumerateWithIndexesAndObjects:(Function)enumerationBlock {
	
	var enumerator = [self objectEnumerator], object = nil, index = 0;
	
	while (object = [enumerator nextObject]) {
		
		if (enumerationBlock(index, object) == IRTerminateEnumeration)
		return;
		
		index ++;
		
	}

}

@end




