#https://github.com/blockchainexpert2022/Scripts/blob/main/TestSqlServerConnection.ps1

#Data Source=MYSERVER\SQLEXPRESS;Initial Catalog=MYDATABASE;User ID=sa;Password=MYPASSWORD;MultipleActiveResultSets=True

param (
    [string]$serverName = "MYSERVER\SQLEXPRESS",
    [string]$databaseName = "MYDATABASE",
    [string]$userName = "sa",
    [string]$password = "MYPASSWORD"
)

function Test-SqlConnection {
    param (
        [string]$serverName,
        [string]$databaseName,
        [string]$userName,
        [string]$password
    )

    # Connection string
    $connectionString = "Server=$serverName;Database=$databaseName;User Id=$userName;Password=$password;"

    try {
        # Create a new SQL connection
        $connection = New-Object System.Data.SqlClient.SqlConnection
        $connection.ConnectionString = $connectionString

        # Open the connection
        $connection.Open()

        if ($connection.State -eq [System.Data.ConnectionState]::Open) {
            Write-Output "Successfully connected to the database."
            $connection.Close()
        } else {
            Write-Output "Failed to connect to the database."
        }
    } catch {
        Write-Output "Error: $_"
    }
}

# Test the connection
Test-SqlConnection -serverName $serverName -databaseName $databaseName -userName $userName -password $password

