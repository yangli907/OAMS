<cftry>
	<cfset userDir = ExpandPath('/') & "appmanage/fileUpload/" &URL.aid/>
	<cfif DirectoryExists(userDir)>
	<cfelse>
	<cfdirectory action="create" directory="#userDir#/"/>
	</cfif>

	<cffile action="upload" 
			filefield="filedata" 
			destination="#userDir#/" 
			nameconflict="makeunique" 
			accept="application/octet-stream"/>
			<cfset local_time_created=#createodbcdatetime(file.timecreated)#/>
	<cfquery name="qCreate" datasource="appmanage">
         insert into uploadfiles (aid, filename, originalname,path, user, uploadtime)
            values (
            <cfqueryparam cfsqltype="cf_sql_integer" value="#URL.aid#"/>,
            <cfqueryparam cfsqltype="cf_sql_varchar" value="#File.ServerFileName#" />,
            <cfqueryparam cfsqltype="cf_sql_varchar" value="#File.ServerFileExt#" />,
            <cfqueryparam cfsqltype="cf_sql_varchar" value="http://db1.elc.msu.edu/edtech/appmanage/fileUpload/#URL.aid#/#File.ServerFile#" />,
            (select first from users where users.id= <cfqueryparam cfsqltype="cf_sql_varchar" value="#URL.user#" />),
            curdate())
        </cfquery>      
		
		 
		<cfcatch type="any">
			<cfdocument format="pDF" overwrite="yes" filename="errordebug.pdf">			
				<cfdump var="#cfcatch#"/>
				<cfdump var="#URL#"/>
				<cfdump var="#FILE#"/>
			</cfdocument>
		</cfcatch>
		
</cftry> 