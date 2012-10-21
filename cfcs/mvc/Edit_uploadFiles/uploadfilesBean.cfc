<cfcomponent output="false" alias="appmanage.cfcs.mvc.Edit_uploadFiles.uploadfilesBean">
	<!---
		 These are properties that are exposed by this CFC object.
		 These property definitions are used when calling this CFC as a web services, 
		 passed back to a flash movie, or when generating documentation

		 NOTE: these cfproperty tags do not set any default property values.
	--->
	<cfproperty name="id" type="numeric" default="0">
	<cfproperty name="aid" type="numeric" default="0">
	<cfproperty name="filename" type="string" default="">
	<cfproperty name="originalname" type="string" default="">
	<cfproperty name="path" type="string" default="">
	<cfproperty name="user" type="string" default="">

	<cfscript>
		//Initialize the CFC with the default properties values.
		variables.id = 0;
		variables.aid = 0;
		variables.filename = "";
		variables.originalname = "";
		variables.path = "";
		variables.user = "";
	</cfscript>

	<cffunction name="init" output="false" returntype="uploadfilesBean">
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

	<cffunction name="getFilename" output="false" access="public" returntype="any">
		<cfreturn variables.Filename>
	</cffunction>

	<cffunction name="setFilename" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfset variables.Filename = arguments.val>
	</cffunction>

	<cffunction name="getOriginalname" output="false" access="public" returntype="any">
		<cfreturn variables.Originalname>
	</cffunction>

	<cffunction name="setOriginalname" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfset variables.Originalname = arguments.val>
	</cffunction>

	<cffunction name="getPath" output="false" access="public" returntype="any">
		<cfreturn variables.Path>
	</cffunction>

	<cffunction name="setPath" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfset variables.Path = arguments.val>
	</cffunction>

	<cffunction name="getUser" output="false" access="public" returntype="any">
		<cfreturn variables.User>
	</cffunction>

	<cffunction name="setUser" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfset variables.User = arguments.val>
	</cffunction>



</cfcomponent>