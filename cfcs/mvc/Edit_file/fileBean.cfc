<cfcomponent output="false" alias="appmanage.cfcs.mvc.Edit_file.fileBean">
	<!---
		 These are properties that are exposed by this CFC object.
		 These property definitions are used when calling this CFC as a web services, 
		 passed back to a flash movie, or when generating documentation

		 NOTE: these cfproperty tags do not set any default property values.
	--->
	<cfproperty name="id" type="numeric" default="0">
	<cfproperty name="aid" type="numeric" default="0">
	<cfproperty name="name" type="string" default="">
	<cfproperty name="path" type="string" default="">
	<cfproperty name="typeid" type="numeric" default="0">

	<cfscript>
		//Initialize the CFC with the default properties values.
		variables.id = 0;
		variables.aid = 0;
		variables.name = "";
		variables.path = "";
		variables.typeid = 0;
	</cfscript>

	<cffunction name="init" output="false" returntype="fileBean">
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

	<cffunction name="getAid" output="false" access="public" returntype="any">
		<cfreturn variables.Aid>
	</cffunction>

	<cffunction name="setAid" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.Aid = arguments.val>
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

	<cffunction name="getPath" output="false" access="public" returntype="any">
		<cfreturn variables.Path>
	</cffunction>

	<cffunction name="setPath" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfset variables.Path = arguments.val>
	</cffunction>

	<cffunction name="getTypeid" output="false" access="public" returntype="any">
		<cfreturn variables.Typeid>
	</cffunction>

	<cffunction name="setTypeid" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.Typeid = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>



</cfcomponent>