
function SMA_PardotAuthenticate($url,$userkey,$email,$password)
{  
    #Build body
    $body = "email=$email&password=$password&user_key=$userkey&format=json"

    $uripost = $url + "/login/version/3"
    
    try
    {
        $authenticate = Invoke-RestMethod -Method POST -Uri $uripost -Body $body
    }
    catch [Exception]
    {
        $_
        Exit 100
    }

    if($authenticate.err)
    {
        Write-Host $authenticate.err
        Exit $authenticate.'@attributes'.err_code
    }
    else
    {
        return $authenticate
    }
}

function SMA_PardotGetAllProspects($url,$userkey,$apikey)
{  
    $uriquery = $url + "/prospect/version/3/do/query?"

    #Build body
    $body = "user_key=$userkey&api_key=$apikey&format=json"
    $getprospect = Invoke-RestMethod -Method POST -Uri $uriquery -Body $body

    if($getprospect.err)
    {
        Write-Host $getprospect
        Write-Host $getprospect.err
        Exit $getprospect.'@attributes'.err_code
    }
    else
    {
        return $getprospect.result
    }
}

function SMA_PardotGetProspectAccount($url,$userkey,$apikey,$company)
{  
    $uriquery = $url + "/prospectAccount/version/3/do/query?"

    #Build body
    $body = "name=$company&user_key=$userkey&api_key=$apikey&format=json"
    $getprospect = Invoke-RestMethod -Method POST -Uri $uriquery -Body $body

    if($getprospect.err)
    {
        Write-Host $getprospect
        Write-Host $getprospect.err
        Exit $getprospect.'@attributes'.err_code
    }
    else
    {
        return $getprospect.result
    }
}

function SMA_PardotGetProspect($url,$userkey,$apikey,$email,$id)
{  
    $uriquery = $url #+ "/prospect/version/3/do/read/email/" + $email + "?"

    if($email)
    {
        $uriquery = $uriquery + "/prospect/version/3/do/read/email/" + $email + "?"
    }
    elseif($id)
    {
        $uriquery = $uriquery + "/prospect/version/3/do/read/id/" + $id + "?"
    }

    #Build body
    try
    {
        $body = "user_key=$userkey&api_key=$apikey&format=json"
        $getprospect = Invoke-RestMethod -Method POST -Uri $uriquery -Body $body
    }
    catch
    {
        if($getprospect.err)
        {
            Write-Host $getprospect
            Write-Host $getprospect.err

            if($getprospect.err -ne "Invalid prospect email or id")
            {
                Exit $getprospect.'@attributes'.err_code
            }
            else
            {
                Exit 100
            }
        }
    }
    return $getprospect
}

function SMA_PardotGetCampaign($url,$userkey,$apikey,$name)
{  
    $uriquery = $url + "/campaign/version/3/do/query?"

    #Build body
    $body = "user_key=$userkey&api_key=$apikey&name=$name&format=json"
    $campaign = Invoke-RestMethod -Method POST -Uri $uriquery -Body $body

    if($campaign.err)
    {
        Write-Host $campaign
        Write-Host $campaign.err
        Exit $campaign.'@attributes'.err_code
    }
    else
    {
        return $campaign.result
    }
}

function SMA_PardotGetOpportunity($url,$userkey,$apikey)
{  
    $uriquery = $url + "/opportunity/version/3/do/query?"

    #Build body
    $body = "user_key=$userkey&api_key=$apikey&format=json"
    $opp = Invoke-RestMethod -Method POST -Uri $uriquery -Body $body

    if($opp.err)
    {
        Write-Host $opp
        Write-Host $opp.err
        Exit $opp.'@attributes'.err_code
    }
    else
    {
        return $opp.result
    }
}

function SMA_PardotGetCustomFields($url,$userkey,$apikey)
{  
    $uriquery = $url + "/customField/version/3/do/query?"

    #Build body
    $body = "user_key=$userkey&api_key=$apikey&format=json"
    $fields = Invoke-RestMethod -Method POST -Uri $uriquery -Body $body

    if($fields.err)
    {
        Write-Host $fields
        Write-Host $fields.err
        Exit $fields.'@attributes'.err_code
    }
    else
    {
        return $fields.result
    }
}

function SMA_PardotGetList($url,$userkey,$apikey,$name)
{  
    $uriquery = $url + "/list/version/3/do/query?"

    #Build body
    $body = "user_key=$userkey&api_key=$apikey&name=$name&format=json"
    
    try
    {
        $list = Invoke-RestMethod -Method POST -Uri $uriquery -Body $body
    }
    catch [Exception]
    {
        $_
        Exit 100
    }

    if($list.err)
    {
        Write-Host $list
        Write-Host $list.err
        Exit $list.'@attributes'.err_code
    }
    else
    {
        return $list.result
    }
}

function SMA_PardotGetListMembers($url,$userkey,$apikey,$listid)
{  
    $uriquery = $url + "/listMembership/version/3/do/query?"

    #Build body
    $body = "user_key=$userkey&api_key=$apikey&list_id=$listid&format=json"
    
    try
    {
        $listmem = Invoke-RestMethod -Method POST -Uri $uriquery -Body $body
    }
    catch [Exception]
    {
        $_
        Exit 100
    }

    if($listmem.err)
    {
        Write-Host $listmem
        Write-Host $listmem.err
        Exit $listmem.'@attributes'.err_code
    }
    else
    {
        return $listmem.result
    }
}

function SMA_PardotTag($url,$userkey,$apikey,$tag)
{  
    $uriquery = $url + "/tag/version/3/do/query?"

    #Build body
    if($tag)
    {
        $body = "user_key=$userkey&api_key=$apikey&name=$tag&format=json"
    }
    else
    {
        $body = "user_key=$userkey&api_key=$apikey&format=json"
    }
    $tag = Invoke-RestMethod -Method POST -Uri $uriquery -Body $body

    if($tag.err)
    {
        Write-Host $tag
        Write-Host $tag.err
        Exit $tag.'@attributes'.err_code
    }
    else
    {
        return $tag.result
    }
}

function SMA_PardotAddProspect($url,$userkey,$apikey,$email,$firstname,$lastname,$company)
{  
    $check = SMA_PardotGetProspect -url $url -userkey $userkey -apikey $apikey -email $email

    if($check.err)
    {
        $uriquery = $url + "/prospect/version/3/do/upsert/email/" + $email + "?"

        #Build body
        $body = "user_key=$userkey&api_key=$apikey&first_name=$firstname&last_name=$lastname&company=$company&format=json"
        
        try
        {
            $add = Invoke-RestMethod -Method POST -Uri $uriquery -Body $body
        }
        catch [Exception]
        {
            $_
            Exit 100
        }

        if($add.err)
        {
            Write-Host $add
            Write-Host $add.err
            Exit $add.'@attributes'.err_code
        }
        else
        {
            return $add
        }
    }
    else
    {
        Write-Host "User already exists!"
        return $check
    }
}

function SMA_PardotAddtoList($url,$userkey,$apikey,$listid,$prospectid)
{
    $uriquery = $url + "/listMembership/version/3/do/create/list_id/" + $listid + "/prospect_id/" + $prospectid + "?"

    #Build body
    $body = "user_key=$userkey&api_key=$apikey&format=json"

    try
    {
        $add = Invoke-RestMethod -Method POST -Uri $uriquery -Body $body
    }
    catch [Exception]
    {
        $_
        Exit 100
    }

    if($add.err)
    {
        Write-Host $add
        Write-Host $add.err
        Exit $add.'@attributes'.err_code
    }
    else
    {
        return $add
    }
}

function SMA_PardotRemoveFromList($url,$userkey,$apikey,$listid,$prospectid)
{
    $uriquery = $url + "/listMembership/version/3/do/delete/list_id/" + $listid + "/prospect_id/" + $prospectid + "?"

    #Build body
    $body = "user_key=$userkey&api_key=$apikey&format=json"

    try
    {
        $remove = Invoke-RestMethod -Method POST -Uri $uriquery -Body $body
    }
    catch
    {
        $_
        Exit 100
    }

    if($remove.err)
    {
        Write-Host $remove
        Write-Host $remove.err
        Exit $remove.'@attributes'.err_code
    }
    else
    {
        return $remove
    }
}

