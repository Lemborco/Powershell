## Working with sql server
$SQLServer="Hostname";
$Database="Databasename";
$SqlUser="DatabaseUsername";
$SqlPass="Databaseuserpassword"
$Query="select * from tbltest";

## connection to Database
$Con=New-Object System.Data.SqlClient.SqlConnection;
$Con.ConnectionString="Server=$SQLServer;initial catalog=$Database;user=$SqlUser; Password=$SqlPass;";
#$Con.ConnectionString="$SQLServer;Database=$Database;Integrated Security=true";

$Cmd=New-Object System.Data.SqlClient.SqlCommand;
$Cmd.CommandText=$Query
$Cmd.Connection=$Con

$SQLAdapter=New-Object System.Data.SqlClient.SqlDataAdapter;
$SQLAdapter.SelectCommand=$Cmd;
$DataSet=New-Object System.Data.DataSet;
$SQLAdapter.Fill($DataSet);
$DataSetTable=$DataSet.Tables["Table"];
$DataSetTable | Export-Csv "c:\a.csv"
$Con.Close();




