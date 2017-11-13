//
//  DatabaseManager.h
//  CorporationCommunication
//
//  Created by mac on 11-10-10.
//  Copyright 2011 __QQ_363544017__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <sqlite3.h>

#define database_name @"tao2.sqlite3"
#define field_string @"str"
#define field_bool @"bool"
#define field_time @"time"
#define field_int @"int"
#define field_char @"char"

@interface DatabaseManager : NSObject {
	
	sqlite3 *m_database;
}

+(DatabaseManager *)getInstance;
+(void)destroyInstace;

-(void)initDatabase;

-(void)openDatabase;

-(sqlite3 *)getDatabase;

-(void)createTableids;

-(BOOL)insertTable:(NSString *)tableName WithParameterArray:(NSArray *)array;
-(BOOL)execSQL:(NSString *)sql;

-(NSMutableArray *)selectSQL:(NSString *)sql;


@end
