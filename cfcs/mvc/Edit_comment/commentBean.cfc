<cfcomponent output="false" alias="appmanage.cfcs.mvc.Edit_comment.commentBean">
	<!---
		 These are properties that are exposed by this CFC object.
		 These property definitions are used when calling this CFC as a web services, 
		 passed back to a flash movie, or when generating documentation

		 NOTE: these cfproperty tags do not set any default property values.
	--->
	<cfproperty name="id" type="numeric" default="0">
	<cfproperty name="pid" type="numeric" default="0">
	<cfproperty name="content" type="string" default="">
	<cfproperty name="addtime" type="date" default="">
	<cfproperty name="user" type="string" default="">
	<cfproperty name="broadcast" type="numeric" default="0">

	<cfscript>
		//Initialize the CFC with the default properties values.
		variables.id = 0;
		variables.pid = 0;
		variables.content = "";
		variables.addtime = "";
		variables.user = "";
		variables.broadcast = 0;	
	</cfscript>

	<cffunction name="init" output="false" returntype="commentBean">
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

	<cffunction name="getPid" output="false" access="public" returntype="any">
		<cfreturn variables.Pid>
	</cffunction>

	<cffunction name="setPid" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.Pid = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getContent" output="false" access="public" returntype="any">
		<cfreturn variables.Content>
	</cffunction>

	<cffunction name="setContent" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfset variables.Content = arguments.val>
	</cffunction>

	<cffunction name="getAddtime" output="false" access="public" returntype="any">
		<cfreturn variables.Addtime>
	</cffunction>

	<cffunction name="setAddtime" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsDate(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.Addtime = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid date"/>
		</cfif>
	</cffunction>

	<cffunction name="getUser" output="false" access="public" returntype="any">
		<cfreturn variables.User>
	</cffunction>

	<cffunction name="setUser" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfset variables.User = arguments.val>
	</cffunction>

	<cffunction name="getBroadcast" output="false" access="public" returntype="any">
		<cfreturn variables.Broadcast>
	</cffunction>

	<cffunction name="setBroadcast" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.Broadcast = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

</cfcomponent>