<cfcomponent output="false" alias="framework.cfcs.mvc.Edit_groups.groupsBean">
	<!---
		 These are properties that are exposed by this CFC object.
		 These property definitions are used when calling this CFC as a web services, 
		 passed back to a flash movie, or when generating documentation

		 NOTE: these cfproperty tags do not set any default property values.
	--->
	<cfproperty name="id" type="numeric" default="0">
	<cfproperty name="name" type="string" default="">
	<cfproperty name="sgrp" type="numeric" default="0">

	<cfscript>
		//Initialize the CFC with the default properties values.
		variables.id = 0;
		variables.name = "";
		variables.sgrp = 0;
	</cfscript>

	<cffunction name="init" output="false" returntype="groupsBean">
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

	<cffunction name="getName" output="false" access="public" returntype="any">
		<cfreturn variables.Name>
	</cffunction>

	<cffunction name="setName" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfset variables.Name = arguments.val>
	</cffunction>

	<cffunction name="getSgrp" output="false" access="public" returntype="any">
		<cfreturn variables.Sgrp>
	</cffunction>

	<cffunction name="setSgrp" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.Sgrp = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>



</cfcomponent>