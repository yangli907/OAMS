<cfcomponent hint="component for Send Email">

	<cffunction name="sendEmail" access="remote" returntype="void">

		<cfargument name="ctr_your_name" type="string" required="yes">
		<cfargument name="ctr_your_email" type="string" required="yes">
		<cfargument name="ctr_name_friend" type="string" required="yes">
		<cfargument name="ctr_email_friend" type="string" required="yes">
		<cfargument name="ctr_subject" type="string" required="yes">
		<cfargument name="ctr_message" type="string" required="no">
		<!--- Loop in field email --->
        <cfloop list="#arguments.ctr_email_friend#" delimiters=";" index="email">
			<cfmail from="#arguments.ctr_your_email#" to="#Trim(email)#" subject="#arguments.ctr_subject#" type="text/html">
				Hi #arguments.ctr_name_friend# [#arguments.ctr_email_friend#],<br />
				#arguments.ctr_your_name#, sending the message below:<br />
				Subject: #arguments.ctr_subject#<br />
				Message: #arguments.ctr_message#<br />
				In #dateFormat(now(), 'dddd mmmm yyyy')#
			</cfmail>
		</cfloop>

	</cffunction>

</cfcomponent>