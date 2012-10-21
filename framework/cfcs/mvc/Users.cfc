<cfcomponent>
	<cffunction name="getMasterQuery" output="false" access="remote" returntype="query">
		<cfargument name="ID" required="false">
        <cfargument name="sgrp" required="true">
		<cfset var qRead="">

		<cfquery name="qRead" datasource="framework">
SELECT    users.id, last, first, email, loc, groups.name as grp
FROM      users
LEFT JOIN groups ON groups.id = users.grp
WHERE users.sgrp = <cfqueryparam cfsqltype="cf_sql_integer" value="#arguments.sgrp#" />
		</cfquery>

		<cfreturn qRead>
	</cffunction>

	<cffunction name="deleteItem" output="false" access="remote" returntype="void">
		<cfargument name="ID" required="true">

		<cfscript>
			var usersGateway = createObject("component", "framework.cfcs.mvc.Edit_users.usersGateway");
			usersGateway.deleteByID(arguments.ID);
		</cfscript>
	</cffunction>
</cfcomponent>
