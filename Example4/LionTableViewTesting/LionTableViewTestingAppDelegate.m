//
//  LionTableViewTestingAppDelegate.m
//  LionTableViewTesting
//
//  Created by Tomaž Kragelj on 8/28/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "Item.h"
#import "ItemCellView.h"
#import "LionTableViewTestingAppDelegate.h"

@interface LionTableViewTestingAppDelegate ()

@property (nonatomic, readonly) NSArray *items;

@end

#pragma mark -

@implementation LionTableViewTestingAppDelegate

@synthesize window = _window;
@synthesize items = _items;

#pragma mark - NSApplicationDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)note {
	// Nothing to do here for this simple app...
}

#pragma mark - Login items

- (NSArray *)items {
	if (_items) return _items;
	NSFileManager *manager = [NSFileManager defaultManager];
	NSArray *contents = [manager contentsOfDirectoryAtPath:@"/Applications" error:nil];
	NSMutableArray *items = [NSMutableArray arrayWithCapacity:[contents count]];
	[contents enumerateObjectsUsingBlock:^(NSString *filename, NSUInteger idx, BOOL *stop) {
		if ([filename hasPrefix:@"."]) return;
		Item *item = [[[Item alloc] init] autorelease];
		item.itemPath = [@"/Applications" stringByAppendingPathComponent:filename];
		[items addObject:item];
	}];
	_items = [items retain];
	return _items;
}

@end
