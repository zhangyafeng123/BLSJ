//
//  DatabaseManager.m
//  CorporationCommunication
//
//  Created by mac on 11-10-10.
//  Copyright 2011 __QQ_363544017__. All rights reserved.
//

#import "DatabaseManager.h"

static DatabaseManager *shareInstance;

@implementation DatabaseManager

+(DatabaseManager *)getInstance
{
	if(shareInstance == nil)
	{
		[shareInstance = [DatabaseManager alloc] init];
		[shareInstance openDatabase];
	}
	return shareInstance;
}

+(void)destroyInstace
{
	if(shareInstance)
	{
		//[shareInstance release];
		shareInstance = nil;
	}
}

-(void)initDatabase
{
	[self openDatabase];
	[self createTableids];
	
}

-(void)createTableids
{
	NSString *sqlv = @"CREATE TABLE IF NOT EXISTS lv (gj1_5 VARCHAR(20),gj_6 VARCHAR(20),sy1 VARCHAR(20),sy2_3 VARCHAR(20),sy4_5 VARCHAR(20),sy6 VARCHAR(20),ip VARCHAR(40),idd VARCHAR(10),ifin VARCHAR(10));";
    
	NSString *sql =  @"SELECT * FROM sqlite_master where type='table' and NAME='lv'";
	
	sqlite3_stmt *stmt;
	
	if (sqlite3_prepare_v2(m_database, [sql UTF8String], strlen([sql UTF8String]), &stmt, nil) == SQLITE_OK)
	{
//		NSLog(@"打开了");
		if ( sqlite3_step(stmt) != SQLITE_ROW) {
			
			[self execSQL:sqlv];
			[self execSQL:@"INSERT INTO lv (gj1_5,gj_6,sy1,sy2_3,sy4_5,sy6,ip,idd,ifin) VALUES ('4.45','4.9','6.56','6.65','6.90','7.05','192.168.1.118:8099','1011','YES');"];
			
			
			
			sqlite3_finalize(stmt);
		}
		
	}else {
		NSLog(@"sql err;");
	}
	
	
	}
-(void)openDatabase
{
	NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    
    NSString *packagePath = [paths objectAtIndex:0];
    NSString *filePath = [packagePath stringByAppendingPathComponent:database_name];
    
    if(sqlite3_open([filePath UTF8String], &m_database) != SQLITE_OK)
    {
        NSAssert(0, @"Failed to open the database");
    }
    
}

#pragma mark 
-(BOOL)insertTable:(NSString *)tableName WithParameterArray:(NSArray *)array
{
	if(array == nil)
		return NO;
	
	NSString *sql = [NSString stringWithFormat:@"INSERT INTO %@ (",tableName];

	for (int i = 0; i < [array count]; i++)
	{   
		NSDictionary *dic = [array objectAtIndex:i];
		NSString *key = [dic objectForKey:@"key"];
		if(i == [array count] - 1)
			sql = [sql stringByAppendingFormat:@" %@) values(",key];
		else
			sql = [sql stringByAppendingFormat:@"%@,",key];
	}
		
	for (int i = 0; i < [array count]; i++)
	{
		NSDictionary *dic = [array objectAtIndex:i];
		NSString *value = [dic objectForKey:@"value"];
		NSString *type = [dic objectForKey:@"type"];
		
		if([type compare:field_int] == NSOrderedSame || [type compare:field_bool] == NSOrderedSame)
			sql = [sql stringByAppendingFormat:@"%@",value];
		else
			sql = [sql stringByAppendingFormat:@"\"%@\"",value];
		
		if(i == [array count] - 1)
			sql = [sql stringByAppendingFormat:@");"];
		else 
			sql = [sql stringByAppendingFormat:@","];
	}
	//NSLog(sql);
	BOOL result = [self execSQL:sql];
	return result;
}

-(BOOL)execSQL:(NSString *)sql
{
	//NSLog(@"%@",sql);
	char *error;
	if (sqlite3_exec(m_database, [sql UTF8String], NULL, NULL, &error) != SQLITE_OK)
    {
		printf("database operate error:%s",error);
		sqlite3_free(error);
		return NO;
    }
	else
		NSLog(@"database operate success");
	return YES;
}

#pragma mark 
#pragma mark 查询
-(NSMutableArray *)selectSQL:(NSString *)sql
{
	//NSLog(@"%@",sql);
	NSMutableArray *rootArray = nil;
	sqlite3_stmt* statement;

    if (sqlite3_prepare_v2(m_database, [sql UTF8String], -1, &statement, nil) == SQLITE_OK) 
	{
		int col_count = sqlite3_column_count(statement);
		rootArray = [[NSMutableArray alloc] initWithCapacity:col_count];
        while (sqlite3_step(statement)== SQLITE_ROW)
		{
			NSMutableArray *array = [NSMutableArray array];
			[rootArray addObject:array];
			
			for (int i = 0; i < col_count; i++)
			{
				char* c = (char*)sqlite3_column_text(statement, i);    
				if(c != NULL)
				{
					NSString *result = [NSString stringWithCString:c encoding:NSUTF8StringEncoding];
					//NSLog(@"%@",result);
					[array addObject:result];
				}
			}
        }
    }
    sqlite3_finalize(statement);
	
	return rootArray;
}


-(sqlite3 *)getDatabase
{
	return m_database;
}

-(void)dealloc
{
	if(m_database)
	{
		sqlite3_close(m_database);
		m_database = nil;
	}
	//[super dealloc];
}


@end
