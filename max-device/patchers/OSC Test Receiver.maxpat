{
	"patcher": {
		"fileversion": 1,
		"appversion": {
			"major": 8,
			"minor": 5,
			"revision": 6,
			"architecture": "x64",
			"modernui": 1
		},
		"classnamespace": "box",
		"rect": [
			100.0,
			100.0,
			720.0,
			460.0
		],
		"bglocked": 0,
		"openinpresentation": 0,
		"default_fontsize": 12.0,
		"default_fontface": 0,
		"default_fontname": "Arial",
		"gridonopen": 1,
		"gridsize": [
			15.0,
			15.0
		],
		"gridsnaponopen": 1,
		"objectsnaponopen": 1,
		"statusbarvisible": 2,
		"toolbarvisible": 1,
		"boxes": [
			{
				"box": {
					"id": "obj-1",
					"maxclass": "comment",
					"numinlets": 1,
					"numoutlets": 0,
					"patching_rect": [
						30.0,
						15.0,
						500.0,
						27.0
					],
					"fontsize": 18.0,
					"text": "Gesture Control — OSC Test Receiver (Phase 2)"
				}
			},
			{
				"box": {
					"id": "obj-2",
					"maxclass": "comment",
					"numinlets": 1,
					"numoutlets": 0,
					"patching_rect": [
						30.0,
						45.0,
						660.0,
						20.0
					],
					"text": "启动 Tracker: python main.py --test-signal --no-preview  （或直接开摄像头），下面的数值应开始变化"
				}
			},
			{
				"box": {
					"id": "obj-3",
					"maxclass": "newobj",
					"numinlets": 1,
					"numoutlets": 1,
					"outlettype": [
						""
					],
					"patching_rect": [
						30.0,
						90.0,
						110.0,
						22.0
					],
					"text": "udpreceive 9000"
				}
			},
			{
				"box": {
					"id": "obj-4",
					"maxclass": "button",
					"numinlets": 1,
					"numoutlets": 1,
					"outlettype": [
						"bang"
					],
					"patching_rect": [
						160.0,
						90.0,
						22.0,
						22.0
					]
				}
			},
			{
				"box": {
					"id": "obj-5",
					"maxclass": "comment",
					"numinlets": 1,
					"numoutlets": 0,
					"patching_rect": [
						190.0,
						92.0,
						200.0,
						20.0
					],
					"text": "← 收到数据时闪烁"
				}
			},
			{
				"box": {
					"id": "obj-6",
					"maxclass": "newobj",
					"numinlets": 1,
					"numoutlets": 13,
					"outlettype": [
						"",
						"",
						"",
						"",
						"",
						"",
						"",
						"",
						"",
						"",
						"",
						"",
						""
					],
					"patching_rect": [
						30.0,
						140.0,
						760.0,
						22.0
					],
					"text": "route /gesture/left/openness /gesture/left/fist /gesture/left/detected /gesture/right/openness /gesture/right/fist /gesture/right/detected /gesture/hands/distance /gesture/camera/status /gesture/left/x /gesture/left/y /gesture/right/x /gesture/right/y"
				}
			},
			{
				"box": {
					"id": "obj-10",
					"maxclass": "comment",
					"numinlets": 1,
					"numoutlets": 0,
					"patching_rect": [
						30.0,
						205.0,
						70.0,
						20.0
					],
					"text": "L Open"
				}
			},
			{
				"box": {
					"id": "obj-11",
					"maxclass": "flonum",
					"numinlets": 1,
					"numoutlets": 2,
					"outlettype": [
						"",
						"bang"
					],
					"patching_rect": [
						30.0,
						230.0,
						60.0,
						22.0
					]
				}
			},
			{
				"box": {
					"id": "obj-12",
					"maxclass": "comment",
					"numinlets": 1,
					"numoutlets": 0,
					"patching_rect": [
						110.0,
						205.0,
						60.0,
						20.0
					],
					"text": "L Fist"
				}
			},
			{
				"box": {
					"id": "obj-13",
					"maxclass": "toggle",
					"numinlets": 1,
					"numoutlets": 1,
					"outlettype": [
						"int"
					],
					"parameter_enable": 0,
					"patching_rect": [
						110.0,
						230.0,
						22.0,
						22.0
					]
				}
			},
			{
				"box": {
					"id": "obj-14",
					"maxclass": "comment",
					"numinlets": 1,
					"numoutlets": 0,
					"patching_rect": [
						170.0,
						205.0,
						60.0,
						20.0
					],
					"text": "L Det"
				}
			},
			{
				"box": {
					"id": "obj-15",
					"maxclass": "toggle",
					"numinlets": 1,
					"numoutlets": 1,
					"outlettype": [
						"int"
					],
					"parameter_enable": 0,
					"patching_rect": [
						170.0,
						230.0,
						22.0,
						22.0
					]
				}
			},
			{
				"box": {
					"id": "obj-16",
					"maxclass": "comment",
					"numinlets": 1,
					"numoutlets": 0,
					"patching_rect": [
						240.0,
						205.0,
						70.0,
						20.0
					],
					"text": "R Open"
				}
			},
			{
				"box": {
					"id": "obj-17",
					"maxclass": "flonum",
					"numinlets": 1,
					"numoutlets": 2,
					"outlettype": [
						"",
						"bang"
					],
					"patching_rect": [
						240.0,
						230.0,
						60.0,
						22.0
					]
				}
			},
			{
				"box": {
					"id": "obj-18",
					"maxclass": "comment",
					"numinlets": 1,
					"numoutlets": 0,
					"patching_rect": [
						320.0,
						205.0,
						60.0,
						20.0
					],
					"text": "R Fist"
				}
			},
			{
				"box": {
					"id": "obj-19",
					"maxclass": "toggle",
					"numinlets": 1,
					"numoutlets": 1,
					"outlettype": [
						"int"
					],
					"parameter_enable": 0,
					"patching_rect": [
						320.0,
						230.0,
						22.0,
						22.0
					]
				}
			},
			{
				"box": {
					"id": "obj-20",
					"maxclass": "comment",
					"numinlets": 1,
					"numoutlets": 0,
					"patching_rect": [
						380.0,
						205.0,
						60.0,
						20.0
					],
					"text": "R Det"
				}
			},
			{
				"box": {
					"id": "obj-21",
					"maxclass": "toggle",
					"numinlets": 1,
					"numoutlets": 1,
					"outlettype": [
						"int"
					],
					"parameter_enable": 0,
					"patching_rect": [
						380.0,
						230.0,
						22.0,
						22.0
					]
				}
			},
			{
				"box": {
					"id": "obj-22",
					"maxclass": "comment",
					"numinlets": 1,
					"numoutlets": 0,
					"patching_rect": [
						450.0,
						205.0,
						70.0,
						20.0
					],
					"text": "Distance"
				}
			},
			{
				"box": {
					"id": "obj-23",
					"maxclass": "flonum",
					"numinlets": 1,
					"numoutlets": 2,
					"outlettype": [
						"",
						"bang"
					],
					"patching_rect": [
						450.0,
						230.0,
						60.0,
						22.0
					]
				}
			},
			{
				"box": {
					"id": "obj-24",
					"maxclass": "comment",
					"numinlets": 1,
					"numoutlets": 0,
					"patching_rect": [
						530.0,
						205.0,
						80.0,
						20.0
					],
					"text": "Cam Status"
				}
			},
			{
				"box": {
					"id": "obj-25",
					"maxclass": "flonum",
					"numinlets": 1,
					"numoutlets": 2,
					"outlettype": [
						"",
						"bang"
					],
					"patching_rect": [
						530.0,
						230.0,
						60.0,
						22.0
					]
				}
			},
			{
				"box": {
					"id": "obj-30",
					"maxclass": "slider",
					"numinlets": 1,
					"numoutlets": 1,
					"outlettype": [
						""
					],
					"parameter_enable": 0,
					"size": 1.0,
					"floatoutput": 1,
					"orientation": 1,
					"patching_rect": [
						30.0,
						270.0,
						150.0,
						24.0
					]
				}
			},
			{
				"box": {
					"id": "obj-31",
					"maxclass": "slider",
					"numinlets": 1,
					"numoutlets": 1,
					"outlettype": [
						""
					],
					"parameter_enable": 0,
					"size": 1.0,
					"floatoutput": 1,
					"orientation": 1,
					"patching_rect": [
						240.0,
						270.0,
						150.0,
						24.0
					]
				}
			},
			{
				"box": {
					"id": "obj-32",
					"maxclass": "slider",
					"numinlets": 1,
					"numoutlets": 1,
					"outlettype": [
						""
					],
					"parameter_enable": 0,
					"size": 1.0,
					"floatoutput": 1,
					"orientation": 1,
					"patching_rect": [
						450.0,
						270.0,
						150.0,
						24.0
					]
				}
			},
			{
				"box": {
					"id": "obj-40",
					"maxclass": "newobj",
					"numinlets": 1,
					"numoutlets": 0,
					"patching_rect": [
						640.0,
						180.0,
						130.0,
						22.0
					],
					"text": "print unmatched-osc"
				}
			},
			{
				"box": {
					"id": "obj-41",
					"maxclass": "comment",
					"numinlets": 1,
					"numoutlets": 0,
					"patching_rect": [
						30.0,
						375.0,
						640.0,
						33.0
					],
					"text": "说明：本 Patch 仅用于第二阶段验证 OSC 链路。正式设备（Gesture Control.amxd）将在第三阶段把这些数据接入 live.* 参数对象。若端口被占用，请先关闭其他实例或修改 udpreceive 参数。"
				}
			},
			{
				"box": {
					"id": "obj-50",
					"maxclass": "comment",
					"numinlets": 1,
					"numoutlets": 0,
					"patching_rect": [
						30.0,
						310.0,
						60.0,
						20.0
					],
					"text": "L X"
				}
			},
			{
				"box": {
					"id": "obj-51",
					"maxclass": "flonum",
					"numinlets": 1,
					"numoutlets": 2,
					"outlettype": [
						"",
						"bang"
					],
					"patching_rect": [
						30.0,
						335.0,
						60.0,
						22.0
					]
				}
			},
			{
				"box": {
					"id": "obj-52",
					"maxclass": "comment",
					"numinlets": 1,
					"numoutlets": 0,
					"patching_rect": [
						110.0,
						310.0,
						60.0,
						20.0
					],
					"text": "L Y"
				}
			},
			{
				"box": {
					"id": "obj-53",
					"maxclass": "flonum",
					"numinlets": 1,
					"numoutlets": 2,
					"outlettype": [
						"",
						"bang"
					],
					"patching_rect": [
						110.0,
						335.0,
						60.0,
						22.0
					]
				}
			},
			{
				"box": {
					"id": "obj-54",
					"maxclass": "comment",
					"numinlets": 1,
					"numoutlets": 0,
					"patching_rect": [
						190.0,
						310.0,
						60.0,
						20.0
					],
					"text": "R X"
				}
			},
			{
				"box": {
					"id": "obj-55",
					"maxclass": "flonum",
					"numinlets": 1,
					"numoutlets": 2,
					"outlettype": [
						"",
						"bang"
					],
					"patching_rect": [
						190.0,
						335.0,
						60.0,
						22.0
					]
				}
			},
			{
				"box": {
					"id": "obj-56",
					"maxclass": "comment",
					"numinlets": 1,
					"numoutlets": 0,
					"patching_rect": [
						270.0,
						310.0,
						60.0,
						20.0
					],
					"text": "R Y"
				}
			},
			{
				"box": {
					"id": "obj-57",
					"maxclass": "flonum",
					"numinlets": 1,
					"numoutlets": 2,
					"outlettype": [
						"",
						"bang"
					],
					"patching_rect": [
						270.0,
						335.0,
						60.0,
						22.0
					]
				}
			}
		],
		"lines": [
			{
				"patchline": {
					"source": [
						"obj-3",
						0
					],
					"destination": [
						"obj-6",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-3",
						0
					],
					"destination": [
						"obj-4",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-6",
						0
					],
					"destination": [
						"obj-11",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-6",
						1
					],
					"destination": [
						"obj-13",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-6",
						2
					],
					"destination": [
						"obj-15",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-6",
						3
					],
					"destination": [
						"obj-17",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-6",
						4
					],
					"destination": [
						"obj-19",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-6",
						5
					],
					"destination": [
						"obj-21",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-6",
						6
					],
					"destination": [
						"obj-23",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-6",
						7
					],
					"destination": [
						"obj-25",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-6",
						12
					],
					"destination": [
						"obj-40",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-11",
						0
					],
					"destination": [
						"obj-30",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-17",
						0
					],
					"destination": [
						"obj-31",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-23",
						0
					],
					"destination": [
						"obj-32",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-6",
						8
					],
					"destination": [
						"obj-51",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-6",
						9
					],
					"destination": [
						"obj-53",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-6",
						10
					],
					"destination": [
						"obj-55",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-6",
						11
					],
					"destination": [
						"obj-57",
						0
					]
				}
			}
		],
		"dependency_cache": [],
		"autosave": 0
	}
}