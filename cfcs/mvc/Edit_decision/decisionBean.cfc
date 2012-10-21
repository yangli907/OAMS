<cfcomponent output="false" alias="appmanage.cfcs.mvc.Edit_decision.decisionBean">
	<!---
		 These are properties that are exposed by this CFC object.
		 These property definitions are used when calling this CFC as a web services, 
		 passed back to a flash movie, or when generating documentation

		 NOTE: these cfproperty tags do not set any default property values.
	--->
	<cfproperty name="id" type="numeric" default="0">
	<cfproperty name="decision" type="string" default="">

	<cfscript>
		//Initialize the CFC with the default properties values.
		variables.id = 0;
		variables.decision = "";
	</cfscript>

	<cffunction name="init" output="false" returntype="decisionBean">
		<cfreturn this>
	</cffunction>
	<cffunction name="getId" output="false" access="public" returntype="any">
		<cfreturn variables.Id>
	</cffunction>

	<cffunction name="setId" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.Id = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getDecision" output="false" access="public" returntype="any">
		<cfreturn variables.Decision>
	</cffunction>

	<cffunction name="setDecision" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfset variables.Decision = arguments.val>
	</cffunction>



</cfcomponent>