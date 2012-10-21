<cfcomponent name="applicationResources">
	<cffunction name="decLookup" access="remote" output="false" returntype="query">
		<cfset var qLookup="">
		<cfquery name="qLookup" datasource="appmanage">
SELECT    id, decision
FROM      decision
		</cfquery>
		<cfreturn qLookup>
	</cffunction>
	
	<cffunction name="citizLookup" access="remote" output="false" returntype="query">
		<cfset var qLookup="">
		<cfquery name="qLookup" datasource="appmanage">
SELECT    id, citizenship
FROM      citizenship
		</cfquery>
		<cfreturn qLookup>
	</cffunction>

	<cffunction name="programLookup" access="remote" output="false" returntype="query">
		<cfset var qLookup="">
		<cfquery name="qLookup" datasource="appmanage">
SELECT    id, program
FROM      program
		</cfquery>
		<cfreturn qLookup>
	</cffunction>

	<cffunction name="sessionLookup" access="remote" output="false" returntype="query">
		<cfset var qLookup="">
		<cfquery name="qLookup" datasource="appmanage">
SELECT    id, session
FROM      semesters
		</cfquery>
		<cfreturn qLookup>
	</cffunction>
</cfcomponent>