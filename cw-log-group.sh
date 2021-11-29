echo -e "{
  \"logs\": {
    \"logs_collected\": {
      \"files\": {
        \"collect_list\": [
          {
            \"file_path\": \"/PATH/CASE1.log\",
            \"log_group_name\": \"AWS-Test-Aplication-Logs\",
            \"log_stream_name\": \"CASE1\"
          },
		  {
            \"file_path\": \"/PATH/CASE2.log\",
            \"log_group_name\": \"AWS-Test-Aplication-Logs\",
            \"log_stream_name\": \"CASE2\"
          },
		  {
            \"file_path\": \"/PATH/CASE3.log\",
            \"log_group_name\": \"AWS-Test-Aplication-Logs\",
            \"log_stream_name\": \"CASE3\"
          },
		  {
            \"file_path\": \"/PATH/CASE4.log\",
            \"log_group_name\": \"AWS-Test-Aplication-Logs\",
            \"log_stream_name\": \"CASE4\"
          }		  
        ]
      }
    }
  }
}" > /var/tmp/assets/cw-log-groups.json

mv -v /var/tmp/assets/cw-log-groups.json /opt/aws/amazon-cloudwatch-agent/etc/
amazon-cloudwatch-agent-ctl -m ec2 -a stop
amazon-cloudwatch-agent-ctl -a append-config -m ec2 -c file:/opt/aws/amazon-cloudwatch-agent/etc/cw-log-groups-soc.json -s
echo "Cloudwatch Agent configuration finished"

exit 0
