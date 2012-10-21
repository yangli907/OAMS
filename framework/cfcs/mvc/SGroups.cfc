<cfcomponent>
	<cffunction name="getMasterQuery" output="false" access="remote" returntype="query">
		<cfargument name="ID" required="false">
		<cfset var qRead="">

		<cfquery name="qRead" datasource="framework">
SELECT    id, name
FROM      sgroups
ORDER BY	name
		</cfquery>

		<cfreturn qRead>
	</cffunction>

	<cffunction name="deleteItem" output="false" access="remote" returntype="void">
		<cfargument name="ID" required="true">

		<cfscript>
			var sgroupsGateway = createObject("component", "framework.cfcs.mvc.Edit_sgroups.sgroupsGateway");
			sgroupsGateway.deleteByID(arguments.ID);
		</cfscript>
	</cffunction>
</cfcomponent>
