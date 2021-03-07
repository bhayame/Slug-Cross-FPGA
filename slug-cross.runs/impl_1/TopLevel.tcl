proc start_step { step } {
  set stopFile ".stop.rst"
  if {[file isfile .stop.rst]} {
    puts ""
    puts "*** Halting run - EA reset detected ***"
    puts ""
    puts ""
    return -code error
  }
  set beginFile ".$step.begin.rst"
  set platform "$::tcl_platform(platform)"
  set user "$::tcl_platform(user)"
  set pid [pid]
  set host ""
  if { [string equal $platform unix] } {
    if { [info exist ::env(HOSTNAME)] } {
      set host $::env(HOSTNAME)
    }
  } else {
    if { [info exist ::env(COMPUTERNAME)] } {
      set host $::env(COMPUTERNAME)
    }
  }
  set ch [open $beginFile w]
  puts $ch "<?xml version=\"1.0\"?>"
  puts $ch "<ProcessHandle Version=\"1\" Minor=\"0\">"
  puts $ch "    <Process Command=\".planAhead.\" Owner=\"$user\" Host=\"$host\" Pid=\"$pid\">"
  puts $ch "    </Process>"
  puts $ch "</ProcessHandle>"
  close $ch
}

proc end_step { step } {
  set endFile ".$step.end.rst"
  set ch [open $endFile w]
  close $ch
}

proc step_failed { step } {
  set endFile ".$step.error.rst"
  set ch [open $endFile w]
  close $ch
}

set_msg_config -id {HDL 9-1061} -limit 100000
set_msg_config -id {HDL 9-1654} -limit 100000
set_msg_config -id {Synth 8-256} -limit 10000
set_msg_config -id {Synth 8-638} -limit 10000

start_step init_design
set ACTIVE_STEP init_design
set rc [catch {
  create_msg_db init_design.pb
  set_param xicom.use_bs_reader 1
  create_project -in_memory -part xc7a35tcpg236-1
  set_property board_part digilentinc.com:basys3:part0:1.1 [current_project]
  set_property design_mode GateLvl [current_fileset]
  set_param project.singleFileAddWarning.threshold 0
  set_property webtalk.parent_dir {C:/Users/bhayame/Desktop/Lab 7/Lab 7.cache/wt} [current_project]
  set_property parent.project_path {C:/Users/bhayame/Desktop/Lab 7/Lab 7.xpr} [current_project]
  set_property ip_output_repo {{C:/Users/bhayame/Desktop/Lab 7/Lab 7.cache/ip}} [current_project]
  set_property ip_cache_permissions {read write} [current_project]
  add_files -quiet {{C:/Users/bhayame/Desktop/Lab 7/Lab 7.runs/synth_1/TopLevel.dcp}}
  read_xdc {{C:/Users/bhayame/Desktop/Lab 7/Lab 7.srcs/constrs_1/imports/Desktop/Basys3_Master.xdc}}
  link_design -top TopLevel -part xc7a35tcpg236-1
  write_hwdef -file TopLevel.hwdef
  close_msg_db -file init_design.pb
} RESULT]
if {$rc} {
  step_failed init_design
  return -code error $RESULT
} else {
  end_step init_design
  unset ACTIVE_STEP 
}

start_step opt_design
set ACTIVE_STEP opt_design
set rc [catch {
  create_msg_db opt_design.pb
  opt_design 
  write_checkpoint -force TopLevel_opt.dcp
  report_drc -file TopLevel_drc_opted.rpt
  close_msg_db -file opt_design.pb
} RESULT]
if {$rc} {
  step_failed opt_design
  return -code error $RESULT
} else {
  end_step opt_design
  unset ACTIVE_STEP 
}

start_step place_design
set ACTIVE_STEP place_design
set rc [catch {
  create_msg_db place_design.pb
  implement_debug_core 
  place_design 
  write_checkpoint -force TopLevel_placed.dcp
  report_io -file TopLevel_io_placed.rpt
  report_utilization -file TopLevel_utilization_placed.rpt -pb TopLevel_utilization_placed.pb
  report_control_sets -verbose -file TopLevel_control_sets_placed.rpt
  close_msg_db -file place_design.pb
} RESULT]
if {$rc} {
  step_failed place_design
  return -code error $RESULT
} else {
  end_step place_design
  unset ACTIVE_STEP 
}

start_step route_design
set ACTIVE_STEP route_design
set rc [catch {
  create_msg_db route_design.pb
  route_design 
  write_checkpoint -force TopLevel_routed.dcp
  report_drc -file TopLevel_drc_routed.rpt -pb TopLevel_drc_routed.pb -rpx TopLevel_drc_routed.rpx
  report_methodology -file TopLevel_methodology_drc_routed.rpt -rpx TopLevel_methodology_drc_routed.rpx
  report_timing_summary -warn_on_violation -max_paths 10 -file TopLevel_timing_summary_routed.rpt -rpx TopLevel_timing_summary_routed.rpx
  report_power -file TopLevel_power_routed.rpt -pb TopLevel_power_summary_routed.pb -rpx TopLevel_power_routed.rpx
  report_route_status -file TopLevel_route_status.rpt -pb TopLevel_route_status.pb
  report_clock_utilization -file TopLevel_clock_utilization_routed.rpt
  close_msg_db -file route_design.pb
} RESULT]
if {$rc} {
  write_checkpoint -force TopLevel_routed_error.dcp
  step_failed route_design
  return -code error $RESULT
} else {
  end_step route_design
  unset ACTIVE_STEP 
}

start_step write_bitstream
set ACTIVE_STEP write_bitstream
set rc [catch {
  create_msg_db write_bitstream.pb
  catch { write_mem_info -force TopLevel.mmi }
  write_bitstream -force -no_partial_bitfile TopLevel.bit 
  catch { write_sysdef -hwdef TopLevel.hwdef -bitfile TopLevel.bit -meminfo TopLevel.mmi -file TopLevel.sysdef }
  catch {write_debug_probes -quiet -force debug_nets}
  close_msg_db -file write_bitstream.pb
} RESULT]
if {$rc} {
  step_failed write_bitstream
  return -code error $RESULT
} else {
  end_step write_bitstream
  unset ACTIVE_STEP 
}

