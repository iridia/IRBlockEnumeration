//	IRBlockEnumeration.j
//	Evadne Wu at Iridia, 2010
	
@import <Foundation/CPArray.j>
@import <Foundation/CPDictionary.j>





@implementation CPDictionary (BlockEnumeration)

- (void) enumerate:(Function)enumerationBlock {

	for (key in _buckets)
	if (_buckets.hasOwnProperty(key))
	if (!enumerationBlock(key, _buckets[key])) return;

}

@end

@implementation CPArray (BlockEnumeration)

- (void) enumerate:(Function)enumerationBlock {

	for (object in self)
	if (self.hasOwnProperty(object))
	if (!enumerationBlock(self[object])) return;

}

@end




