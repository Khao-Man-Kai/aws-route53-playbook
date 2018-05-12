for zoneid in `aws route53 list-hosted-zones|jq -r '.HostedZones[]|.Id'|awk -F"/" '{print $NF}'`
do
    echo -------
    domainname=`aws route53 get-hosted-zone --id $zoneid|jq -r '.HostedZone.Name'`
    echo "<<dns name:="" $domainname="">>"
    route53 get $zoneid
done
