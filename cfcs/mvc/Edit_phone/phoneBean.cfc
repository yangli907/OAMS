<cfcomponent output="false" alias="appmanage.cfcs.mvc.Edit_phone.phoneBean">
	<!---
		 These are properties that are exposed by this CFC object.
		 These property definitions are used when calling this CFC as a web services, 
		 passed back to a flash movie, or when generating documentation

		 NOTE: these cfproperty tags do not set any default property values.
	--->
	<cfproperty name="id" type="numeric" default="0">
	<cfproperty name="sid" type="numeric" default="0">
	<cfproperty name="phone" type="string" default="">

	<cfscript>
		//Initialize the CFC with the default properties values.
		variables.id = 0;
		variables.sid = 0;
		variables.phone = "";
	</cfscript>

	<cffunction name="init" output="false" returntype="phoneBean">
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

	<cffunction name="getSid" output="false" access="public" returntype="any">
		<cfreturn variables.Sid>
	</cffunction>

	<cffunction name="setSid" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.Sid = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getPhone" output="false" access="public" returntype="any">
		<cfreturn variables.Phone>
	</cffunction>

	<cffunction name="setPhone" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfset variables.Phone = arguments.val>
	</cffunction>



</cfcomponent>