$my_pwd = pwd
$my_deployable_models_txt_path = -join($my_pwd,'\DeployableModels.txt')
$reader = New-Object System.IO.StreamReader($my_deployable_models_txt_path)
$eachlinenumber = 1
while (($readeachline = $reader.ReadLine()) -ne $null)
{
    $linelength = $readeachline.length
    $pathindex = $readeachline.LastIndexOf('/')
    $diff = $readeachline.Length-($model_name.Length+4)
    $model_name=$readeachline.Substring($pathindex+1,$linelength-$pathindex-5)
    $execution_status= dbt run -m $model_name 
    echo "Status of execution : $execution_status"
}
$reader.Dispose()

#function fn_deploy
#{
#param($param_sql_script =$1)
 
#  echo "###############################################################################"
#  echo "  Script : ${param_sql_script} "
#  echo "###############################################################################"
	
#  $model_name= $param_sql_script.replace(".sql","")
#  dbt run -m $model_name
#  #echo $model_name
  
  #execution_status= $_
  #Captures the status of execution of sql script
  #echo "Status of execution : $execution_status"

}



#$input = '.\DeployableModels.txt'

#$getFileData = Get-Content -Path $input
#$concantSQLString = $getFileData -split "," 
#ForEach ( $sql_script_file in $concantSQLString ) 
#{    
#  fn_deploy ($sql_script_file)

#}