webtalk_init -webtalk_dir /home/nate/projects/duneWireTension/ElectricalMethod/firmware/source/sdk/webtalk
webtalk_register_client -client project
webtalk_add_data -client project -key date_generated -value "2021-01-05 14:09:14" -context "software_version_and_target_device"
webtalk_add_data -client project -key product_version -value "SDK v2018.3" -context "software_version_and_target_device"
webtalk_add_data -client project -key build_version -value "2018.3" -context "software_version_and_target_device"
webtalk_add_data -client project -key os_platform -value "amd64" -context "software_version_and_target_device"
webtalk_add_data -client project -key registration_id -value "174621291_176764970_210718760_767" -context "software_version_and_target_device"
webtalk_add_data -client project -key tool_flow -value "SDK" -context "software_version_and_target_device"
webtalk_add_data -client project -key beta -value "false" -context "software_version_and_target_device"
webtalk_add_data -client project -key route_design -value "NA" -context "software_version_and_target_device"
webtalk_add_data -client project -key target_family -value "NA" -context "software_version_and_target_device"
webtalk_add_data -client project -key target_device -value "NA" -context "software_version_and_target_device"
webtalk_add_data -client project -key target_package -value "NA" -context "software_version_and_target_device"
webtalk_add_data -client project -key target_speed -value "NA" -context "software_version_and_target_device"
webtalk_add_data -client project -key random_id -value "rojgc157ogqk3pbepjbicn4at4" -context "software_version_and_target_device"
webtalk_add_data -client project -key project_id -value "2018.3_2" -context "software_version_and_target_device"
webtalk_add_data -client project -key project_iteration -value "2" -context "software_version_and_target_device"
webtalk_add_data -client project -key os_name -value "CentOS" -context "user_environment"
webtalk_add_data -client project -key os_release -value "CentOS Linux release 8.3.2011" -context "user_environment"
webtalk_add_data -client project -key cpu_name -value "Intel(R) Core(TM) i9-9900 CPU @ 3.10GHz" -context "user_environment"
webtalk_add_data -client project -key cpu_speed -value "4881.764 MHz" -context "user_environment"
webtalk_add_data -client project -key total_processors -value "1" -context "user_environment"
webtalk_add_data -client project -key system_ram -value "33.290 GB" -context "user_environment"
webtalk_register_client -client sdk
webtalk_add_data -client sdk -key uid -value "1608680692000" -context "sdk\\\\hardware/1608680692000"
webtalk_add_data -client sdk -key isZynq -value "true" -context "sdk\\\\hardware/1608680692000"
webtalk_add_data -client sdk -key isZynqMP -value "false" -context "sdk\\\\hardware/1608680692000"
webtalk_add_data -client sdk -key Processors -value "2" -context "sdk\\\\hardware/1608680692000"
webtalk_add_data -client sdk -key VivadoVersion -value "2018.3" -context "sdk\\\\hardware/1608680692000"
webtalk_add_data -client sdk -key Arch -value "zynq" -context "sdk\\\\hardware/1608680692000"
webtalk_add_data -client sdk -key Device -value "7z020" -context "sdk\\\\hardware/1608680692000"
webtalk_add_data -client sdk -key IsHandoff -value "true" -context "sdk\\\\hardware/1608680692000"
webtalk_add_data -client sdk -key os -value "NA" -context "sdk\\\\hardware/1608680692000"
webtalk_add_data -client sdk -key apptemplate -value "NA" -context "sdk\\\\hardware/1608680692000"
webtalk_add_data -client sdk -key RecordType -value "HWCreation" -context "sdk\\\\hardware/1608680692000"
webtalk_add_data -client sdk -key uid -value "NA" -context "sdk\\\\bsp/1609873754168"
webtalk_add_data -client sdk -key RecordType -value "ToolUsage" -context "sdk\\\\bsp/1609873754168"
webtalk_add_data -client sdk -key BootgenCount -value "0" -context "sdk\\\\bsp/1609873754168"
webtalk_add_data -client sdk -key DebugCount -value "0" -context "sdk\\\\bsp/1609873754168"
webtalk_add_data -client sdk -key PerfCount -value "0" -context "sdk\\\\bsp/1609873754168"
webtalk_add_data -client sdk -key FlashCount -value "0" -context "sdk\\\\bsp/1609873754168"
webtalk_add_data -client sdk -key CrossTriggCount -value "0" -context "sdk\\\\bsp/1609873754168"
webtalk_add_data -client sdk -key QemuDebugCount -value "0" -context "sdk\\\\bsp/1609873754168"
webtalk_transmit -clientid 1733122371 -regid "174621291_176764970_210718760_767" -xml /home/nate/projects/duneWireTension/ElectricalMethod/firmware/source/sdk/webtalk/usage_statistics_ext_sdk.xml -html /home/nate/projects/duneWireTension/ElectricalMethod/firmware/source/sdk/webtalk/usage_statistics_ext_sdk.html -wdm /home/nate/projects/duneWireTension/ElectricalMethod/firmware/source/sdk/webtalk/sdk_webtalk.wdm -intro "<H3>SDK Usage Report</H3><BR>"
webtalk_terminate
