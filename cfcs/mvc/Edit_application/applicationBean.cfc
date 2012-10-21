<cfcomponent output="false" alias="appmanage.cfcs.mvc.Edit_application.applicationBean">
	<!---
		 These are properties that are exposed by this CFC object.
		 These property definitions are used when calling this CFC as a web services, 
		 passed back to a flash movie, or when generating documentation

		 NOTE: these cfproperty tags do not set any default property values.
	--->
	<cfproperty name="id" type="numeric" default="0">
	<cfproperty name="sid" type="numeric" default="0">
	<cfproperty name="decid" type="numeric" default="0">
	<cfproperty name="citizid" type="numeric" default="0">
	<cfproperty name="progcode" type="numeric" default="0">
	<cfproperty name="sessionid" type="numeric" default="0">
	<cfproperty name="batrans" type="string" default="">
	<cfproperty name="matrans" type="string" default="">
	<cfproperty name="grev" type="string" default="">
	<cfproperty name="greq" type="string" default="">
	<cfproperty name="grea" type="string" default="">
	<cfproperty name="toefl" type="string" default="">
	<cfproperty name="letter1" type="string" default="">
	<cfproperty name="letter2" type="string" default="">
	<cfproperty name="letter3" type="string" default="">

	<cfscript>
		//Initialize the CFC with the default properties values.
		variables.id = 0;
		variables.sid = 0;
		variables.decid = 0;
		variables.citizid = 0;
		variables.progcode = 0;
		variables.sessionid = 0;
		variables.batrans = "";
		variables.matrans = "";
		variables.grev = "";
		variables.greq = "";
		variables.grea = "";
		variables.toefl = "";
		variables.letter1 = "";
		variables.letter2 = "";
		variables.letter3 = "";
	</cfscript>

	<cffunction name="init" output="false" returntype="applicationBean">
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

	<cffunction name="getDecid" output="false" access="public" returntype="any">
		<cfreturn variables.Decid>
	</cffunction>

	<cffunction name="setDecid" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.Decid = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getCitizid" output="false" access="public" returntype="any">
		<cfreturn variables.Citizid>
	</cffunction>

	<cffunction name="setCitizid" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.Citizid = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getProgcode" output="false" access="public" returntype="any">
		<cfreturn variables.Progcode>
	</cffunction>

	<cffunction name="setProgcode" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.Progcode = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getSessionid" output="false" access="public" returntype="any">
		<cfreturn variables.Sessionid>
	</cffunction>

	<cffunction name="setSessionid" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.Sessionid = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>
	<cffunction name="getBatrans" output="false" access="public" returntype="any">
		<cfreturn variables.Batrans>
	</cffunction>

	<cffunction name="setBatrans" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfset variables.Batrans = arguments.val>
	</cffunction>

	<cffunction name="getMatrans" output="false" access="public" returntype="any">
		<cfreturn variables.Matrans>
	</cffunction>

	<cffunction name="setMatrans" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfset variables.Matrans = arguments.val>
	</cffunction>

	<cffunction name="getGrev" output="false" access="public" returntype="any">
		<cfreturn variables.Grev>
	</cffunction>

	<cffunction name="setGrev" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfset variables.Grev = arguments.val>
	</cffunction>

	<cffunction name="getGreq" output="false" access="public" returntype="any">
		<cfreturn variables.Greq>
	</cffunction>

	<cffunction name="setGreq" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfset variables.Greq = arguments.val>
	</cffunction>
	
	<cffunction name="getGrea" output="false" access="public" returntype="any">
		<cfreturn variables.Grea>
	</cffunction>

	<cffunction name="setGrea" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfset variables.Grea = arguments.val>
	</cffunction>
	<cffunction name="getToefl" output="false" access="public" returntype="any">
		<cfreturn variables.Toefl>
	</cffunction>

	<cffunction name="setToefl" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfset variables.Toefl = arguments.val>
	</cffunction>

	<cffunction name="getLetter1" output="false" access="public" returntype="any">
		<cfreturn variables.Letter1>
	</cffunction>
	<cffunction name="setLetter1" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfset variables.Letter1 = arguments.val>
	</cffunction>
	<cffunction name="getLetter2" output="false" access="public" returntype="any">
		<cfreturn variables.Letter2>
	</cffunction>
	<cffunction name="setLetter2" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfset variables.Letter2 = arguments.val>
	</cffunction>
	<cffunction name="getLetter3" output="false" access="public" returntype="any">
		<cfreturn variables.Letter3>
	</cffunction>
	<cffunction name="setLetter3" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfset variables.Letter3 = arguments.val>
	</cffunction>
</cfcomponent>