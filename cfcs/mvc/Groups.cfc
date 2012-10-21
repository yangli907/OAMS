<cfcomponent>
	<cffunction name="getMasterQuery" output="false" access="remote" returntype="query">
		<cfargument name="ID" required="false">
        <cfargument name="sgrp" required="true">
		<cfset var qRead="">

		<cfquery name="qRead" datasource="framework">
SELECT    id, name
FROM      groups 
WHERE sgrp = <cfqueryparam cfsqltype="cf_sql_integer" value="#arguments.sgrp#" />
		</cfquery>

		<cfreturn qRead>
	</cffunction>

	<cffunction name="deleteItem" output="false" access="remote" returntype="void">
		<cfargument name="ID" required="true">

		<cfscript>
			var groupsGateway = createObject("component", "framework.cfcs.mvc.Edit_groups.groupsGateway");
			groupsGateway.deleteByID(arguments.ID);
		</cfscript>
	</cffunction>
</cfcomponent>
