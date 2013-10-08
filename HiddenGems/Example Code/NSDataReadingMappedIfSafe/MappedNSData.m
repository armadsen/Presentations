#import <Foundation/Foundation.h>

int main(int argc, char *argv[]) {
	@autoreleasepool {

NSString *filePath = [@"~/Desktop/bigfile" stringByExpandingTildeInPath]; // ~1GB
//NSData *data = [[NSData alloc] initWithContentsOfFile:filePath 
options:0 
error:NULL]; // Normal, non-mapped
NSData *data = [[NSData alloc] initWithContentsOfFile:filePath 
											   options:NSDataReadingMappedIfSafe 
											     error:NULL]; // Mapped

NSData *last10Bytes = [data subdataWithRange:NSMakeRange([data length]-10, 10)];
NSInteger sum = 0;
int8_t *bytes = (int8_t *)[last10Bytes bytes];
for (NSUInteger i=0; i<[last10Bytes length]; i++) { sum += *(bytes+i); }

NSLog(@"Number of bytes: %lu sum: %li", (unsigned long)numBytes, (long)sum);

while(1) {}
[data release];
	}
}