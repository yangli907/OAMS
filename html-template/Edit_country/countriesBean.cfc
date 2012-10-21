<cfcomponent output="false" alias="cfcs.mvc.Edit_mail.countriesBean">
	<!---
		 These are properties that are exposed by this CFC object.
		 These property definitions are used when calling this CFC as a web services, 
		 passed back to a flash movie, or when generating documentation

		 NOTE: these cfproperty tags do not set any default property values.
	--->
	<cfproperty name="iso" type="string" default="">
	<cfproperty name="name" type="string" default="">

	<cfscript>
		//Initialize the CFC with the default properties values.
		variables.iso = "";
		variables.name = "";
	</cfscript>

	<cffunction name="init" output="false" returntype="countriesBean">
		<cfreturn this>
	</cffunction>
	<cffunction name="getIso" output="false" access="public" returntype="any">
		<cfreturn variables.Iso>
	</cffunction>

	<cffunction name="setIso" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfset variables.Iso = arguments.val>
	</cffunction>

	<cffunction name="getName" output="false" access="public" returntype="any">
		<cfreturn variables.Name>
	</cffunction>

	<cffunction name="setName" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfset variables.Name = arguments.val>
	</cffunction>



</cfcomponent>