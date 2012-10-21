<cfcomponent>
	<cffunction name="getMasterQuery" output="false" access="remote" returntype="query">
		<cfargument name="ID" required="false">
		<cfset var qRead="">

		<cfquery name="qRead" datasource="appmanage">
SELECT    application.id,stuinfo.pid as pid,application.sid as sid,stuinfo.fname as fname, stuinfo.lname as lname ,decid,citizid,program.progcode as progcode,sessionid,citizenship.citizenship,program.program,decision.decision, semesters.session,batrans,matrans,grev,greq,grea,toefl,letter1,letter2,letter3
FROM      application
LEFT JOIN stuinfo ON sid=stuinfo.id
LEFT JOIN citizenship ON citizid= citizenship.id
LEFT JOIN program ON application.progcode= program.id
LEFT JOIN decision ON decid= decision.id
LEFT JOIN semesters ON sessionid= semesters.id
		</cfquery>
		<cfreturn qRead>
	</cffunction>

	<cffunction name="getPid" output="false" access="remote" returntype="query">
		<cfargument name="ID" required="false">
		<cfset var qRead="">

		<cfquery name="qRead" datasource="appmanage">
SELECT    application.id,stuinfo.pid as pid,application.sid as sid,stuinfo.fname as fname, stuinfo.lname as lname
FROM      application
LEFT JOIN stuinfo ON sid=stuinfo.id
where application.sid = stuinfo.id
		</cfquery>
		<cfreturn qRead>
	</cffunction>

	
	<cffunction name="getSearchResult" output="false" access="remote" returntype="query">
		<cfargument name="name" required="false">
		<cfset var qRead="">
		<cfquery name="qRead" datasource="appmanage">
SELECT    application.id as id,application.sid as sid,stuinfo.pid as pid,stuinfo.fname,stuinfo.lname,decid,citizid,program.progcode,sessionid,citizenship.citizenship,program.program,decision.decision, semesters.session,batrans,matrans,grev,greq,grea,toefl,letter1,letter2,letter3
FROM      application
LEFT JOIN stuinfo ON application.sid = stuinfo.id
LEFT JOIN citizenship ON citizid= citizenship.id
LEFT JOIN program ON application.progcode= program.id
LEFT JOIN decision ON decid= decision.id
LEFT JOIN semesters ON sessionid= semesters.id
WHERE stuinfo.lname like <cfqueryparam  cfsqltype="cf_sql_string" value="%#arguments.name#%" />
OR stuinfo.fname like <cfqueryparam  cfsqltype="cf_sql_string" value="%#arguments.name#%" />
OR stuinfo.pid like <cfqueryparam  cfsqltype="cf_sql_string" value="%#arguments.name#%" />
OR program.progcode like <cfqueryparam value="%#arguments.name#%" />

		</cfquery>
		<cfreturn qRead>
	</cffunction>
	
	<cffunction name="getCategoryResult" output="false" access="remote" returntype="query">
		<cfargument name="name" required="false">
		<cfset var qRead="">
		<cfquery name="qRead" datasource="appmanage">
SELECT    application.id as id,application.sid as sid,stuinfo.pid as pid,stuinfo.fname,stuinfo.lname,decid,citizid,program.progcode,sessionid,citizenship.citizenship,program.program,decision.decision, semesters.session,batrans,matrans,grev,greq,grea,toefl,letter1,letter2,letter3
FROM      application
LEFT JOIN stuinfo ON application.sid = stuinfo.id
LEFT JOIN citizenship ON citizid= citizenship.id
LEFT JOIN program ON application.progcode= program.id
LEFT JOIN decision ON decid= decision.id
LEFT JOIN semesters ON sessionid= semesters.id
WHERE program.program = <cfqueryparam cfsqltype="cf_sql_string" value="#arguments.name#" />
		</cfquery>
		<cfreturn qRead>
	</cffunction>

	<cffunction name="getDeptResult" output="false" access="remote" returntype="query">
		<cfargument name="name" required="false">
		<cfset var qRead="">
		<cfquery name="qRead" datasource="appmanage">
SELECT    application.id as id,application.sid as sid,stuinfo.pid as pid,stuinfo.fname,stuinfo.lname,decid,citizid,program.progcode,sessionid,citizenship.citizenship,program.program,decision.decision, semesters.session,batrans,matrans,grev,greq,grea,toefl,letter1,letter2,letter3
FROM      application
LEFT JOIN stuinfo ON application.sid = stuinfo.id
LEFT JOIN citizenship ON citizid= citizenship.id
LEFT JOIN program ON application.progcode= program.id
LEFT JOIN decision ON decid= decision.id
LEFT JOIN semesters ON sessionid= semesters.id
WHERE program.grpid = <cfqueryparam cfsqltype="cf_sql_string" value="#arguments.name#" />
		</cfquery>
		<cfreturn qRead>
	</cffunction>

	<cffunction name="deleteItem" output="false" access="remote" returntype="void">
		<cfargument name="ID" required="true">
		<cfscript>
			var applicationGateway = createObject("component", "appmanage.cfcs.mvc.Edit_application.applicationGateway");
			applicationGateway.deleteByID(arguments.ID);
		</cfscript>
	</cffunction>
</cfcomponent>
