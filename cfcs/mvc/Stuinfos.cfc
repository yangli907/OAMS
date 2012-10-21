<cfcomponent>
	<cffunction name="getMasterQuery" output="false" access="remote" returntype="query">
		<cfargument name="ID" required="false">
		<cfset var qRead="">

		<cfquery name="qRead" datasource="appmanage">
SELECT    stuinfo.id,pid,fname,lname,gender,phone.phone as phone
FROM      stuinfo
LEFT JOIN phone ON phone.sid=stuinfo.id
ORDER BY	stuinfo.id
		</cfquery>

		<cfreturn qRead>
	</cffunction> 
	
	<cffunction name="getSearchResult" output="false" access="remote" returntype="query">
		<cfargument name="name" required="false">
		<cfset var qRead="">

		<cfquery name="qRead" datasource="appmanage">
SELECT    stuinfo.id,pid,fname,lname,gender
FROM      stuinfo
WHERE lname like <cfqueryparam  cfsqltype="cf_sql_string" value="%#arguments.name#%" />
OR fname like <cfqueryparam  cfsqltype="cf_sql_string" value="%#arguments.name#%" />
OR pid like <cfqueryparam  cfsqltype="cf_sql_string" value="%#arguments.name#%" />
ORDER BY	stuinfo.id
		</cfquery>

		<cfreturn qRead>
	</cffunction> 

	<cffunction name="getCategoryResult" output="false" access="remote" returntype="query">
		<cfargument name="name" required="false">
		<cfset var qRead="">
		<cfquery name="qRead" datasource="appmanage">
SELECT    stuinfo.id as id,pid,fname,lname,gender
FROM      stuinfo
LEFT JOIN application ON application.sid = stuinfo.id
LEFT JOIN program ON application.progcode= program.id
WHERE program.program = <cfqueryparam cfsqltype="cf_sql_string" value="#arguments.name#" />
		</cfquery>
		<cfreturn qRead>
	</cffunction>

	<cffunction name="getDeptResult" output="false" access="remote" returntype="query">
		<cfargument name="name" required="false">
		<cfset var qRead="">
		<cfquery name="qRead" datasource="appmanage">
SELECT    stuinfo.id as id,pid,fname,lname,gender
FROM      stuinfo
LEFT JOIN application ON application.sid = stuinfo.id
LEFT JOIN program ON application.progcode= program.id
WHERE program.grpid = <cfqueryparam cfsqltype="cf_sql_string" value="#arguments.name#" />
		</cfquery>
		<cfreturn qRead>
	</cffunction>
	
	<cffunction name="deleteItem" output="false" access="remote" returntype="void">
		<cfargument name="ID" required="true">
		<cfscript>
			var stuinfoGateway = createObject("component", "appmanage.cfcs.mvc.Edit_stuinfo.stuinfoGateway");
			stuinfoGateway.deleteByID(arguments.ID);
		</cfscript>
	</cffunction>
</cfcomponent>