<cfcomponent>
	<cffunction name="getMasterQuery" output="false" access="remote" returntype="query">
		<cfargument name="ID" required="false">
		<cfset var qRead="">

		<cfquery name="qRead" datasource="appmanage">
SELECT    phone.id,stuinfo.pid as pid,stuinfo.fname,stuinfo.lname,phone.phone as phone
FROM      phone
LEFT JOIN stuinfo ON phone.sid=stuinfo.id
ORDER BY	phone.id
		</cfquery>

		<cfreturn qRead>
	</cffunction>
	
	<cffunction name="getSubQuery" output="false" access="remote" returntype="query">
		<cfargument name="id" required="false">
		<cfset var qRead="">
		<cfquery name="qRead" datasource="appmanage">
SELECT    phone.id,sid,stuinfo.pid as pid,stuinfo.fname,stuinfo.lname,phone.phone as phone
FROM      phone
LEFT JOIN stuinfo ON phone.sid=stuinfo.id
WHERE phone.sid = <cfqueryparam cfsqltype="cf_sql_integer" value="#arguments.id#" />
ORDER BY	phone.id
		</cfquery>
		<cfreturn qRead>
	</cffunction>
	
	<cffunction name="deleteItem" output="false" access="remote" returntype="void">
		<cfargument name="ID" required="true">

		<cfscript>
			var phoneGateway = createObject("component", "appmanage.cfcs.mvc.Edit_phone.phoneGateway");
			phoneGateway.deleteByID(arguments.ID);
		</cfscript>
	</cffunction>
</cfcomponent>