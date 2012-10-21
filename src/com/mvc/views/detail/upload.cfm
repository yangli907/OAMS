<cftry>
	<cfset userDir = ExpandPath('/') & "appmanage/fileUpload/"/>
	<cfif DirectoryExists(userDir)>
	<cfelse>
	<cfdirectory action="create" directory="#userDir#/"/>
	</cfif>
	
	<cffile action="upload" 
			filefield="filedata" 
			destination="#userDir#/" 
			nameconflict="makeunique" 
			accept="application/octet-stream"/>
	<cfquery name="qCreate" datasource="appmanage">
         insert into uploadfiles (aid, filename, originalname)
            values (
            <cfqueryparam cfsqltype="cf_sql_integer" value="5" />,
            <cfqueryparam cfsqltype="cf_sql_varchar" value="#File.ServerFile#" />,
            <cfqueryparam cfsqltype="cf_sql_varchar" value="#File.ServerFileName#" />)
        </cfquery>      
		
		
		<cfcatch type="any">
			<cfdocument format="pDF" overwrite="yes" filename="errordebug.pdf">
			
				<cfdump var="#cfcatch#"/>
				<cfdump var="#URL#"/>
				<cfdump var="#FILE#"/>
			</cfdocument>
		</cfcatch>
		 
</cftry> 