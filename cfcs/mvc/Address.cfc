<cfcomponent>
	<cffunction name="getMasterQuery" output="false" access="remote" returntype="query">
		<cfargument name="ID" required="false">
		<cfset var qRead="">

		<cfquery name="qRead" datasource="appmanage">
SELECT    address.id,stuinfo.pid as pid,stuinfo.fname as fname, stuinfo.lname as lname, sid,address1,address2,city,state,country,zip,phone,email
FROM      address
LEFT JOIN stuinfo ON  address.sid=stuinfo.id

		</cfquery>
		<cfreturn qRead>
	</cffunction>

	<cffunction name="getSubQuery" output="false" access="remote" returntype="query">
		<cfargument name="id" required="false">
		<cfset var qRead="">
		<cfquery name="qRead" datasource="appmanage">
SELECT    address.id,stuinfo.pid as pid, sid,address1,address2,city,state,country,zip,phone,email
FROM      address
LEFT JOIN stuinfo ON  address.sid=stuinfo.id
WHERE address.sid = <cfqueryparam cfsqltype="cf_sql_integer" value="#arguments.id#" />
ORDER BY	address.id
		</cfquery>
		<cfreturn qRead>
	</cffunction>	
	<cffunction name="getCategoryResult" output="false" access="remote" returntype="query">
		<cfargument name="name" required="false">
		<cfset var qRead="">
		<cfquery name="qRead" datasource="appmanage">
SELECT    stuinfo.fname as fname, stuinfo.lname as lname,address.id,stuinfo.pid as pid, address.sid as sid,address1,address2,city,state,country,zip,phone,email
FROM      address
LEFT JOIN stuinfo ON address.sid=stuinfo.id
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
SELECT    stuinfo.fname as fname, stuinfo.lname as lname,address.id,stuinfo.pid as pid, address.sid as sid,address1,address2,city,state,country,zip,phone,email
FROM      address
LEFT JOIN stuinfo ON address.sid=stuinfo.id
LEFT JOIN application ON application.sid = stuinfo.id
LEFT JOIN program ON application.progcode= program.id

WHERE program.grpid = <cfqueryparam cfsqltype="cf_sql_string" value="#arguments.name#" />
		</cfquery>
		<cfreturn qRead>
	</cffunction>	
	
	<cffunction name="deleteItem" output="false" access="remote" returntype="void">
		<cfargument name="ID" required="true">
		<cfscript>
			var addressGateway = createObject("component", "appmanage.cfcs.mvc.Edit_address.addressGateway");
			addressGateway.deleteByID(arguments.ID);
		</cfscript>
	</cffunction>
</cfcomponent>
