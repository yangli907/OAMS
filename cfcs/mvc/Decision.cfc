<cfcomponent>
	<cffunction name="getMasterQuery" output="false" access="remote" returntype="query">
		<cfargument name="ID" required="false">
		<cfset var qRead="">

		<cfquery name="qRead" datasource="appmanage">
SELECT    id,decision
FROM      decision
ORDER BY	id
		</cfquery>

		<cfreturn qRead>
	</cffunction>
	
	<cffunction name="deleteItem" output="false" access="remote" returntype="void">
		<cfargument name="ID" required="true">

		<cfscript>
			var decisionGateway = createObject("component", "appmanage.cfcs.mvc.Edit_decision.decisionGateway");
			decisionGateway.deleteByID(arguments.ID);
		</cfscript>
	</cffunction>
</cfcomponent>