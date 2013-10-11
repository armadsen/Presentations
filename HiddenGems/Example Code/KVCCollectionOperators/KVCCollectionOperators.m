#import <Foundation/Foundation.h>

@interface Company : NSObject

@property (nonatomic, strong) NSArray *departments;

@end

@interface Employee : NSObject

@property (nonatomic, strong) NSString *name;
@property (nonatomic) NSInteger salary;

@end

@interface Department : NSObject

@property (nonatomic, strong) NSArray *employees;

@end

@implementation Company
@end

@implementation Department
@end

@implementation Employee

- (BOOL)isEqual:(Employee *)otherEmployee
{
	return [self.name isEqualToString:otherEmployee.name];
}

- (NSUInteger)hash
{
	return [self.name hash];
}

- (NSString *)description
{
	return [NSString stringWithFormat:@"%@ - %@", [super description], self.name];
}

@end

int main(int argc, char *argv[]) {
	@autoreleasepool {
		
		Company *company = [Company new];

		Department *marketing = [Department new];
		Department *engineering = [Department new];		
Employee *bob = [Employee new];
Employee *steve = [Employee new];
Employee *jane = [Employee new];
Employee *michelle = [Employee new];
bob.name = @"Bob";
bob.salary = 40000;
steve.name = @"Steve";
steve.salary = 60000;
jane.name = @"Jane";
jane.salary = 90000;
michelle.name = @"Michelle";
michelle.salary = 150000;
		
		marketing.employees = @[steve, michelle];
		engineering.employees = @[bob, jane, michelle];
		company.departments = @[marketing, engineering];
		
		NSLog(@"Employees (@distinctUnionOfArrays): %@", [company valueForKeyPath:@"departments.@distinctUnionOfArrays.employees"]);
		NSLog(@"Employees (@unionOfArrays): %@", [company valueForKeyPath:@"departments.@unionOfArrays.employees"]);
		NSArray *allEmployees = [company valueForKeyPath:@"departments.@distinctUnionOfArrays.employees"];
		NSLog(@"Average employee salary: $%@", [allEmployees valueForKeyPath:@"@avg.salary"]);
		NSLog(@"Max employee salary: $%@", [allEmployees valueForKeyPath:@"@max.salary"]);
		NSLog(@"Min employee salary: $%@", [allEmployees valueForKeyPath:@"@min.salary"]);
	}
}