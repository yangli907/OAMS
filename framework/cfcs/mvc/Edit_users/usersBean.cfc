<cfcomponent output="false" alias="framework.cfcs.mvc.Edit_users.usersBean">
	<!---
		 These are properties that are exposed by this CFC object.
		 These property definitions are used when calling this CFC as a web services, 
		 passed back to a flash movie, or when generating documentation

		 NOTE: these cfproperty tags do not set any default property values.
	--->
	<cfproperty name="id" type="numeric" default="0">
	<cfproperty name="first" type="string" default="">
	<cfproperty name="last" type="string" default="">
	<cfproperty name="email" type="string" default="">
	<cfproperty name="phone" type="string" default="">
	<cfproperty name="loc" type="string" default="">
	<cfproperty name="grp" type="numeric" default="0">
	<cfproperty name="pass" type="string" default="">
	<cfproperty name="admin" type="numeric" default="0">
	<cfproperty name="sgrp" type="numeric" default="0">
	<cfproperty name="sgadmin" type="numeric" default="0">

	<cfscript>
		//Initialize the CFC with the default properties values.
		variables.id = 0;
		variables.first = "";
		variables.last = "";
		variables.email = "";
		variables.phone = "";
		variables.loc = "";
		variables.grp = 0;
		variables.pass = "";
		variables.admin = 0;
		variables.sgrp = 0;
		variables.sgadmin = 0;
	</cfscript>

	<cffunction name="init" output="false" returntype="usersBean">
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

	<cffunction name="getFirst" output="false" access="public" returntype="any">
		<cfreturn variables.First>
	</cffunction>

	<cffunction name="setFirst" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfset variables.First = arguments.val>
	</cffunction>

	<cffunction name="getLast" output="false" access="public" returntype="any">
		<cfreturn variables.Last>
	</cffunction>

	<cffunction name="setLast" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfset variables.Last = arguments.val>
	</cffunction>

	<cffunction name="getEmail" output="false" access="public" returntype="any">
		<cfreturn variables.Email>
	</cffunction>

	<cffunction name="setEmail" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfset variables.Email = arguments.val>
	</cffunction>

	<cffunction name="getPhone" output="false" access="public" returntype="any">
		<cfreturn variables.Phone>
	</cffunction>

	<cffunction name="setPhone" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfset variables.Phone = arguments.val>
	</cffunction>

	<cffunction name="getLoc" output="false" access="public" returntype="any">
		<cfreturn variables.Loc>
	</cffunction>

	<cffunction name="setLoc" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfset variables.Loc = arguments.val>
	</cffunction>

	<cffunction name="getGrp" output="false" access="public" returntype="any">
		<cfreturn variables.Grp>
	</cffunction>

	<cffunction name="setGrp" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.Grp = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getPass" output="false" access="public" returntype="any">
		<cfreturn variables.Pass>
	</cffunction>

	<cffunction name="setPass" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfset variables.Pass = arguments.val>
	</cffunction>

	<cffunction name="getAdmin" output="false" access="public" returntype="any">
		<cfreturn variables.Admin>
	</cffunction>

	<cffunction name="setAdmin" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.Admin = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
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

	<cffunction name="getSgadmin" output="false" access="public" returntype="any">
		<cfreturn variables.Sgadmin>
	</cffunction>

	<cffunction name="setSgadmin" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.Sgadmin = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>



</cfcomponent>