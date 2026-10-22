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
   59.0,
   106.0,
   1500.0,
   900.0
  ],
  "openrect": [
   0.0,
   0.0,
   0.0,
   169.0
  ],
  "bglocked": 0,
  "openinpresentation": 1,
  "devicewidth": 0.0,
  "title": "Gesture Control",
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
     "maxclass": "panel",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      1500.0,
      700.0,
      100.0,
      60.0
     ],
     "presentation": 1,
     "presentation_rect": [
      0.0,
      0.0,
      1116.0,
      169.0
     ],
     "mode": 0,
     "background": 1,
     "border": 0,
     "rounded": 0,
     "bgcolor": [
      0.12,
      0.12,
      0.12,
      1.0
     ],
     "bgfillcolor_type": "color",
     "bgfillcolor_color": [
      0.12,
      0.12,
      0.12,
      1.0
     ],
     "bgfillcolor_angle": 270.0,
     "bgfillcolor_proportion": 0.5,
     "bgfillcolor_autogradient": 0.0
    }
   },
   {
    "box": {
     "id": "obj-2",
     "maxclass": "panel",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      1500.0,
      770.0,
      100.0,
      40.0
     ],
     "presentation": 1,
     "presentation_rect": [
      2.0,
      26.0,
      148.0,
      102.0
     ],
     "mode": 0,
     "background": 1,
     "border": 0,
     "rounded": 6,
     "bgcolor": [
      0.16,
      0.16,
      0.16,
      1.0
     ],
     "bgfillcolor_type": "color",
     "bgfillcolor_color": [
      0.16,
      0.16,
      0.16,
      1.0
     ],
     "bgfillcolor_angle": 270.0,
     "bgfillcolor_proportion": 0.5,
     "bgfillcolor_autogradient": 0.0
    }
   },
   {
    "box": {
     "id": "obj-3",
     "maxclass": "panel",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      1500.0,
      820.0,
      100.0,
      40.0
     ],
     "presentation": 1,
     "presentation_rect": [
      152.0,
      24.0,
      856.0,
      120.0
     ],
     "mode": 0,
     "background": 1,
     "border": 0,
     "rounded": 6,
     "bgcolor": [
      0.16,
      0.16,
      0.16,
      1.0
     ],
     "bgfillcolor_type": "color",
     "bgfillcolor_color": [
      0.16,
      0.16,
      0.16,
      1.0
     ],
     "bgfillcolor_angle": 270.0,
     "bgfillcolor_proportion": 0.5,
     "bgfillcolor_autogradient": 0.0
    }
   },
   {
    "box": {
     "id": "obj-4",
     "maxclass": "panel",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      1500.0,
      870.0,
      100.0,
      40.0
     ],
     "presentation": 1,
     "presentation_rect": [
      1010.0,
      26.0,
      104.0,
      102.0
     ],
     "mode": 0,
     "background": 1,
     "border": 0,
     "rounded": 6,
     "bgcolor": [
      0.16,
      0.16,
      0.16,
      1.0
     ],
     "bgfillcolor_type": "color",
     "bgfillcolor_color": [
      0.16,
      0.16,
      0.16,
      1.0
     ],
     "bgfillcolor_angle": 270.0,
     "bgfillcolor_proportion": 0.5,
     "bgfillcolor_autogradient": 0.0
    }
   },
   {
    "box": {
     "id": "obj-5",
     "maxclass": "comment",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      30.0,
      20.0,
      560.0,
      20.0
     ],
     "text": "1) OSC 接收 → route 分发 → clip 限幅 → [s ---g1..9] 手势值总线",
     "fontsize": 12.0,
     "fontface": 1
    }
   },
   {
    "box": {
     "id": "obj-6",
     "maxclass": "comment",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      30.0,
      42.0,
      140.0,
      20.0
     ],
     "text": "Gesture Control",
     "presentation": 1,
     "presentation_rect": [
      6.0,
      3.0,
      106.0,
      18.0
     ],
     "textcolor": [
      0.98,
      0.65,
      0.12,
      1.0
     ],
     "fontsize": 12.0,
     "fontface": 1
    }
   },
   {
    "box": {
     "id": "obj-7",
     "maxclass": "comment",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      200.0,
      42.0,
      34.0,
      18.0
     ],
     "text": "Port",
     "presentation": 1,
     "presentation_rect": [
      112.0,
      5.0,
      28.0,
      16.0
     ],
     "textcolor": [
      0.82,
      0.82,
      0.82,
      1.0
     ],
     "fontsize": 10.0
    }
   },
   {
    "box": {
     "id": "obj-8",
     "maxclass": "live.numbox",
     "numinlets": 1,
     "numoutlets": 2,
     "patching_rect": [
      240.0,
      42.0,
      50.0,
      15.0
     ],
     "outlettype": [
      "",
      "float"
     ],
     "presentation": 1,
     "presentation_rect": [
      140.0,
      4.0,
      46.0,
      16.0
     ],
     "parameter_enable": 1,
     "varname": "osc_port",
     "saved_attribute_attributes": {
      "valueof": {
       "parameter_longname": "OSC Port",
       "parameter_shortname": "Port",
       "parameter_type": 0,
       "parameter_mmin": 1024.0,
       "parameter_mmax": 65535.0,
       "parameter_initial": [
        9000.0
       ],
       "parameter_initial_enable": 1,
       "parameter_unitstyle": 0,
       "parameter_invisible": 1
      }
     }
    }
   },
   {
    "box": {
     "id": "obj-9",
     "maxclass": "newobj",
     "numinlets": 0,
     "numoutlets": 1,
     "patching_rect": [
      300.0,
      42.0,
      70.0,
      20.0
     ],
     "outlettype": [
      ""
     ],
     "text": "r ---wbang"
    }
   },
   {
    "box": {
     "id": "obj-10",
     "maxclass": "newobj",
     "numinlets": 1,
     "numoutlets": 1,
     "patching_rect": [
      240.0,
      68.0,
      32.0,
      22.0
     ],
     "outlettype": [
      "int"
     ],
     "text": "t i"
    }
   },
   {
    "box": {
     "id": "obj-11",
     "maxclass": "newobj",
     "numinlets": 2,
     "numoutlets": 3,
     "patching_rect": [
      240.0,
      94.0,
      80.0,
      22.0
     ],
     "outlettype": [
      "int",
      "int",
      "int"
     ],
     "text": "change 9000"
    }
   },
   {
    "box": {
     "id": "obj-12",
     "maxclass": "newobj",
     "numinlets": 1,
     "numoutlets": 1,
     "patching_rect": [
      240.0,
      120.0,
      85.0,
      22.0
     ],
     "outlettype": [
      ""
     ],
     "text": "prepend port"
    }
   },
   {
    "box": {
     "id": "obj-13",
     "maxclass": "newobj",
     "numinlets": 1,
     "numoutlets": 2,
     "patching_rect": [
      700.0,
      76.0,
      170.0,
      22.0
     ],
     "outlettype": [
      "",
      ""
     ],
     "text": "node.script gc_launcher.js"
    }
   },
   {
    "box": {
     "id": "obj-14",
     "maxclass": "newobj",
     "numinlets": 1,
     "numoutlets": 1,
     "patching_rect": [
      30.0,
      130.0,
      110.0,
      22.0
     ],
     "outlettype": [
      ""
     ],
     "text": "udpreceive 9000"
    }
   },
   {
    "box": {
     "id": "obj-15",
     "maxclass": "newobj",
     "numinlets": 1,
     "numoutlets": 13,
     "patching_rect": [
      30.0,
      175.0,
      780.0,
      22.0
     ],
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
     "text": "route /gesture/left/openness /gesture/left/fist /gesture/right/openness /gesture/right/fist /gesture/hands/distance /gesture/left/x /gesture/left/y /gesture/right/x /gesture/right/y /gesture/left/detected /gesture/right/detected /gesture/camera/status"
    }
   },
   {
    "box": {
     "id": "obj-16",
     "maxclass": "newobj",
     "numinlets": 3,
     "numoutlets": 1,
     "patching_rect": [
      30.0,
      230.0,
      60.0,
      22.0
     ],
     "outlettype": [
      ""
     ],
     "text": "clip 0. 1."
    }
   },
   {
    "box": {
     "id": "obj-17",
     "maxclass": "newobj",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      30.0,
      262.0,
      60.0,
      20.0
     ],
     "text": "s ---g1"
    }
   },
   {
    "box": {
     "id": "obj-18",
     "maxclass": "newobj",
     "numinlets": 3,
     "numoutlets": 1,
     "patching_rect": [
      120.0,
      230.0,
      60.0,
      22.0
     ],
     "outlettype": [
      ""
     ],
     "text": "clip 0 1"
    }
   },
   {
    "box": {
     "id": "obj-19",
     "maxclass": "newobj",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      120.0,
      262.0,
      60.0,
      20.0
     ],
     "text": "s ---g2"
    }
   },
   {
    "box": {
     "id": "obj-20",
     "maxclass": "newobj",
     "numinlets": 3,
     "numoutlets": 1,
     "patching_rect": [
      210.0,
      230.0,
      60.0,
      22.0
     ],
     "outlettype": [
      ""
     ],
     "text": "clip 0. 1."
    }
   },
   {
    "box": {
     "id": "obj-21",
     "maxclass": "newobj",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      210.0,
      262.0,
      60.0,
      20.0
     ],
     "text": "s ---g3"
    }
   },
   {
    "box": {
     "id": "obj-22",
     "maxclass": "newobj",
     "numinlets": 3,
     "numoutlets": 1,
     "patching_rect": [
      300.0,
      230.0,
      60.0,
      22.0
     ],
     "outlettype": [
      ""
     ],
     "text": "clip 0 1"
    }
   },
   {
    "box": {
     "id": "obj-23",
     "maxclass": "newobj",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      300.0,
      262.0,
      60.0,
      20.0
     ],
     "text": "s ---g4"
    }
   },
   {
    "box": {
     "id": "obj-24",
     "maxclass": "newobj",
     "numinlets": 3,
     "numoutlets": 1,
     "patching_rect": [
      390.0,
      230.0,
      60.0,
      22.0
     ],
     "outlettype": [
      ""
     ],
     "text": "clip 0. 1."
    }
   },
   {
    "box": {
     "id": "obj-25",
     "maxclass": "newobj",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      390.0,
      262.0,
      60.0,
      20.0
     ],
     "text": "s ---g5"
    }
   },
   {
    "box": {
     "id": "obj-26",
     "maxclass": "newobj",
     "numinlets": 3,
     "numoutlets": 1,
     "patching_rect": [
      480.0,
      230.0,
      60.0,
      22.0
     ],
     "outlettype": [
      ""
     ],
     "text": "clip 0. 1."
    }
   },
   {
    "box": {
     "id": "obj-27",
     "maxclass": "newobj",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      480.0,
      262.0,
      60.0,
      20.0
     ],
     "text": "s ---g6"
    }
   },
   {
    "box": {
     "id": "obj-28",
     "maxclass": "newobj",
     "numinlets": 3,
     "numoutlets": 1,
     "patching_rect": [
      570.0,
      230.0,
      60.0,
      22.0
     ],
     "outlettype": [
      ""
     ],
     "text": "clip 0. 1."
    }
   },
   {
    "box": {
     "id": "obj-29",
     "maxclass": "newobj",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      570.0,
      262.0,
      60.0,
      20.0
     ],
     "text": "s ---g7"
    }
   },
   {
    "box": {
     "id": "obj-30",
     "maxclass": "newobj",
     "numinlets": 3,
     "numoutlets": 1,
     "patching_rect": [
      660.0,
      230.0,
      60.0,
      22.0
     ],
     "outlettype": [
      ""
     ],
     "text": "clip 0. 1."
    }
   },
   {
    "box": {
     "id": "obj-31",
     "maxclass": "newobj",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      660.0,
      262.0,
      60.0,
      20.0
     ],
     "text": "s ---g8"
    }
   },
   {
    "box": {
     "id": "obj-32",
     "maxclass": "newobj",
     "numinlets": 3,
     "numoutlets": 1,
     "patching_rect": [
      750.0,
      230.0,
      60.0,
      22.0
     ],
     "outlettype": [
      ""
     ],
     "text": "clip 0. 1."
    }
   },
   {
    "box": {
     "id": "obj-33",
     "maxclass": "newobj",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      750.0,
      262.0,
      60.0,
      20.0
     ],
     "text": "s ---g9"
    }
   },
   {
    "box": {
     "id": "obj-34",
     "maxclass": "newobj",
     "numinlets": 1,
     "numoutlets": 2,
     "patching_rect": [
      850.0,
      130.0,
      40.0,
      22.0
     ],
     "outlettype": [
      "bang",
      "bang"
     ],
     "text": "t b b"
    }
   },
   {
    "box": {
     "id": "obj-35",
     "maxclass": "newobj",
     "numinlets": 2,
     "numoutlets": 1,
     "patching_rect": [
      850.0,
      162.0,
      75.0,
      22.0
     ],
     "outlettype": [
      "bang"
     ],
     "text": "delay 1500"
    }
   },
   {
    "box": {
     "id": "obj-36",
     "maxclass": "message",
     "numinlets": 2,
     "numoutlets": 1,
     "patching_rect": [
      940.0,
      162.0,
      30.0,
      22.0
     ],
     "outlettype": [
      ""
     ],
     "text": "1"
    }
   },
   {
    "box": {
     "id": "obj-37",
     "maxclass": "message",
     "numinlets": 2,
     "numoutlets": 1,
     "patching_rect": [
      850.0,
      196.0,
      30.0,
      22.0
     ],
     "outlettype": [
      ""
     ],
     "text": "0"
    }
   },
   {
    "box": {
     "id": "obj-38",
     "maxclass": "led",
     "numinlets": 1,
     "numoutlets": 1,
     "patching_rect": [
      940.0,
      196.0,
      12.0,
      12.0
     ],
     "outlettype": [
      "int"
     ],
     "presentation": 1,
     "presentation_rect": [
      196.0,
      5.0,
      12.0,
      12.0
     ],
     "parameter_enable": 0,
     "varname": "led_osc",
     "oncolor": [
      0.3,
      0.85,
      0.4,
      1.0
     ],
     "offcolor": [
      0.27,
      0.27,
      0.27,
      1.0
     ]
    }
   },
   {
    "box": {
     "id": "obj-39",
     "maxclass": "comment",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      956.0,
      194.0,
      40.0,
      16.0
     ],
     "text": "OSC",
     "presentation": 1,
     "presentation_rect": [
      210.0,
      4.0,
      44.0,
      16.0
     ],
     "textcolor": [
      0.82,
      0.82,
      0.82,
      1.0
     ],
     "fontsize": 10.0
    }
   },
   {
    "box": {
     "id": "obj-40",
     "maxclass": "led",
     "numinlets": 1,
     "numoutlets": 1,
     "patching_rect": [
      1060.0,
      300.0,
      12.0,
      12.0
     ],
     "outlettype": [
      "int"
     ],
     "presentation": 1,
     "presentation_rect": [
      248.0,
      5.0,
      12.0,
      12.0
     ],
     "parameter_enable": 0,
     "varname": "led_cam",
     "oncolor": [
      0.3,
      0.85,
      0.4,
      1.0
     ],
     "offcolor": [
      0.27,
      0.27,
      0.27,
      1.0
     ]
    }
   },
   {
    "box": {
     "id": "obj-41",
     "maxclass": "comment",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      1076.0,
      298.0,
      40.0,
      16.0
     ],
     "text": "Cam",
     "presentation": 1,
     "presentation_rect": [
      262.0,
      4.0,
      46.0,
      16.0
     ],
     "textcolor": [
      0.82,
      0.82,
      0.82,
      1.0
     ],
     "fontsize": 10.0
    }
   },
   {
    "box": {
     "id": "obj-42",
     "maxclass": "led",
     "numinlets": 1,
     "numoutlets": 1,
     "patching_rect": [
      1150.0,
      130.0,
      12.0,
      12.0
     ],
     "outlettype": [
      "int"
     ],
     "presentation": 1,
     "presentation_rect": [
      300.0,
      5.0,
      12.0,
      12.0
     ],
     "parameter_enable": 0,
     "varname": "led_left",
     "oncolor": [
      0.3,
      0.85,
      0.4,
      1.0
     ],
     "offcolor": [
      0.27,
      0.27,
      0.27,
      1.0
     ]
    }
   },
   {
    "box": {
     "id": "obj-43",
     "maxclass": "comment",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      1166.0,
      128.0,
      40.0,
      16.0
     ],
     "text": "L",
     "presentation": 1,
     "presentation_rect": [
      314.0,
      4.0,
      30.0,
      16.0
     ],
     "textcolor": [
      0.82,
      0.82,
      0.82,
      1.0
     ],
     "fontsize": 10.0
    }
   },
   {
    "box": {
     "id": "obj-44",
     "maxclass": "led",
     "numinlets": 1,
     "numoutlets": 1,
     "patching_rect": [
      1150.0,
      165.0,
      12.0,
      12.0
     ],
     "outlettype": [
      "int"
     ],
     "presentation": 1,
     "presentation_rect": [
      336.0,
      5.0,
      12.0,
      12.0
     ],
     "parameter_enable": 0,
     "varname": "led_right",
     "oncolor": [
      0.3,
      0.85,
      0.4,
      1.0
     ],
     "offcolor": [
      0.27,
      0.27,
      0.27,
      1.0
     ]
    }
   },
   {
    "box": {
     "id": "obj-45",
     "maxclass": "comment",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      1166.0,
      163.0,
      40.0,
      16.0
     ],
     "text": "R",
     "presentation": 1,
     "presentation_rect": [
      350.0,
      4.0,
      30.0,
      16.0
     ],
     "textcolor": [
      0.82,
      0.82,
      0.82,
      1.0
     ],
     "fontsize": 10.0
    }
   },
   {
    "box": {
     "id": "obj-46",
     "maxclass": "newobj",
     "numinlets": 1,
     "numoutlets": 2,
     "patching_rect": [
      1000.0,
      230.0,
      40.0,
      22.0
     ],
     "outlettype": [
      "bang",
      "int"
     ],
     "text": "t b i"
    }
   },
   {
    "box": {
     "id": "obj-47",
     "maxclass": "newobj",
     "numinlets": 2,
     "numoutlets": 1,
     "patching_rect": [
      1000.0,
      262.0,
      75.0,
      22.0
     ],
     "outlettype": [
      "bang"
     ],
     "text": "delay 1600"
    }
   },
   {
    "box": {
     "id": "obj-48",
     "maxclass": "message",
     "numinlets": 2,
     "numoutlets": 1,
     "patching_rect": [
      1000.0,
      296.0,
      30.0,
      22.0
     ],
     "outlettype": [
      ""
     ],
     "text": "0"
    }
   },
   {
    "box": {
     "id": "obj-49",
     "maxclass": "newobj",
     "numinlets": 2,
     "numoutlets": 1,
     "patching_rect": [
      1090.0,
      262.0,
      40.0,
      22.0
     ],
     "outlettype": [
      "int"
     ],
     "text": "== 1"
    }
   },
   {
    "box": {
     "id": "obj-50",
     "maxclass": "newobj",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      1150.0,
      230.0,
      130.0,
      22.0
     ],
     "text": "print GC-unmatched"
    }
   },
   {
    "box": {
     "id": "obj-51",
     "maxclass": "newobj",
     "numinlets": 1,
     "numoutlets": 1,
     "patching_rect": [
      1300.0,
      130.0,
      50.0,
      22.0
     ],
     "outlettype": [
      "int"
     ],
     "text": "midiin"
    }
   },
   {
    "box": {
     "id": "obj-52",
     "maxclass": "newobj",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      1300.0,
      165.0,
      55.0,
      22.0
     ],
     "text": "midiout"
    }
   },
   {
    "box": {
     "id": "obj-53",
     "maxclass": "comment",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      30.0,
      300.0,
      560.0,
      20.0
     ],
     "text": "2) 方式A：live.* 参数（自动化 / 保存 / Push），由 clip 直接驱动",
     "fontsize": 12.0,
     "fontface": 1
    }
   },
   {
    "box": {
     "id": "obj-54",
     "maxclass": "live.dial",
     "numinlets": 1,
     "numoutlets": 2,
     "patching_rect": [
      30.0,
      330.0,
      44.0,
      48.0
     ],
     "outlettype": [
      "",
      "float"
     ],
     "presentation": 1,
     "presentation_rect": [
      6.0,
      30.0,
      44.0,
      48.0
     ],
     "parameter_enable": 1,
     "varname": "LO_param",
     "saved_attribute_attributes": {
      "valueof": {
       "parameter_longname": "Left Open",
       "parameter_shortname": "L Open",
       "parameter_type": 0,
       "parameter_mmin": 0.0,
       "parameter_mmax": 1.0,
       "parameter_initial": [
        0.0
       ],
       "parameter_initial_enable": 1,
       "parameter_unitstyle": 1
      }
     }
    }
   },
   {
    "box": {
     "id": "obj-55",
     "maxclass": "live.toggle",
     "numinlets": 1,
     "numoutlets": 1,
     "patching_rect": [
      120.0,
      330.0,
      18.0,
      18.0
     ],
     "outlettype": [
      ""
     ],
     "presentation": 1,
     "presentation_rect": [
      14.0,
      88.0,
      15.0,
      15.0
     ],
     "parameter_enable": 1,
     "varname": "LF_param",
     "saved_attribute_attributes": {
      "valueof": {
       "parameter_longname": "Left Fist",
       "parameter_shortname": "L Fist",
       "parameter_type": 2,
       "parameter_mmax": 1,
       "parameter_initial": [
        0
       ],
       "parameter_initial_enable": 1,
       "parameter_enum": [
        "off",
        "on"
       ]
      }
     }
    }
   },
   {
    "box": {
     "id": "obj-56",
     "maxclass": "comment",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      120.0,
      352.0,
      44.0,
      16.0
     ],
     "text": "L Fist",
     "presentation": 1,
     "presentation_rect": [
      2.0,
      106.0,
      44.0,
      16.0
     ],
     "textcolor": [
      0.82,
      0.82,
      0.82,
      1.0
     ],
     "fontsize": 9.0
    }
   },
   {
    "box": {
     "id": "obj-57",
     "maxclass": "live.dial",
     "numinlets": 1,
     "numoutlets": 2,
     "patching_rect": [
      210.0,
      330.0,
      44.0,
      48.0
     ],
     "outlettype": [
      "",
      "float"
     ],
     "presentation": 1,
     "presentation_rect": [
      102.0,
      30.0,
      44.0,
      48.0
     ],
     "parameter_enable": 1,
     "varname": "RO_param",
     "saved_attribute_attributes": {
      "valueof": {
       "parameter_longname": "Right Open",
       "parameter_shortname": "R Open",
       "parameter_type": 0,
       "parameter_mmin": 0.0,
       "parameter_mmax": 1.0,
       "parameter_initial": [
        0.0
       ],
       "parameter_initial_enable": 1,
       "parameter_unitstyle": 1
      }
     }
    }
   },
   {
    "box": {
     "id": "obj-58",
     "maxclass": "live.toggle",
     "numinlets": 1,
     "numoutlets": 1,
     "patching_rect": [
      300.0,
      330.0,
      18.0,
      18.0
     ],
     "outlettype": [
      ""
     ],
     "presentation": 1,
     "presentation_rect": [
      110.0,
      88.0,
      15.0,
      15.0
     ],
     "parameter_enable": 1,
     "varname": "RF_param",
     "saved_attribute_attributes": {
      "valueof": {
       "parameter_longname": "Right Fist",
       "parameter_shortname": "R Fist",
       "parameter_type": 2,
       "parameter_mmax": 1,
       "parameter_initial": [
        0
       ],
       "parameter_initial_enable": 1,
       "parameter_enum": [
        "off",
        "on"
       ]
      }
     }
    }
   },
   {
    "box": {
     "id": "obj-59",
     "maxclass": "comment",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      300.0,
      352.0,
      44.0,
      16.0
     ],
     "text": "R Fist",
     "presentation": 1,
     "presentation_rect": [
      98.0,
      106.0,
      44.0,
      16.0
     ],
     "textcolor": [
      0.82,
      0.82,
      0.82,
      1.0
     ],
     "fontsize": 9.0
    }
   },
   {
    "box": {
     "id": "obj-60",
     "maxclass": "live.dial",
     "numinlets": 1,
     "numoutlets": 2,
     "patching_rect": [
      390.0,
      330.0,
      44.0,
      48.0
     ],
     "outlettype": [
      "",
      "float"
     ],
     "presentation": 1,
     "presentation_rect": [
      54.0,
      30.0,
      44.0,
      48.0
     ],
     "parameter_enable": 1,
     "varname": "HD_param",
     "saved_attribute_attributes": {
      "valueof": {
       "parameter_longname": "Hand Distance",
       "parameter_shortname": "H Dist",
       "parameter_type": 0,
       "parameter_mmin": 0.0,
       "parameter_mmax": 1.0,
       "parameter_initial": [
        0.0
       ],
       "parameter_initial_enable": 1,
       "parameter_unitstyle": 1
      }
     }
    }
   },
   {
    "box": {
     "id": "obj-61",
     "maxclass": "live.dial",
     "numinlets": 1,
     "numoutlets": 2,
     "patching_rect": [
      480.0,
      330.0,
      44.0,
      48.0
     ],
     "outlettype": [
      "",
      "float"
     ],
     "presentation": 1,
     "presentation_rect": [
      1014.0,
      28.0,
      44.0,
      48.0
     ],
     "parameter_enable": 1,
     "varname": "LX_param",
     "saved_attribute_attributes": {
      "valueof": {
       "parameter_longname": "Left X",
       "parameter_shortname": "L X",
       "parameter_type": 0,
       "parameter_mmin": 0.0,
       "parameter_mmax": 1.0,
       "parameter_initial": [
        0.0
       ],
       "parameter_initial_enable": 1,
       "parameter_unitstyle": 1
      }
     }
    }
   },
   {
    "box": {
     "id": "obj-62",
     "maxclass": "live.dial",
     "numinlets": 1,
     "numoutlets": 2,
     "patching_rect": [
      570.0,
      330.0,
      44.0,
      48.0
     ],
     "outlettype": [
      "",
      "float"
     ],
     "presentation": 1,
     "presentation_rect": [
      1064.0,
      28.0,
      44.0,
      48.0
     ],
     "parameter_enable": 1,
     "varname": "LY_param",
     "saved_attribute_attributes": {
      "valueof": {
       "parameter_longname": "Left Y",
       "parameter_shortname": "L Y",
       "parameter_type": 0,
       "parameter_mmin": 0.0,
       "parameter_mmax": 1.0,
       "parameter_initial": [
        0.0
       ],
       "parameter_initial_enable": 1,
       "parameter_unitstyle": 1
      }
     }
    }
   },
   {
    "box": {
     "id": "obj-63",
     "maxclass": "live.dial",
     "numinlets": 1,
     "numoutlets": 2,
     "patching_rect": [
      660.0,
      330.0,
      44.0,
      48.0
     ],
     "outlettype": [
      "",
      "float"
     ],
     "presentation": 1,
     "presentation_rect": [
      1014.0,
      78.0,
      44.0,
      48.0
     ],
     "parameter_enable": 1,
     "varname": "RX_param",
     "saved_attribute_attributes": {
      "valueof": {
       "parameter_longname": "Right X",
       "parameter_shortname": "R X",
       "parameter_type": 0,
       "parameter_mmin": 0.0,
       "parameter_mmax": 1.0,
       "parameter_initial": [
        0.0
       ],
       "parameter_initial_enable": 1,
       "parameter_unitstyle": 1
      }
     }
    }
   },
   {
    "box": {
     "id": "obj-64",
     "maxclass": "live.dial",
     "numinlets": 1,
     "numoutlets": 2,
     "patching_rect": [
      750.0,
      330.0,
      44.0,
      48.0
     ],
     "outlettype": [
      "",
      "float"
     ],
     "presentation": 1,
     "presentation_rect": [
      1064.0,
      78.0,
      44.0,
      48.0
     ],
     "parameter_enable": 1,
     "varname": "RY_param",
     "saved_attribute_attributes": {
      "valueof": {
       "parameter_longname": "Right Y",
       "parameter_shortname": "R Y",
       "parameter_type": 0,
       "parameter_mmin": 0.0,
       "parameter_mmax": 1.0,
       "parameter_initial": [
        0.0
       ],
       "parameter_initial_enable": 1,
       "parameter_unitstyle": 1
      }
     }
    }
   },
   {
    "box": {
     "id": "obj-65",
     "maxclass": "comment",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      1250.0,
      20.0,
      420.0,
      34.0
     ],
     "text": "3) 初始化：设备就绪 → js init → 控件值回灌(---wbang) → pattr 恢复(---restore)",
     "fontsize": 12.0,
     "fontface": 1
    }
   },
   {
    "box": {
     "id": "obj-66",
     "maxclass": "live.thisdevice",
     "numinlets": 1,
     "numoutlets": 3,
     "patching_rect": [
      1250.0,
      60.0,
      100.0,
      22.0
     ],
     "outlettype": [
      "bang",
      "int",
      "int"
     ]
    }
   },
   {
    "box": {
     "id": "obj-67",
     "maxclass": "newobj",
     "numinlets": 1,
     "numoutlets": 1,
     "patching_rect": [
      1250.0,
      92.0,
      60.0,
      22.0
     ],
     "outlettype": [
      ""
     ],
     "text": "deferlow"
    }
   },
   {
    "box": {
     "id": "obj-68",
     "maxclass": "newobj",
     "numinlets": 1,
     "numoutlets": 3,
     "patching_rect": [
      1250.0,
      124.0,
      60.0,
      22.0
     ],
     "outlettype": [
      "bang",
      "bang",
      "bang"
     ],
     "text": "t b b b"
    }
   },
   {
    "box": {
     "id": "obj-69",
     "maxclass": "message",
     "numinlets": 2,
     "numoutlets": 1,
     "patching_rect": [
      1390.0,
      156.0,
      40.0,
      22.0
     ],
     "outlettype": [
      ""
     ],
     "text": "init"
    }
   },
   {
    "box": {
     "id": "obj-70",
     "maxclass": "newobj",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      1390.0,
      188.0,
      80.0,
      20.0
     ],
     "text": "s ---jscmd"
    }
   },
   {
    "box": {
     "id": "obj-71",
     "maxclass": "newobj",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      1310.0,
      156.0,
      80.0,
      20.0
     ],
     "text": "s ---wbang"
    }
   },
   {
    "box": {
     "id": "obj-72",
     "maxclass": "newobj",
     "numinlets": 2,
     "numoutlets": 1,
     "patching_rect": [
      1230.0,
      156.0,
      60.0,
      22.0
     ],
     "outlettype": [
      "bang"
     ],
     "text": "del 300"
    }
   },
   {
    "box": {
     "id": "obj-73",
     "maxclass": "newobj",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      1230.0,
      188.0,
      90.0,
      20.0
     ],
     "text": "s ---restore"
    }
   },
   {
    "box": {
     "id": "obj-74",
     "maxclass": "comment",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      1250.0,
      240.0,
      420.0,
      20.0
     ],
     "text": "4) js 映射管理：命令入(---jscmd)，各槽输出(---slot1..8)",
     "fontsize": 12.0,
     "fontface": 1
    }
   },
   {
    "box": {
     "id": "obj-75",
     "maxclass": "newobj",
     "numinlets": 0,
     "numoutlets": 1,
     "patching_rect": [
      1250.0,
      268.0,
      80.0,
      20.0
     ],
     "outlettype": [
      ""
     ],
     "text": "r ---jscmd"
    }
   },
   {
    "box": {
     "id": "obj-76",
     "maxclass": "newobj",
     "numinlets": 1,
     "numoutlets": 8,
     "patching_rect": [
      1250.0,
      300.0,
      160.0,
      22.0
     ],
     "outlettype": [
      "",
      "",
      "",
      "",
      "",
      "",
      "",
      ""
     ],
     "text": "js gesture_mapper.js"
    }
   },
   {
    "box": {
     "id": "obj-77",
     "maxclass": "newobj",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      1250.0,
      340.0,
      90.0,
      20.0
     ],
     "text": "s ---slot1"
    }
   },
   {
    "box": {
     "id": "obj-78",
     "maxclass": "newobj",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      1360.0,
      340.0,
      90.0,
      20.0
     ],
     "text": "s ---slot2"
    }
   },
   {
    "box": {
     "id": "obj-79",
     "maxclass": "newobj",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      1470.0,
      340.0,
      90.0,
      20.0
     ],
     "text": "s ---slot3"
    }
   },
   {
    "box": {
     "id": "obj-80",
     "maxclass": "newobj",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      1580.0,
      340.0,
      90.0,
      20.0
     ],
     "text": "s ---slot4"
    }
   },
   {
    "box": {
     "id": "obj-81",
     "maxclass": "newobj",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      1250.0,
      370.0,
      90.0,
      20.0
     ],
     "text": "s ---slot5"
    }
   },
   {
    "box": {
     "id": "obj-82",
     "maxclass": "newobj",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      1360.0,
      370.0,
      90.0,
      20.0
     ],
     "text": "s ---slot6"
    }
   },
   {
    "box": {
     "id": "obj-83",
     "maxclass": "newobj",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      1470.0,
      370.0,
      90.0,
      20.0
     ],
     "text": "s ---slot7"
    }
   },
   {
    "box": {
     "id": "obj-84",
     "maxclass": "newobj",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      1580.0,
      370.0,
      90.0,
      20.0
     ],
     "text": "s ---slot8"
    }
   },
   {
    "box": {
     "id": "obj-85",
     "maxclass": "comment",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      440.0,
      20.0,
      460.0,
      20.0
     ],
     "text": "6) Tracker 启动器：node.script 启动/停止 Python 进程，日志转发 Max Console",
     "fontsize": 12.0,
     "fontface": 1
    }
   },
   {
    "box": {
     "id": "obj-86",
     "maxclass": "message",
     "numinlets": 2,
     "numoutlets": 1,
     "patching_rect": [
      700.0,
      44.0,
      70.0,
      22.0
     ],
     "outlettype": [
      ""
     ],
     "text": "script start"
    }
   },
   {
    "box": {
     "id": "obj-87",
     "maxclass": "newobj",
     "numinlets": 1,
     "numoutlets": 1,
     "patching_rect": [
      340.0,
      94.0,
      90.0,
      22.0
     ],
     "outlettype": [
      ""
     ],
     "text": "prepend port"
    }
   },
   {
    "box": {
     "id": "obj-88",
     "maxclass": "live.toggle",
     "numinlets": 1,
     "numoutlets": 1,
     "patching_rect": [
      440.0,
      42.0,
      15.0,
      15.0
     ],
     "outlettype": [
      ""
     ],
     "presentation": 1,
     "presentation_rect": [
      526.0,
      5.0,
      12.0,
      12.0
     ],
     "parameter_enable": 1,
     "varname": "trk_preview",
     "saved_attribute_attributes": {
      "valueof": {
       "parameter_longname": "Tracker Preview",
       "parameter_shortname": "Prev",
       "parameter_type": 2,
       "parameter_mmax": 1,
       "parameter_initial": [
        1
       ],
       "parameter_initial_enable": 1,
       "parameter_invisible": 1,
       "parameter_enum": [
        "off",
        "on"
       ]
      }
     }
    }
   },
   {
    "box": {
     "id": "obj-89",
     "maxclass": "comment",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      460.0,
      40.0,
      40.0,
      16.0
     ],
     "text": "Prev",
     "presentation": 1,
     "presentation_rect": [
      540.0,
      4.0,
      34.0,
      16.0
     ],
     "textcolor": [
      0.82,
      0.82,
      0.82,
      1.0
     ],
     "fontsize": 10.0
    }
   },
   {
    "box": {
     "id": "obj-90",
     "maxclass": "newobj",
     "numinlets": 1,
     "numoutlets": 1,
     "patching_rect": [
      440.0,
      94.0,
      100.0,
      22.0
     ],
     "outlettype": [
      ""
     ],
     "text": "prepend preview"
    }
   },
   {
    "box": {
     "id": "obj-91",
     "maxclass": "textbutton",
     "numinlets": 1,
     "numoutlets": 3,
     "patching_rect": [
      560.0,
      42.0,
      48.0,
      18.0
     ],
     "outlettype": [
      "",
      "",
      ""
     ],
     "text": "Launch",
     "presentation": 1,
     "presentation_rect": [
      430.0,
      4.0,
      46.0,
      16.0
     ],
     "bgcolor": [
      0.22,
      0.22,
      0.22,
      1.0
     ],
     "bgoncolor": [
      0.98,
      0.65,
      0.12,
      1.0
     ],
     "textcolor": [
      0.88,
      0.88,
      0.88,
      1.0
     ],
     "textoncolor": [
      0.1,
      0.1,
      0.1,
      1.0
     ],
     "bordercolor": [
      0.38,
      0.38,
      0.38,
      1.0
     ],
     "rounded": 8.0
    }
   },
   {
    "box": {
     "id": "obj-92",
     "maxclass": "textbutton",
     "numinlets": 1,
     "numoutlets": 3,
     "patching_rect": [
      614.0,
      42.0,
      40.0,
      18.0
     ],
     "outlettype": [
      "",
      "",
      ""
     ],
     "text": "Stop",
     "presentation": 1,
     "presentation_rect": [
      480.0,
      4.0,
      40.0,
      16.0
     ],
     "bgcolor": [
      0.22,
      0.22,
      0.22,
      1.0
     ],
     "bgoncolor": [
      0.98,
      0.65,
      0.12,
      1.0
     ],
     "textcolor": [
      0.88,
      0.88,
      0.88,
      1.0
     ],
     "textoncolor": [
      0.1,
      0.1,
      0.1,
      1.0
     ],
     "bordercolor": [
      0.38,
      0.38,
      0.38,
      1.0
     ],
     "rounded": 8.0
    }
   },
   {
    "box": {
     "id": "obj-93",
     "maxclass": "newobj",
     "numinlets": 1,
     "numoutlets": 3,
     "patching_rect": [
      560.0,
      68.0,
      60.0,
      22.0
     ],
     "outlettype": [
      "bang",
      "bang",
      "bang"
     ],
     "text": "t b b b"
    }
   },
   {
    "box": {
     "id": "obj-94",
     "maxclass": "message",
     "numinlets": 2,
     "numoutlets": 1,
     "patching_rect": [
      560.0,
      96.0,
      50.0,
      22.0
     ],
     "outlettype": [
      ""
     ],
     "text": "launch"
    }
   },
   {
    "box": {
     "id": "obj-95",
     "maxclass": "message",
     "numinlets": 2,
     "numoutlets": 1,
     "patching_rect": [
      620.0,
      96.0,
      40.0,
      22.0
     ],
     "outlettype": [
      ""
     ],
     "text": "stop"
    }
   },
   {
    "box": {
     "id": "obj-96",
     "maxclass": "newobj",
     "numinlets": 1,
     "numoutlets": 2,
     "patching_rect": [
      700.0,
      108.0,
      90.0,
      22.0
     ],
     "outlettype": [
      "",
      ""
     ],
     "text": "route running"
    }
   },
   {
    "box": {
     "id": "obj-97",
     "maxclass": "led",
     "numinlets": 1,
     "numoutlets": 1,
     "patching_rect": [
      800.0,
      108.0,
      12.0,
      12.0
     ],
     "outlettype": [
      "int"
     ],
     "presentation": 1,
     "presentation_rect": [
      382.0,
      5.0,
      12.0,
      12.0
     ],
     "parameter_enable": 0,
     "varname": "led_trk",
     "oncolor": [
      0.3,
      0.85,
      0.4,
      1.0
     ],
     "offcolor": [
      0.27,
      0.27,
      0.27,
      1.0
     ]
    }
   },
   {
    "box": {
     "id": "obj-98",
     "maxclass": "comment",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      816.0,
      106.0,
      40.0,
      16.0
     ],
     "text": "Trk",
     "presentation": 1,
     "presentation_rect": [
      396.0,
      4.0,
      30.0,
      16.0
     ],
     "textcolor": [
      0.82,
      0.82,
      0.82,
      1.0
     ],
     "fontsize": 10.0
    }
   },
   {
    "box": {
     "id": "obj-99",
     "maxclass": "comment",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      30.0,
      420.0,
      900.0,
      20.0
     ],
     "text": "5) 映射槽：r ---g* → switch(Src 选源) → expr(Min/Max/Inv) → line(Time) → expr(目标 min/max 缩放) → live.remote~；js 经 r ---slotN 控制绑定/量程/显示",
     "fontsize": 12.0,
     "fontface": 1
    }
   },
   {
    "box": {
     "id": "obj-100",
     "maxclass": "comment",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      1450.0,
      380.0,
      60.0,
      14.0
     ],
     "text": "Src",
     "presentation": 1,
     "presentation_rect": [
      158.0,
      26.0,
      50.0,
      14.0
     ],
     "textcolor": [
      0.52,
      0.52,
      0.52,
      1.0
     ],
     "fontsize": 9.0
    }
   },
   {
    "box": {
     "id": "obj-101",
     "maxclass": "comment",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      1450.0,
      400.0,
      60.0,
      14.0
     ],
     "text": "Value",
     "presentation": 1,
     "presentation_rect": [
      214.0,
      26.0,
      38.0,
      14.0
     ],
     "textcolor": [
      0.52,
      0.52,
      0.52,
      1.0
     ],
     "fontsize": 9.0
    }
   },
   {
    "box": {
     "id": "obj-102",
     "maxclass": "comment",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      1450.0,
      420.0,
      60.0,
      14.0
     ],
     "text": "Map",
     "presentation": 1,
     "presentation_rect": [
      254.0,
      26.0,
      30.0,
      14.0
     ],
     "textcolor": [
      0.52,
      0.52,
      0.52,
      1.0
     ],
     "fontsize": 9.0
    }
   },
   {
    "box": {
     "id": "obj-103",
     "maxclass": "comment",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      1450.0,
      440.0,
      60.0,
      14.0
     ],
     "text": "Target",
     "presentation": 1,
     "presentation_rect": [
      304.0,
      26.0,
      60.0,
      14.0
     ],
     "textcolor": [
      0.52,
      0.52,
      0.52,
      1.0
     ],
     "fontsize": 9.0
    }
   },
   {
    "box": {
     "id": "obj-104",
     "maxclass": "comment",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      1450.0,
      460.0,
      60.0,
      14.0
     ],
     "text": "Min",
     "presentation": 1,
     "presentation_rect": [
      422.0,
      26.0,
      32.0,
      14.0
     ],
     "textcolor": [
      0.52,
      0.52,
      0.52,
      1.0
     ],
     "fontsize": 9.0
    }
   },
   {
    "box": {
     "id": "obj-105",
     "maxclass": "comment",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      1450.0,
      480.0,
      60.0,
      14.0
     ],
     "text": "Max",
     "presentation": 1,
     "presentation_rect": [
      462.0,
      26.0,
      32.0,
      14.0
     ],
     "textcolor": [
      0.52,
      0.52,
      0.52,
      1.0
     ],
     "fontsize": 9.0
    }
   },
   {
    "box": {
     "id": "obj-106",
     "maxclass": "comment",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      1450.0,
      500.0,
      60.0,
      14.0
     ],
     "text": "Inv",
     "presentation": 1,
     "presentation_rect": [
      502.0,
      26.0,
      24.0,
      14.0
     ],
     "textcolor": [
      0.52,
      0.52,
      0.52,
      1.0
     ],
     "fontsize": 9.0
    }
   },
   {
    "box": {
     "id": "obj-107",
     "maxclass": "comment",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      1450.0,
      520.0,
      60.0,
      14.0
     ],
     "text": "Time",
     "presentation": 1,
     "presentation_rect": [
      520.0,
      26.0,
      38.0,
      14.0
     ],
     "textcolor": [
      0.52,
      0.52,
      0.52,
      1.0
     ],
     "fontsize": 9.0
    }
   },
   {
    "box": {
     "id": "obj-108",
     "maxclass": "comment",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      1450.0,
      540.0,
      60.0,
      14.0
     ],
     "text": "On",
     "presentation": 1,
     "presentation_rect": [
      560.0,
      26.0,
      22.0,
      14.0
     ],
     "textcolor": [
      0.52,
      0.52,
      0.52,
      1.0
     ],
     "fontsize": 9.0
    }
   },
   {
    "box": {
     "id": "obj-109",
     "maxclass": "comment",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      1650.0,
      380.0,
      60.0,
      14.0
     ],
     "text": "Src",
     "presentation": 1,
     "presentation_rect": [
      588.0,
      26.0,
      50.0,
      14.0
     ],
     "textcolor": [
      0.52,
      0.52,
      0.52,
      1.0
     ],
     "fontsize": 9.0
    }
   },
   {
    "box": {
     "id": "obj-110",
     "maxclass": "comment",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      1650.0,
      400.0,
      60.0,
      14.0
     ],
     "text": "Value",
     "presentation": 1,
     "presentation_rect": [
      644.0,
      26.0,
      38.0,
      14.0
     ],
     "textcolor": [
      0.52,
      0.52,
      0.52,
      1.0
     ],
     "fontsize": 9.0
    }
   },
   {
    "box": {
     "id": "obj-111",
     "maxclass": "comment",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      1650.0,
      420.0,
      60.0,
      14.0
     ],
     "text": "Map",
     "presentation": 1,
     "presentation_rect": [
      684.0,
      26.0,
      30.0,
      14.0
     ],
     "textcolor": [
      0.52,
      0.52,
      0.52,
      1.0
     ],
     "fontsize": 9.0
    }
   },
   {
    "box": {
     "id": "obj-112",
     "maxclass": "comment",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      1650.0,
      440.0,
      60.0,
      14.0
     ],
     "text": "Target",
     "presentation": 1,
     "presentation_rect": [
      734.0,
      26.0,
      60.0,
      14.0
     ],
     "textcolor": [
      0.52,
      0.52,
      0.52,
      1.0
     ],
     "fontsize": 9.0
    }
   },
   {
    "box": {
     "id": "obj-113",
     "maxclass": "comment",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      1650.0,
      460.0,
      60.0,
      14.0
     ],
     "text": "Min",
     "presentation": 1,
     "presentation_rect": [
      852.0,
      26.0,
      32.0,
      14.0
     ],
     "textcolor": [
      0.52,
      0.52,
      0.52,
      1.0
     ],
     "fontsize": 9.0
    }
   },
   {
    "box": {
     "id": "obj-114",
     "maxclass": "comment",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      1650.0,
      480.0,
      60.0,
      14.0
     ],
     "text": "Max",
     "presentation": 1,
     "presentation_rect": [
      892.0,
      26.0,
      32.0,
      14.0
     ],
     "textcolor": [
      0.52,
      0.52,
      0.52,
      1.0
     ],
     "fontsize": 9.0
    }
   },
   {
    "box": {
     "id": "obj-115",
     "maxclass": "comment",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      1650.0,
      500.0,
      60.0,
      14.0
     ],
     "text": "Inv",
     "presentation": 1,
     "presentation_rect": [
      932.0,
      26.0,
      24.0,
      14.0
     ],
     "textcolor": [
      0.52,
      0.52,
      0.52,
      1.0
     ],
     "fontsize": 9.0
    }
   },
   {
    "box": {
     "id": "obj-116",
     "maxclass": "comment",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      1650.0,
      520.0,
      60.0,
      14.0
     ],
     "text": "Time",
     "presentation": 1,
     "presentation_rect": [
      950.0,
      26.0,
      38.0,
      14.0
     ],
     "textcolor": [
      0.52,
      0.52,
      0.52,
      1.0
     ],
     "fontsize": 9.0
    }
   },
   {
    "box": {
     "id": "obj-117",
     "maxclass": "comment",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      1650.0,
      540.0,
      60.0,
      14.0
     ],
     "text": "On",
     "presentation": 1,
     "presentation_rect": [
      990.0,
      26.0,
      22.0,
      14.0
     ],
     "textcolor": [
      0.52,
      0.52,
      0.52,
      1.0
     ],
     "fontsize": 9.0
    }
   },
   {
    "box": {
     "id": "obj-118",
     "maxclass": "comment",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      30.0,
      456.0,
      320.0,
      18.0
     ],
     "text": "—— Slot 1 ——",
     "fontsize": 11.0,
     "fontface": 1
    }
   },
   {
    "box": {
     "id": "obj-119",
     "maxclass": "live.menu",
     "numinlets": 1,
     "numoutlets": 3,
     "patching_rect": [
      30.0,
      480.0,
      50.0,
      15.0
     ],
     "outlettype": [
      "",
      "",
      ""
     ],
     "presentation": 1,
     "presentation_rect": [
      158.0,
      43.0,
      50.0,
      15.0
     ],
     "parameter_enable": 1,
     "varname": "S1_source",
     "saved_attribute_attributes": {
      "valueof": {
       "parameter_longname": "S1 Source",
       "parameter_shortname": "Src",
       "parameter_type": 2,
       "parameter_mmax": 8,
       "parameter_initial": [
        0
       ],
       "parameter_initial_enable": 1,
       "parameter_invisible": 1,
       "parameter_enum": [
        "L Open",
        "L Fist",
        "R Open",
        "R Fist",
        "H Dist",
        "L X",
        "L Y",
        "R X",
        "R Y"
       ]
      }
     }
    }
   },
   {
    "box": {
     "id": "obj-120",
     "maxclass": "flonum",
     "numinlets": 1,
     "numoutlets": 2,
     "patching_rect": [
      88.0,
      480.0,
      46.0,
      22.0
     ],
     "outlettype": [
      "",
      "bang"
     ],
     "presentation": 1,
     "presentation_rect": [
      214.0,
      42.0,
      38.0,
      20.0
     ],
     "cantchange": 1,
     "numdecimalplaces": 2,
     "bgcolor": [
      0.18,
      0.18,
      0.18,
      1.0
     ],
     "textcolor": [
      0.9,
      0.9,
      0.9,
      1.0
     ]
    }
   },
   {
    "box": {
     "id": "obj-121",
     "maxclass": "textbutton",
     "numinlets": 1,
     "numoutlets": 3,
     "patching_rect": [
      142.0,
      480.0,
      36.0,
      20.0
     ],
     "outlettype": [
      "",
      "",
      ""
     ],
     "text": "Map",
     "presentation": 1,
     "presentation_rect": [
      254.0,
      42.0,
      30.0,
      18.0
     ],
     "bgcolor": [
      0.22,
      0.22,
      0.22,
      1.0
     ],
     "bgoncolor": [
      0.98,
      0.65,
      0.12,
      1.0
     ],
     "textcolor": [
      0.88,
      0.88,
      0.88,
      1.0
     ],
     "textoncolor": [
      0.1,
      0.1,
      0.1,
      1.0
     ],
     "bordercolor": [
      0.38,
      0.38,
      0.38,
      1.0
     ],
     "rounded": 8.0
    }
   },
   {
    "box": {
     "id": "obj-122",
     "maxclass": "textbutton",
     "numinlets": 1,
     "numoutlets": 3,
     "patching_rect": [
      184.0,
      480.0,
      20.0,
      20.0
     ],
     "outlettype": [
      "",
      "",
      ""
     ],
     "text": "x",
     "presentation": 1,
     "presentation_rect": [
      286.0,
      42.0,
      16.0,
      18.0
     ],
     "bgcolor": [
      0.22,
      0.22,
      0.22,
      1.0
     ],
     "bgoncolor": [
      0.98,
      0.65,
      0.12,
      1.0
     ],
     "textcolor": [
      0.88,
      0.88,
      0.88,
      1.0
     ],
     "textoncolor": [
      0.1,
      0.1,
      0.1,
      1.0
     ],
     "bordercolor": [
      0.38,
      0.38,
      0.38,
      1.0
     ],
     "rounded": 8.0
    }
   },
   {
    "box": {
     "id": "obj-123",
     "maxclass": "comment",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      212.0,
      482.0,
      140.0,
      16.0
     ],
     "text": "--",
     "presentation": 1,
     "presentation_rect": [
      304.0,
      44.0,
      114.0,
      16.0
     ],
     "textcolor": [
      0.55,
      0.78,
      0.95,
      1.0
     ],
     "fontsize": 10.0
    }
   },
   {
    "box": {
     "id": "obj-124",
     "maxclass": "live.numbox",
     "numinlets": 1,
     "numoutlets": 2,
     "patching_rect": [
      30.0,
      508.0,
      44.0,
      15.0
     ],
     "outlettype": [
      "",
      "float"
     ],
     "presentation": 1,
     "presentation_rect": [
      422.0,
      44.0,
      38.0,
      15.0
     ],
     "parameter_enable": 1,
     "varname": "S1_min",
     "saved_attribute_attributes": {
      "valueof": {
       "parameter_longname": "S1 Min",
       "parameter_shortname": "Min",
       "parameter_type": 0,
       "parameter_mmin": 0.0,
       "parameter_mmax": 1.0,
       "parameter_initial": [
        0.0
       ],
       "parameter_initial_enable": 1,
       "parameter_unitstyle": 1,
       "parameter_invisible": 1
      }
     }
    }
   },
   {
    "box": {
     "id": "obj-125",
     "maxclass": "live.numbox",
     "numinlets": 1,
     "numoutlets": 2,
     "patching_rect": [
      80.0,
      508.0,
      44.0,
      15.0
     ],
     "outlettype": [
      "",
      "float"
     ],
     "presentation": 1,
     "presentation_rect": [
      462.0,
      44.0,
      38.0,
      15.0
     ],
     "parameter_enable": 1,
     "varname": "S1_max",
     "saved_attribute_attributes": {
      "valueof": {
       "parameter_longname": "S1 Max",
       "parameter_shortname": "Max",
       "parameter_type": 0,
       "parameter_mmin": 0.0,
       "parameter_mmax": 1.0,
       "parameter_initial": [
        1.0
       ],
       "parameter_initial_enable": 1,
       "parameter_unitstyle": 1,
       "parameter_invisible": 1
      }
     }
    }
   },
   {
    "box": {
     "id": "obj-126",
     "maxclass": "live.toggle",
     "numinlets": 1,
     "numoutlets": 1,
     "patching_rect": [
      130.0,
      508.0,
      15.0,
      15.0
     ],
     "outlettype": [
      ""
     ],
     "presentation": 1,
     "presentation_rect": [
      504.0,
      45.0,
      14.0,
      14.0
     ],
     "parameter_enable": 1,
     "varname": "S1_invert",
     "saved_attribute_attributes": {
      "valueof": {
       "parameter_longname": "S1 Invert",
       "parameter_shortname": "Inv",
       "parameter_type": 2,
       "parameter_mmax": 1,
       "parameter_initial": [
        0
       ],
       "parameter_initial_enable": 1,
       "parameter_invisible": 1,
       "parameter_enum": [
        "off",
        "on"
       ]
      }
     }
    }
   },
   {
    "box": {
     "id": "obj-127",
     "maxclass": "live.numbox",
     "numinlets": 1,
     "numoutlets": 2,
     "patching_rect": [
      152.0,
      508.0,
      44.0,
      15.0
     ],
     "outlettype": [
      "",
      "float"
     ],
     "presentation": 1,
     "presentation_rect": [
      520.0,
      44.0,
      40.0,
      15.0
     ],
     "parameter_enable": 1,
     "varname": "S1_smooth",
     "saved_attribute_attributes": {
      "valueof": {
       "parameter_longname": "S1 Smooth",
       "parameter_shortname": "Time",
       "parameter_type": 0,
       "parameter_mmin": 0.0,
       "parameter_mmax": 1000.0,
       "parameter_initial": [
        100.0
       ],
       "parameter_initial_enable": 1,
       "parameter_unitstyle": 2,
       "parameter_invisible": 1
      }
     }
    }
   },
   {
    "box": {
     "id": "obj-128",
     "maxclass": "live.toggle",
     "numinlets": 1,
     "numoutlets": 1,
     "patching_rect": [
      202.0,
      508.0,
      15.0,
      15.0
     ],
     "outlettype": [
      ""
     ],
     "presentation": 1,
     "presentation_rect": [
      564.0,
      45.0,
      14.0,
      14.0
     ],
     "parameter_enable": 1,
     "varname": "S1_enable",
     "saved_attribute_attributes": {
      "valueof": {
       "parameter_longname": "S1 Enable",
       "parameter_shortname": "On",
       "parameter_type": 2,
       "parameter_mmax": 1,
       "parameter_initial": [
        1
       ],
       "parameter_initial_enable": 1,
       "parameter_invisible": 1,
       "parameter_enum": [
        "off",
        "on"
       ]
      }
     }
    }
   },
   {
    "box": {
     "id": "obj-129",
     "maxclass": "newobj",
     "numinlets": 0,
     "numoutlets": 1,
     "patching_rect": [
      226.0,
      508.0,
      70.0,
      20.0
     ],
     "outlettype": [
      ""
     ],
     "text": "r ---wbang"
    }
   },
   {
    "box": {
     "id": "obj-130",
     "maxclass": "newobj",
     "numinlets": 0,
     "numoutlets": 1,
     "patching_rect": [
      30.0,
      542.0,
      48.0,
      20.0
     ],
     "outlettype": [
      ""
     ],
     "text": "r ---g1"
    }
   },
   {
    "box": {
     "id": "obj-131",
     "maxclass": "newobj",
     "numinlets": 0,
     "numoutlets": 1,
     "patching_rect": [
      82.0,
      542.0,
      48.0,
      20.0
     ],
     "outlettype": [
      ""
     ],
     "text": "r ---g2"
    }
   },
   {
    "box": {
     "id": "obj-132",
     "maxclass": "newobj",
     "numinlets": 0,
     "numoutlets": 1,
     "patching_rect": [
      134.0,
      542.0,
      48.0,
      20.0
     ],
     "outlettype": [
      ""
     ],
     "text": "r ---g3"
    }
   },
   {
    "box": {
     "id": "obj-133",
     "maxclass": "newobj",
     "numinlets": 0,
     "numoutlets": 1,
     "patching_rect": [
      186.0,
      542.0,
      48.0,
      20.0
     ],
     "outlettype": [
      ""
     ],
     "text": "r ---g4"
    }
   },
   {
    "box": {
     "id": "obj-134",
     "maxclass": "newobj",
     "numinlets": 0,
     "numoutlets": 1,
     "patching_rect": [
      238.0,
      542.0,
      48.0,
      20.0
     ],
     "outlettype": [
      ""
     ],
     "text": "r ---g5"
    }
   },
   {
    "box": {
     "id": "obj-135",
     "maxclass": "newobj",
     "numinlets": 0,
     "numoutlets": 1,
     "patching_rect": [
      30.0,
      568.0,
      48.0,
      20.0
     ],
     "outlettype": [
      ""
     ],
     "text": "r ---g6"
    }
   },
   {
    "box": {
     "id": "obj-136",
     "maxclass": "newobj",
     "numinlets": 0,
     "numoutlets": 1,
     "patching_rect": [
      82.0,
      568.0,
      48.0,
      20.0
     ],
     "outlettype": [
      ""
     ],
     "text": "r ---g7"
    }
   },
   {
    "box": {
     "id": "obj-137",
     "maxclass": "newobj",
     "numinlets": 0,
     "numoutlets": 1,
     "patching_rect": [
      134.0,
      568.0,
      48.0,
      20.0
     ],
     "outlettype": [
      ""
     ],
     "text": "r ---g8"
    }
   },
   {
    "box": {
     "id": "obj-138",
     "maxclass": "newobj",
     "numinlets": 0,
     "numoutlets": 1,
     "patching_rect": [
      186.0,
      568.0,
      48.0,
      20.0
     ],
     "outlettype": [
      ""
     ],
     "text": "r ---g9"
    }
   },
   {
    "box": {
     "id": "obj-139",
     "maxclass": "newobj",
     "numinlets": 2,
     "numoutlets": 1,
     "patching_rect": [
      300.0,
      542.0,
      34.0,
      22.0
     ],
     "outlettype": [
      "int"
     ],
     "text": "+ 1"
    }
   },
   {
    "box": {
     "id": "obj-140",
     "maxclass": "newobj",
     "numinlets": 10,
     "numoutlets": 1,
     "patching_rect": [
      30.0,
      600.0,
      160.0,
      22.0
     ],
     "outlettype": [
      ""
     ],
     "text": "switch 9"
    }
   },
   {
    "box": {
     "id": "obj-141",
     "maxclass": "newobj",
     "numinlets": 4,
     "numoutlets": 1,
     "patching_rect": [
      30.0,
      634.0,
      150.0,
      22.0
     ],
     "outlettype": [
      ""
     ],
     "text": "expr $f2 + ($f1 + $f4 * (1. - 2. * $f1)) * ($f3 - $f2)"
    }
   },
   {
    "box": {
     "id": "obj-142",
     "maxclass": "newobj",
     "numinlets": 2,
     "numoutlets": 1,
     "patching_rect": [
      30.0,
      668.0,
      80.0,
      22.0
     ],
     "outlettype": [
      ""
     ],
     "text": "pack 0. 100."
    }
   },
   {
    "box": {
     "id": "obj-143",
     "maxclass": "newobj",
     "numinlets": 3,
     "numoutlets": 2,
     "patching_rect": [
      30.0,
      702.0,
      70.0,
      22.0
     ],
     "outlettype": [
      "",
      "bang"
     ],
     "text": "line 0. 20"
    }
   },
   {
    "box": {
     "id": "obj-144",
     "maxclass": "newobj",
     "numinlets": 3,
     "numoutlets": 1,
     "patching_rect": [
      30.0,
      736.0,
      160.0,
      22.0
     ],
     "outlettype": [
      ""
     ],
     "text": "expr $f2 + $f1 * ($f3 - $f2)"
    }
   },
   {
    "box": {
     "id": "obj-145",
     "maxclass": "newobj",
     "numinlets": 2,
     "numoutlets": 2,
     "patching_rect": [
      30.0,
      770.0,
      90.0,
      22.0
     ],
     "outlettype": [
      "",
      ""
     ],
     "text": "live.remote~"
    }
   },
   {
    "box": {
     "id": "obj-146",
     "maxclass": "message",
     "numinlets": 2,
     "numoutlets": 1,
     "patching_rect": [
      210.0,
      600.0,
      56.0,
      22.0
     ],
     "outlettype": [
      ""
     ],
     "text": "map 1"
    }
   },
   {
    "box": {
     "id": "obj-147",
     "maxclass": "message",
     "numinlets": 2,
     "numoutlets": 1,
     "patching_rect": [
      210.0,
      630.0,
      66.0,
      22.0
     ],
     "outlettype": [
      ""
     ],
     "text": "unmap 1"
    }
   },
   {
    "box": {
     "id": "obj-148",
     "maxclass": "message",
     "numinlets": 2,
     "numoutlets": 1,
     "patching_rect": [
      210.0,
      660.0,
      86.0,
      22.0
     ],
     "outlettype": [
      ""
     ],
     "text": "enable 1 $1"
    }
   },
   {
    "box": {
     "id": "obj-149",
     "maxclass": "newobj",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      210.0,
      692.0,
      80.0,
      20.0
     ],
     "text": "s ---jscmd"
    }
   },
   {
    "box": {
     "id": "obj-150",
     "maxclass": "newobj",
     "numinlets": 0,
     "numoutlets": 1,
     "patching_rect": [
      210.0,
      722.0,
      70.0,
      20.0
     ],
     "outlettype": [
      ""
     ],
     "text": "r ---slot1"
    }
   },
   {
    "box": {
     "id": "obj-151",
     "maxclass": "newobj",
     "numinlets": 1,
     "numoutlets": 5,
     "patching_rect": [
      210.0,
      752.0,
      170.0,
      22.0
     ],
     "outlettype": [
      "",
      "",
      "",
      "",
      ""
     ],
     "text": "route id display path range"
    }
   },
   {
    "box": {
     "id": "obj-152",
     "maxclass": "newobj",
     "numinlets": 1,
     "numoutlets": 2,
     "patching_rect": [
      380.0,
      784.0,
      80.0,
      22.0
     ],
     "outlettype": [
      "float",
      "float"
     ],
     "text": "unpack 0. 1."
    }
   },
   {
    "box": {
     "id": "obj-153",
     "maxclass": "newobj",
     "numinlets": 1,
     "numoutlets": 1,
     "patching_rect": [
      210.0,
      784.0,
      75.0,
      22.0
     ],
     "outlettype": [
      ""
     ],
     "text": "prepend id"
    }
   },
   {
    "box": {
     "id": "obj-154",
     "maxclass": "newobj",
     "numinlets": 1,
     "numoutlets": 1,
     "patching_rect": [
      210.0,
      816.0,
      60.0,
      22.0
     ],
     "outlettype": [
      ""
     ],
     "text": "deferlow"
    }
   },
   {
    "box": {
     "id": "obj-155",
     "maxclass": "newobj",
     "numinlets": 1,
     "numoutlets": 1,
     "patching_rect": [
      292.0,
      784.0,
      80.0,
      22.0
     ],
     "outlettype": [
      ""
     ],
     "text": "prepend set"
    }
   },
   {
    "box": {
     "id": "obj-156",
     "maxclass": "newobj",
     "numinlets": 2,
     "numoutlets": 3,
     "patching_rect": [
      210.0,
      848.0,
      88.0,
      22.0
     ],
     "outlettype": [
      "",
      "",
      ""
     ],
     "text": "pattr map1",
     "varname": "pattr_map1"
    }
   },
   {
    "box": {
     "id": "obj-157",
     "maxclass": "newobj",
     "numinlets": 0,
     "numoutlets": 1,
     "patching_rect": [
      306.0,
      816.0,
      80.0,
      20.0
     ],
     "outlettype": [
      ""
     ],
     "text": "r ---restore"
    }
   },
   {
    "box": {
     "id": "obj-158",
     "maxclass": "newobj",
     "numinlets": 1,
     "numoutlets": 1,
     "patching_rect": [
      210.0,
      880.0,
      110.0,
      22.0
     ],
     "outlettype": [
      ""
     ],
     "text": "prepend restore 1"
    }
   },
   {
    "box": {
     "id": "obj-159",
     "maxclass": "newobj",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      210.0,
      912.0,
      80.0,
      20.0
     ],
     "text": "s ---jscmd"
    }
   },
   {
    "box": {
     "id": "obj-160",
     "maxclass": "comment",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      380.0,
      456.0,
      320.0,
      18.0
     ],
     "text": "—— Slot 2 ——",
     "fontsize": 11.0,
     "fontface": 1
    }
   },
   {
    "box": {
     "id": "obj-161",
     "maxclass": "live.menu",
     "numinlets": 1,
     "numoutlets": 3,
     "patching_rect": [
      380.0,
      480.0,
      50.0,
      15.0
     ],
     "outlettype": [
      "",
      "",
      ""
     ],
     "presentation": 1,
     "presentation_rect": [
      158.0,
      68.0,
      50.0,
      15.0
     ],
     "parameter_enable": 1,
     "varname": "S2_source",
     "saved_attribute_attributes": {
      "valueof": {
       "parameter_longname": "S2 Source",
       "parameter_shortname": "Src",
       "parameter_type": 2,
       "parameter_mmax": 8,
       "parameter_initial": [
        1
       ],
       "parameter_initial_enable": 1,
       "parameter_invisible": 1,
       "parameter_enum": [
        "L Open",
        "L Fist",
        "R Open",
        "R Fist",
        "H Dist",
        "L X",
        "L Y",
        "R X",
        "R Y"
       ]
      }
     }
    }
   },
   {
    "box": {
     "id": "obj-162",
     "maxclass": "flonum",
     "numinlets": 1,
     "numoutlets": 2,
     "patching_rect": [
      438.0,
      480.0,
      46.0,
      22.0
     ],
     "outlettype": [
      "",
      "bang"
     ],
     "presentation": 1,
     "presentation_rect": [
      214.0,
      67.0,
      38.0,
      20.0
     ],
     "cantchange": 1,
     "numdecimalplaces": 2,
     "bgcolor": [
      0.18,
      0.18,
      0.18,
      1.0
     ],
     "textcolor": [
      0.9,
      0.9,
      0.9,
      1.0
     ]
    }
   },
   {
    "box": {
     "id": "obj-163",
     "maxclass": "textbutton",
     "numinlets": 1,
     "numoutlets": 3,
     "patching_rect": [
      492.0,
      480.0,
      36.0,
      20.0
     ],
     "outlettype": [
      "",
      "",
      ""
     ],
     "text": "Map",
     "presentation": 1,
     "presentation_rect": [
      254.0,
      67.0,
      30.0,
      18.0
     ],
     "bgcolor": [
      0.22,
      0.22,
      0.22,
      1.0
     ],
     "bgoncolor": [
      0.98,
      0.65,
      0.12,
      1.0
     ],
     "textcolor": [
      0.88,
      0.88,
      0.88,
      1.0
     ],
     "textoncolor": [
      0.1,
      0.1,
      0.1,
      1.0
     ],
     "bordercolor": [
      0.38,
      0.38,
      0.38,
      1.0
     ],
     "rounded": 8.0
    }
   },
   {
    "box": {
     "id": "obj-164",
     "maxclass": "textbutton",
     "numinlets": 1,
     "numoutlets": 3,
     "patching_rect": [
      534.0,
      480.0,
      20.0,
      20.0
     ],
     "outlettype": [
      "",
      "",
      ""
     ],
     "text": "x",
     "presentation": 1,
     "presentation_rect": [
      286.0,
      67.0,
      16.0,
      18.0
     ],
     "bgcolor": [
      0.22,
      0.22,
      0.22,
      1.0
     ],
     "bgoncolor": [
      0.98,
      0.65,
      0.12,
      1.0
     ],
     "textcolor": [
      0.88,
      0.88,
      0.88,
      1.0
     ],
     "textoncolor": [
      0.1,
      0.1,
      0.1,
      1.0
     ],
     "bordercolor": [
      0.38,
      0.38,
      0.38,
      1.0
     ],
     "rounded": 8.0
    }
   },
   {
    "box": {
     "id": "obj-165",
     "maxclass": "comment",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      562.0,
      482.0,
      140.0,
      16.0
     ],
     "text": "--",
     "presentation": 1,
     "presentation_rect": [
      304.0,
      69.0,
      114.0,
      16.0
     ],
     "textcolor": [
      0.55,
      0.78,
      0.95,
      1.0
     ],
     "fontsize": 10.0
    }
   },
   {
    "box": {
     "id": "obj-166",
     "maxclass": "live.numbox",
     "numinlets": 1,
     "numoutlets": 2,
     "patching_rect": [
      380.0,
      508.0,
      44.0,
      15.0
     ],
     "outlettype": [
      "",
      "float"
     ],
     "presentation": 1,
     "presentation_rect": [
      422.0,
      69.0,
      38.0,
      15.0
     ],
     "parameter_enable": 1,
     "varname": "S2_min",
     "saved_attribute_attributes": {
      "valueof": {
       "parameter_longname": "S2 Min",
       "parameter_shortname": "Min",
       "parameter_type": 0,
       "parameter_mmin": 0.0,
       "parameter_mmax": 1.0,
       "parameter_initial": [
        0.0
       ],
       "parameter_initial_enable": 1,
       "parameter_unitstyle": 1,
       "parameter_invisible": 1
      }
     }
    }
   },
   {
    "box": {
     "id": "obj-167",
     "maxclass": "live.numbox",
     "numinlets": 1,
     "numoutlets": 2,
     "patching_rect": [
      430.0,
      508.0,
      44.0,
      15.0
     ],
     "outlettype": [
      "",
      "float"
     ],
     "presentation": 1,
     "presentation_rect": [
      462.0,
      69.0,
      38.0,
      15.0
     ],
     "parameter_enable": 1,
     "varname": "S2_max",
     "saved_attribute_attributes": {
      "valueof": {
       "parameter_longname": "S2 Max",
       "parameter_shortname": "Max",
       "parameter_type": 0,
       "parameter_mmin": 0.0,
       "parameter_mmax": 1.0,
       "parameter_initial": [
        1.0
       ],
       "parameter_initial_enable": 1,
       "parameter_unitstyle": 1,
       "parameter_invisible": 1
      }
     }
    }
   },
   {
    "box": {
     "id": "obj-168",
     "maxclass": "live.toggle",
     "numinlets": 1,
     "numoutlets": 1,
     "patching_rect": [
      480.0,
      508.0,
      15.0,
      15.0
     ],
     "outlettype": [
      ""
     ],
     "presentation": 1,
     "presentation_rect": [
      504.0,
      70.0,
      14.0,
      14.0
     ],
     "parameter_enable": 1,
     "varname": "S2_invert",
     "saved_attribute_attributes": {
      "valueof": {
       "parameter_longname": "S2 Invert",
       "parameter_shortname": "Inv",
       "parameter_type": 2,
       "parameter_mmax": 1,
       "parameter_initial": [
        0
       ],
       "parameter_initial_enable": 1,
       "parameter_invisible": 1,
       "parameter_enum": [
        "off",
        "on"
       ]
      }
     }
    }
   },
   {
    "box": {
     "id": "obj-169",
     "maxclass": "live.numbox",
     "numinlets": 1,
     "numoutlets": 2,
     "patching_rect": [
      502.0,
      508.0,
      44.0,
      15.0
     ],
     "outlettype": [
      "",
      "float"
     ],
     "presentation": 1,
     "presentation_rect": [
      520.0,
      69.0,
      40.0,
      15.0
     ],
     "parameter_enable": 1,
     "varname": "S2_smooth",
     "saved_attribute_attributes": {
      "valueof": {
       "parameter_longname": "S2 Smooth",
       "parameter_shortname": "Time",
       "parameter_type": 0,
       "parameter_mmin": 0.0,
       "parameter_mmax": 1000.0,
       "parameter_initial": [
        100.0
       ],
       "parameter_initial_enable": 1,
       "parameter_unitstyle": 2,
       "parameter_invisible": 1
      }
     }
    }
   },
   {
    "box": {
     "id": "obj-170",
     "maxclass": "live.toggle",
     "numinlets": 1,
     "numoutlets": 1,
     "patching_rect": [
      552.0,
      508.0,
      15.0,
      15.0
     ],
     "outlettype": [
      ""
     ],
     "presentation": 1,
     "presentation_rect": [
      564.0,
      70.0,
      14.0,
      14.0
     ],
     "parameter_enable": 1,
     "varname": "S2_enable",
     "saved_attribute_attributes": {
      "valueof": {
       "parameter_longname": "S2 Enable",
       "parameter_shortname": "On",
       "parameter_type": 2,
       "parameter_mmax": 1,
       "parameter_initial": [
        1
       ],
       "parameter_initial_enable": 1,
       "parameter_invisible": 1,
       "parameter_enum": [
        "off",
        "on"
       ]
      }
     }
    }
   },
   {
    "box": {
     "id": "obj-171",
     "maxclass": "newobj",
     "numinlets": 0,
     "numoutlets": 1,
     "patching_rect": [
      576.0,
      508.0,
      70.0,
      20.0
     ],
     "outlettype": [
      ""
     ],
     "text": "r ---wbang"
    }
   },
   {
    "box": {
     "id": "obj-172",
     "maxclass": "newobj",
     "numinlets": 0,
     "numoutlets": 1,
     "patching_rect": [
      380.0,
      542.0,
      48.0,
      20.0
     ],
     "outlettype": [
      ""
     ],
     "text": "r ---g1"
    }
   },
   {
    "box": {
     "id": "obj-173",
     "maxclass": "newobj",
     "numinlets": 0,
     "numoutlets": 1,
     "patching_rect": [
      432.0,
      542.0,
      48.0,
      20.0
     ],
     "outlettype": [
      ""
     ],
     "text": "r ---g2"
    }
   },
   {
    "box": {
     "id": "obj-174",
     "maxclass": "newobj",
     "numinlets": 0,
     "numoutlets": 1,
     "patching_rect": [
      484.0,
      542.0,
      48.0,
      20.0
     ],
     "outlettype": [
      ""
     ],
     "text": "r ---g3"
    }
   },
   {
    "box": {
     "id": "obj-175",
     "maxclass": "newobj",
     "numinlets": 0,
     "numoutlets": 1,
     "patching_rect": [
      536.0,
      542.0,
      48.0,
      20.0
     ],
     "outlettype": [
      ""
     ],
     "text": "r ---g4"
    }
   },
   {
    "box": {
     "id": "obj-176",
     "maxclass": "newobj",
     "numinlets": 0,
     "numoutlets": 1,
     "patching_rect": [
      588.0,
      542.0,
      48.0,
      20.0
     ],
     "outlettype": [
      ""
     ],
     "text": "r ---g5"
    }
   },
   {
    "box": {
     "id": "obj-177",
     "maxclass": "newobj",
     "numinlets": 0,
     "numoutlets": 1,
     "patching_rect": [
      380.0,
      568.0,
      48.0,
      20.0
     ],
     "outlettype": [
      ""
     ],
     "text": "r ---g6"
    }
   },
   {
    "box": {
     "id": "obj-178",
     "maxclass": "newobj",
     "numinlets": 0,
     "numoutlets": 1,
     "patching_rect": [
      432.0,
      568.0,
      48.0,
      20.0
     ],
     "outlettype": [
      ""
     ],
     "text": "r ---g7"
    }
   },
   {
    "box": {
     "id": "obj-179",
     "maxclass": "newobj",
     "numinlets": 0,
     "numoutlets": 1,
     "patching_rect": [
      484.0,
      568.0,
      48.0,
      20.0
     ],
     "outlettype": [
      ""
     ],
     "text": "r ---g8"
    }
   },
   {
    "box": {
     "id": "obj-180",
     "maxclass": "newobj",
     "numinlets": 0,
     "numoutlets": 1,
     "patching_rect": [
      536.0,
      568.0,
      48.0,
      20.0
     ],
     "outlettype": [
      ""
     ],
     "text": "r ---g9"
    }
   },
   {
    "box": {
     "id": "obj-181",
     "maxclass": "newobj",
     "numinlets": 2,
     "numoutlets": 1,
     "patching_rect": [
      650.0,
      542.0,
      34.0,
      22.0
     ],
     "outlettype": [
      "int"
     ],
     "text": "+ 1"
    }
   },
   {
    "box": {
     "id": "obj-182",
     "maxclass": "newobj",
     "numinlets": 10,
     "numoutlets": 1,
     "patching_rect": [
      380.0,
      600.0,
      160.0,
      22.0
     ],
     "outlettype": [
      ""
     ],
     "text": "switch 9"
    }
   },
   {
    "box": {
     "id": "obj-183",
     "maxclass": "newobj",
     "numinlets": 4,
     "numoutlets": 1,
     "patching_rect": [
      380.0,
      634.0,
      150.0,
      22.0
     ],
     "outlettype": [
      ""
     ],
     "text": "expr $f2 + ($f1 + $f4 * (1. - 2. * $f1)) * ($f3 - $f2)"
    }
   },
   {
    "box": {
     "id": "obj-184",
     "maxclass": "newobj",
     "numinlets": 2,
     "numoutlets": 1,
     "patching_rect": [
      380.0,
      668.0,
      80.0,
      22.0
     ],
     "outlettype": [
      ""
     ],
     "text": "pack 0. 100."
    }
   },
   {
    "box": {
     "id": "obj-185",
     "maxclass": "newobj",
     "numinlets": 3,
     "numoutlets": 2,
     "patching_rect": [
      380.0,
      702.0,
      70.0,
      22.0
     ],
     "outlettype": [
      "",
      "bang"
     ],
     "text": "line 0. 20"
    }
   },
   {
    "box": {
     "id": "obj-186",
     "maxclass": "newobj",
     "numinlets": 3,
     "numoutlets": 1,
     "patching_rect": [
      380.0,
      736.0,
      160.0,
      22.0
     ],
     "outlettype": [
      ""
     ],
     "text": "expr $f2 + $f1 * ($f3 - $f2)"
    }
   },
   {
    "box": {
     "id": "obj-187",
     "maxclass": "newobj",
     "numinlets": 2,
     "numoutlets": 2,
     "patching_rect": [
      380.0,
      770.0,
      90.0,
      22.0
     ],
     "outlettype": [
      "",
      ""
     ],
     "text": "live.remote~"
    }
   },
   {
    "box": {
     "id": "obj-188",
     "maxclass": "message",
     "numinlets": 2,
     "numoutlets": 1,
     "patching_rect": [
      560.0,
      600.0,
      56.0,
      22.0
     ],
     "outlettype": [
      ""
     ],
     "text": "map 2"
    }
   },
   {
    "box": {
     "id": "obj-189",
     "maxclass": "message",
     "numinlets": 2,
     "numoutlets": 1,
     "patching_rect": [
      560.0,
      630.0,
      66.0,
      22.0
     ],
     "outlettype": [
      ""
     ],
     "text": "unmap 2"
    }
   },
   {
    "box": {
     "id": "obj-190",
     "maxclass": "message",
     "numinlets": 2,
     "numoutlets": 1,
     "patching_rect": [
      560.0,
      660.0,
      86.0,
      22.0
     ],
     "outlettype": [
      ""
     ],
     "text": "enable 2 $1"
    }
   },
   {
    "box": {
     "id": "obj-191",
     "maxclass": "newobj",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      560.0,
      692.0,
      80.0,
      20.0
     ],
     "text": "s ---jscmd"
    }
   },
   {
    "box": {
     "id": "obj-192",
     "maxclass": "newobj",
     "numinlets": 0,
     "numoutlets": 1,
     "patching_rect": [
      560.0,
      722.0,
      70.0,
      20.0
     ],
     "outlettype": [
      ""
     ],
     "text": "r ---slot2"
    }
   },
   {
    "box": {
     "id": "obj-193",
     "maxclass": "newobj",
     "numinlets": 1,
     "numoutlets": 5,
     "patching_rect": [
      560.0,
      752.0,
      170.0,
      22.0
     ],
     "outlettype": [
      "",
      "",
      "",
      "",
      ""
     ],
     "text": "route id display path range"
    }
   },
   {
    "box": {
     "id": "obj-194",
     "maxclass": "newobj",
     "numinlets": 1,
     "numoutlets": 2,
     "patching_rect": [
      730.0,
      784.0,
      80.0,
      22.0
     ],
     "outlettype": [
      "float",
      "float"
     ],
     "text": "unpack 0. 1."
    }
   },
   {
    "box": {
     "id": "obj-195",
     "maxclass": "newobj",
     "numinlets": 1,
     "numoutlets": 1,
     "patching_rect": [
      560.0,
      784.0,
      75.0,
      22.0
     ],
     "outlettype": [
      ""
     ],
     "text": "prepend id"
    }
   },
   {
    "box": {
     "id": "obj-196",
     "maxclass": "newobj",
     "numinlets": 1,
     "numoutlets": 1,
     "patching_rect": [
      560.0,
      816.0,
      60.0,
      22.0
     ],
     "outlettype": [
      ""
     ],
     "text": "deferlow"
    }
   },
   {
    "box": {
     "id": "obj-197",
     "maxclass": "newobj",
     "numinlets": 1,
     "numoutlets": 1,
     "patching_rect": [
      642.0,
      784.0,
      80.0,
      22.0
     ],
     "outlettype": [
      ""
     ],
     "text": "prepend set"
    }
   },
   {
    "box": {
     "id": "obj-198",
     "maxclass": "newobj",
     "numinlets": 2,
     "numoutlets": 3,
     "patching_rect": [
      560.0,
      848.0,
      88.0,
      22.0
     ],
     "outlettype": [
      "",
      "",
      ""
     ],
     "text": "pattr map2",
     "varname": "pattr_map2"
    }
   },
   {
    "box": {
     "id": "obj-199",
     "maxclass": "newobj",
     "numinlets": 0,
     "numoutlets": 1,
     "patching_rect": [
      656.0,
      816.0,
      80.0,
      20.0
     ],
     "outlettype": [
      ""
     ],
     "text": "r ---restore"
    }
   },
   {
    "box": {
     "id": "obj-200",
     "maxclass": "newobj",
     "numinlets": 1,
     "numoutlets": 1,
     "patching_rect": [
      560.0,
      880.0,
      110.0,
      22.0
     ],
     "outlettype": [
      ""
     ],
     "text": "prepend restore 2"
    }
   },
   {
    "box": {
     "id": "obj-201",
     "maxclass": "newobj",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      560.0,
      912.0,
      80.0,
      20.0
     ],
     "text": "s ---jscmd"
    }
   },
   {
    "box": {
     "id": "obj-202",
     "maxclass": "comment",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      730.0,
      456.0,
      320.0,
      18.0
     ],
     "text": "—— Slot 3 ——",
     "fontsize": 11.0,
     "fontface": 1
    }
   },
   {
    "box": {
     "id": "obj-203",
     "maxclass": "live.menu",
     "numinlets": 1,
     "numoutlets": 3,
     "patching_rect": [
      730.0,
      480.0,
      50.0,
      15.0
     ],
     "outlettype": [
      "",
      "",
      ""
     ],
     "presentation": 1,
     "presentation_rect": [
      158.0,
      93.0,
      50.0,
      15.0
     ],
     "parameter_enable": 1,
     "varname": "S3_source",
     "saved_attribute_attributes": {
      "valueof": {
       "parameter_longname": "S3 Source",
       "parameter_shortname": "Src",
       "parameter_type": 2,
       "parameter_mmax": 8,
       "parameter_initial": [
        2
       ],
       "parameter_initial_enable": 1,
       "parameter_invisible": 1,
       "parameter_enum": [
        "L Open",
        "L Fist",
        "R Open",
        "R Fist",
        "H Dist",
        "L X",
        "L Y",
        "R X",
        "R Y"
       ]
      }
     }
    }
   },
   {
    "box": {
     "id": "obj-204",
     "maxclass": "flonum",
     "numinlets": 1,
     "numoutlets": 2,
     "patching_rect": [
      788.0,
      480.0,
      46.0,
      22.0
     ],
     "outlettype": [
      "",
      "bang"
     ],
     "presentation": 1,
     "presentation_rect": [
      214.0,
      92.0,
      38.0,
      20.0
     ],
     "cantchange": 1,
     "numdecimalplaces": 2,
     "bgcolor": [
      0.18,
      0.18,
      0.18,
      1.0
     ],
     "textcolor": [
      0.9,
      0.9,
      0.9,
      1.0
     ]
    }
   },
   {
    "box": {
     "id": "obj-205",
     "maxclass": "textbutton",
     "numinlets": 1,
     "numoutlets": 3,
     "patching_rect": [
      842.0,
      480.0,
      36.0,
      20.0
     ],
     "outlettype": [
      "",
      "",
      ""
     ],
     "text": "Map",
     "presentation": 1,
     "presentation_rect": [
      254.0,
      92.0,
      30.0,
      18.0
     ],
     "bgcolor": [
      0.22,
      0.22,
      0.22,
      1.0
     ],
     "bgoncolor": [
      0.98,
      0.65,
      0.12,
      1.0
     ],
     "textcolor": [
      0.88,
      0.88,
      0.88,
      1.0
     ],
     "textoncolor": [
      0.1,
      0.1,
      0.1,
      1.0
     ],
     "bordercolor": [
      0.38,
      0.38,
      0.38,
      1.0
     ],
     "rounded": 8.0
    }
   },
   {
    "box": {
     "id": "obj-206",
     "maxclass": "textbutton",
     "numinlets": 1,
     "numoutlets": 3,
     "patching_rect": [
      884.0,
      480.0,
      20.0,
      20.0
     ],
     "outlettype": [
      "",
      "",
      ""
     ],
     "text": "x",
     "presentation": 1,
     "presentation_rect": [
      286.0,
      92.0,
      16.0,
      18.0
     ],
     "bgcolor": [
      0.22,
      0.22,
      0.22,
      1.0
     ],
     "bgoncolor": [
      0.98,
      0.65,
      0.12,
      1.0
     ],
     "textcolor": [
      0.88,
      0.88,
      0.88,
      1.0
     ],
     "textoncolor": [
      0.1,
      0.1,
      0.1,
      1.0
     ],
     "bordercolor": [
      0.38,
      0.38,
      0.38,
      1.0
     ],
     "rounded": 8.0
    }
   },
   {
    "box": {
     "id": "obj-207",
     "maxclass": "comment",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      912.0,
      482.0,
      140.0,
      16.0
     ],
     "text": "--",
     "presentation": 1,
     "presentation_rect": [
      304.0,
      94.0,
      114.0,
      16.0
     ],
     "textcolor": [
      0.55,
      0.78,
      0.95,
      1.0
     ],
     "fontsize": 10.0
    }
   },
   {
    "box": {
     "id": "obj-208",
     "maxclass": "live.numbox",
     "numinlets": 1,
     "numoutlets": 2,
     "patching_rect": [
      730.0,
      508.0,
      44.0,
      15.0
     ],
     "outlettype": [
      "",
      "float"
     ],
     "presentation": 1,
     "presentation_rect": [
      422.0,
      94.0,
      38.0,
      15.0
     ],
     "parameter_enable": 1,
     "varname": "S3_min",
     "saved_attribute_attributes": {
      "valueof": {
       "parameter_longname": "S3 Min",
       "parameter_shortname": "Min",
       "parameter_type": 0,
       "parameter_mmin": 0.0,
       "parameter_mmax": 1.0,
       "parameter_initial": [
        0.0
       ],
       "parameter_initial_enable": 1,
       "parameter_unitstyle": 1,
       "parameter_invisible": 1
      }
     }
    }
   },
   {
    "box": {
     "id": "obj-209",
     "maxclass": "live.numbox",
     "numinlets": 1,
     "numoutlets": 2,
     "patching_rect": [
      780.0,
      508.0,
      44.0,
      15.0
     ],
     "outlettype": [
      "",
      "float"
     ],
     "presentation": 1,
     "presentation_rect": [
      462.0,
      94.0,
      38.0,
      15.0
     ],
     "parameter_enable": 1,
     "varname": "S3_max",
     "saved_attribute_attributes": {
      "valueof": {
       "parameter_longname": "S3 Max",
       "parameter_shortname": "Max",
       "parameter_type": 0,
       "parameter_mmin": 0.0,
       "parameter_mmax": 1.0,
       "parameter_initial": [
        1.0
       ],
       "parameter_initial_enable": 1,
       "parameter_unitstyle": 1,
       "parameter_invisible": 1
      }
     }
    }
   },
   {
    "box": {
     "id": "obj-210",
     "maxclass": "live.toggle",
     "numinlets": 1,
     "numoutlets": 1,
     "patching_rect": [
      830.0,
      508.0,
      15.0,
      15.0
     ],
     "outlettype": [
      ""
     ],
     "presentation": 1,
     "presentation_rect": [
      504.0,
      95.0,
      14.0,
      14.0
     ],
     "parameter_enable": 1,
     "varname": "S3_invert",
     "saved_attribute_attributes": {
      "valueof": {
       "parameter_longname": "S3 Invert",
       "parameter_shortname": "Inv",
       "parameter_type": 2,
       "parameter_mmax": 1,
       "parameter_initial": [
        0
       ],
       "parameter_initial_enable": 1,
       "parameter_invisible": 1,
       "parameter_enum": [
        "off",
        "on"
       ]
      }
     }
    }
   },
   {
    "box": {
     "id": "obj-211",
     "maxclass": "live.numbox",
     "numinlets": 1,
     "numoutlets": 2,
     "patching_rect": [
      852.0,
      508.0,
      44.0,
      15.0
     ],
     "outlettype": [
      "",
      "float"
     ],
     "presentation": 1,
     "presentation_rect": [
      520.0,
      94.0,
      40.0,
      15.0
     ],
     "parameter_enable": 1,
     "varname": "S3_smooth",
     "saved_attribute_attributes": {
      "valueof": {
       "parameter_longname": "S3 Smooth",
       "parameter_shortname": "Time",
       "parameter_type": 0,
       "parameter_mmin": 0.0,
       "parameter_mmax": 1000.0,
       "parameter_initial": [
        100.0
       ],
       "parameter_initial_enable": 1,
       "parameter_unitstyle": 2,
       "parameter_invisible": 1
      }
     }
    }
   },
   {
    "box": {
     "id": "obj-212",
     "maxclass": "live.toggle",
     "numinlets": 1,
     "numoutlets": 1,
     "patching_rect": [
      902.0,
      508.0,
      15.0,
      15.0
     ],
     "outlettype": [
      ""
     ],
     "presentation": 1,
     "presentation_rect": [
      564.0,
      95.0,
      14.0,
      14.0
     ],
     "parameter_enable": 1,
     "varname": "S3_enable",
     "saved_attribute_attributes": {
      "valueof": {
       "parameter_longname": "S3 Enable",
       "parameter_shortname": "On",
       "parameter_type": 2,
       "parameter_mmax": 1,
       "parameter_initial": [
        1
       ],
       "parameter_initial_enable": 1,
       "parameter_invisible": 1,
       "parameter_enum": [
        "off",
        "on"
       ]
      }
     }
    }
   },
   {
    "box": {
     "id": "obj-213",
     "maxclass": "newobj",
     "numinlets": 0,
     "numoutlets": 1,
     "patching_rect": [
      926.0,
      508.0,
      70.0,
      20.0
     ],
     "outlettype": [
      ""
     ],
     "text": "r ---wbang"
    }
   },
   {
    "box": {
     "id": "obj-214",
     "maxclass": "newobj",
     "numinlets": 0,
     "numoutlets": 1,
     "patching_rect": [
      730.0,
      542.0,
      48.0,
      20.0
     ],
     "outlettype": [
      ""
     ],
     "text": "r ---g1"
    }
   },
   {
    "box": {
     "id": "obj-215",
     "maxclass": "newobj",
     "numinlets": 0,
     "numoutlets": 1,
     "patching_rect": [
      782.0,
      542.0,
      48.0,
      20.0
     ],
     "outlettype": [
      ""
     ],
     "text": "r ---g2"
    }
   },
   {
    "box": {
     "id": "obj-216",
     "maxclass": "newobj",
     "numinlets": 0,
     "numoutlets": 1,
     "patching_rect": [
      834.0,
      542.0,
      48.0,
      20.0
     ],
     "outlettype": [
      ""
     ],
     "text": "r ---g3"
    }
   },
   {
    "box": {
     "id": "obj-217",
     "maxclass": "newobj",
     "numinlets": 0,
     "numoutlets": 1,
     "patching_rect": [
      886.0,
      542.0,
      48.0,
      20.0
     ],
     "outlettype": [
      ""
     ],
     "text": "r ---g4"
    }
   },
   {
    "box": {
     "id": "obj-218",
     "maxclass": "newobj",
     "numinlets": 0,
     "numoutlets": 1,
     "patching_rect": [
      938.0,
      542.0,
      48.0,
      20.0
     ],
     "outlettype": [
      ""
     ],
     "text": "r ---g5"
    }
   },
   {
    "box": {
     "id": "obj-219",
     "maxclass": "newobj",
     "numinlets": 0,
     "numoutlets": 1,
     "patching_rect": [
      730.0,
      568.0,
      48.0,
      20.0
     ],
     "outlettype": [
      ""
     ],
     "text": "r ---g6"
    }
   },
   {
    "box": {
     "id": "obj-220",
     "maxclass": "newobj",
     "numinlets": 0,
     "numoutlets": 1,
     "patching_rect": [
      782.0,
      568.0,
      48.0,
      20.0
     ],
     "outlettype": [
      ""
     ],
     "text": "r ---g7"
    }
   },
   {
    "box": {
     "id": "obj-221",
     "maxclass": "newobj",
     "numinlets": 0,
     "numoutlets": 1,
     "patching_rect": [
      834.0,
      568.0,
      48.0,
      20.0
     ],
     "outlettype": [
      ""
     ],
     "text": "r ---g8"
    }
   },
   {
    "box": {
     "id": "obj-222",
     "maxclass": "newobj",
     "numinlets": 0,
     "numoutlets": 1,
     "patching_rect": [
      886.0,
      568.0,
      48.0,
      20.0
     ],
     "outlettype": [
      ""
     ],
     "text": "r ---g9"
    }
   },
   {
    "box": {
     "id": "obj-223",
     "maxclass": "newobj",
     "numinlets": 2,
     "numoutlets": 1,
     "patching_rect": [
      1000.0,
      542.0,
      34.0,
      22.0
     ],
     "outlettype": [
      "int"
     ],
     "text": "+ 1"
    }
   },
   {
    "box": {
     "id": "obj-224",
     "maxclass": "newobj",
     "numinlets": 10,
     "numoutlets": 1,
     "patching_rect": [
      730.0,
      600.0,
      160.0,
      22.0
     ],
     "outlettype": [
      ""
     ],
     "text": "switch 9"
    }
   },
   {
    "box": {
     "id": "obj-225",
     "maxclass": "newobj",
     "numinlets": 4,
     "numoutlets": 1,
     "patching_rect": [
      730.0,
      634.0,
      150.0,
      22.0
     ],
     "outlettype": [
      ""
     ],
     "text": "expr $f2 + ($f1 + $f4 * (1. - 2. * $f1)) * ($f3 - $f2)"
    }
   },
   {
    "box": {
     "id": "obj-226",
     "maxclass": "newobj",
     "numinlets": 2,
     "numoutlets": 1,
     "patching_rect": [
      730.0,
      668.0,
      80.0,
      22.0
     ],
     "outlettype": [
      ""
     ],
     "text": "pack 0. 100."
    }
   },
   {
    "box": {
     "id": "obj-227",
     "maxclass": "newobj",
     "numinlets": 3,
     "numoutlets": 2,
     "patching_rect": [
      730.0,
      702.0,
      70.0,
      22.0
     ],
     "outlettype": [
      "",
      "bang"
     ],
     "text": "line 0. 20"
    }
   },
   {
    "box": {
     "id": "obj-228",
     "maxclass": "newobj",
     "numinlets": 3,
     "numoutlets": 1,
     "patching_rect": [
      730.0,
      736.0,
      160.0,
      22.0
     ],
     "outlettype": [
      ""
     ],
     "text": "expr $f2 + $f1 * ($f3 - $f2)"
    }
   },
   {
    "box": {
     "id": "obj-229",
     "maxclass": "newobj",
     "numinlets": 2,
     "numoutlets": 2,
     "patching_rect": [
      730.0,
      770.0,
      90.0,
      22.0
     ],
     "outlettype": [
      "",
      ""
     ],
     "text": "live.remote~"
    }
   },
   {
    "box": {
     "id": "obj-230",
     "maxclass": "message",
     "numinlets": 2,
     "numoutlets": 1,
     "patching_rect": [
      910.0,
      600.0,
      56.0,
      22.0
     ],
     "outlettype": [
      ""
     ],
     "text": "map 3"
    }
   },
   {
    "box": {
     "id": "obj-231",
     "maxclass": "message",
     "numinlets": 2,
     "numoutlets": 1,
     "patching_rect": [
      910.0,
      630.0,
      66.0,
      22.0
     ],
     "outlettype": [
      ""
     ],
     "text": "unmap 3"
    }
   },
   {
    "box": {
     "id": "obj-232",
     "maxclass": "message",
     "numinlets": 2,
     "numoutlets": 1,
     "patching_rect": [
      910.0,
      660.0,
      86.0,
      22.0
     ],
     "outlettype": [
      ""
     ],
     "text": "enable 3 $1"
    }
   },
   {
    "box": {
     "id": "obj-233",
     "maxclass": "newobj",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      910.0,
      692.0,
      80.0,
      20.0
     ],
     "text": "s ---jscmd"
    }
   },
   {
    "box": {
     "id": "obj-234",
     "maxclass": "newobj",
     "numinlets": 0,
     "numoutlets": 1,
     "patching_rect": [
      910.0,
      722.0,
      70.0,
      20.0
     ],
     "outlettype": [
      ""
     ],
     "text": "r ---slot3"
    }
   },
   {
    "box": {
     "id": "obj-235",
     "maxclass": "newobj",
     "numinlets": 1,
     "numoutlets": 5,
     "patching_rect": [
      910.0,
      752.0,
      170.0,
      22.0
     ],
     "outlettype": [
      "",
      "",
      "",
      "",
      ""
     ],
     "text": "route id display path range"
    }
   },
   {
    "box": {
     "id": "obj-236",
     "maxclass": "newobj",
     "numinlets": 1,
     "numoutlets": 2,
     "patching_rect": [
      1080.0,
      784.0,
      80.0,
      22.0
     ],
     "outlettype": [
      "float",
      "float"
     ],
     "text": "unpack 0. 1."
    }
   },
   {
    "box": {
     "id": "obj-237",
     "maxclass": "newobj",
     "numinlets": 1,
     "numoutlets": 1,
     "patching_rect": [
      910.0,
      784.0,
      75.0,
      22.0
     ],
     "outlettype": [
      ""
     ],
     "text": "prepend id"
    }
   },
   {
    "box": {
     "id": "obj-238",
     "maxclass": "newobj",
     "numinlets": 1,
     "numoutlets": 1,
     "patching_rect": [
      910.0,
      816.0,
      60.0,
      22.0
     ],
     "outlettype": [
      ""
     ],
     "text": "deferlow"
    }
   },
   {
    "box": {
     "id": "obj-239",
     "maxclass": "newobj",
     "numinlets": 1,
     "numoutlets": 1,
     "patching_rect": [
      992.0,
      784.0,
      80.0,
      22.0
     ],
     "outlettype": [
      ""
     ],
     "text": "prepend set"
    }
   },
   {
    "box": {
     "id": "obj-240",
     "maxclass": "newobj",
     "numinlets": 2,
     "numoutlets": 3,
     "patching_rect": [
      910.0,
      848.0,
      88.0,
      22.0
     ],
     "outlettype": [
      "",
      "",
      ""
     ],
     "text": "pattr map3",
     "varname": "pattr_map3"
    }
   },
   {
    "box": {
     "id": "obj-241",
     "maxclass": "newobj",
     "numinlets": 0,
     "numoutlets": 1,
     "patching_rect": [
      1006.0,
      816.0,
      80.0,
      20.0
     ],
     "outlettype": [
      ""
     ],
     "text": "r ---restore"
    }
   },
   {
    "box": {
     "id": "obj-242",
     "maxclass": "newobj",
     "numinlets": 1,
     "numoutlets": 1,
     "patching_rect": [
      910.0,
      880.0,
      110.0,
      22.0
     ],
     "outlettype": [
      ""
     ],
     "text": "prepend restore 3"
    }
   },
   {
    "box": {
     "id": "obj-243",
     "maxclass": "newobj",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      910.0,
      912.0,
      80.0,
      20.0
     ],
     "text": "s ---jscmd"
    }
   },
   {
    "box": {
     "id": "obj-244",
     "maxclass": "comment",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      1080.0,
      456.0,
      320.0,
      18.0
     ],
     "text": "—— Slot 4 ——",
     "fontsize": 11.0,
     "fontface": 1
    }
   },
   {
    "box": {
     "id": "obj-245",
     "maxclass": "live.menu",
     "numinlets": 1,
     "numoutlets": 3,
     "patching_rect": [
      1080.0,
      480.0,
      50.0,
      15.0
     ],
     "outlettype": [
      "",
      "",
      ""
     ],
     "presentation": 1,
     "presentation_rect": [
      158.0,
      118.0,
      50.0,
      15.0
     ],
     "parameter_enable": 1,
     "varname": "S4_source",
     "saved_attribute_attributes": {
      "valueof": {
       "parameter_longname": "S4 Source",
       "parameter_shortname": "Src",
       "parameter_type": 2,
       "parameter_mmax": 8,
       "parameter_initial": [
        3
       ],
       "parameter_initial_enable": 1,
       "parameter_invisible": 1,
       "parameter_enum": [
        "L Open",
        "L Fist",
        "R Open",
        "R Fist",
        "H Dist",
        "L X",
        "L Y",
        "R X",
        "R Y"
       ]
      }
     }
    }
   },
   {
    "box": {
     "id": "obj-246",
     "maxclass": "flonum",
     "numinlets": 1,
     "numoutlets": 2,
     "patching_rect": [
      1138.0,
      480.0,
      46.0,
      22.0
     ],
     "outlettype": [
      "",
      "bang"
     ],
     "presentation": 1,
     "presentation_rect": [
      214.0,
      117.0,
      38.0,
      20.0
     ],
     "cantchange": 1,
     "numdecimalplaces": 2,
     "bgcolor": [
      0.18,
      0.18,
      0.18,
      1.0
     ],
     "textcolor": [
      0.9,
      0.9,
      0.9,
      1.0
     ]
    }
   },
   {
    "box": {
     "id": "obj-247",
     "maxclass": "textbutton",
     "numinlets": 1,
     "numoutlets": 3,
     "patching_rect": [
      1192.0,
      480.0,
      36.0,
      20.0
     ],
     "outlettype": [
      "",
      "",
      ""
     ],
     "text": "Map",
     "presentation": 1,
     "presentation_rect": [
      254.0,
      117.0,
      30.0,
      18.0
     ],
     "bgcolor": [
      0.22,
      0.22,
      0.22,
      1.0
     ],
     "bgoncolor": [
      0.98,
      0.65,
      0.12,
      1.0
     ],
     "textcolor": [
      0.88,
      0.88,
      0.88,
      1.0
     ],
     "textoncolor": [
      0.1,
      0.1,
      0.1,
      1.0
     ],
     "bordercolor": [
      0.38,
      0.38,
      0.38,
      1.0
     ],
     "rounded": 8.0
    }
   },
   {
    "box": {
     "id": "obj-248",
     "maxclass": "textbutton",
     "numinlets": 1,
     "numoutlets": 3,
     "patching_rect": [
      1234.0,
      480.0,
      20.0,
      20.0
     ],
     "outlettype": [
      "",
      "",
      ""
     ],
     "text": "x",
     "presentation": 1,
     "presentation_rect": [
      286.0,
      117.0,
      16.0,
      18.0
     ],
     "bgcolor": [
      0.22,
      0.22,
      0.22,
      1.0
     ],
     "bgoncolor": [
      0.98,
      0.65,
      0.12,
      1.0
     ],
     "textcolor": [
      0.88,
      0.88,
      0.88,
      1.0
     ],
     "textoncolor": [
      0.1,
      0.1,
      0.1,
      1.0
     ],
     "bordercolor": [
      0.38,
      0.38,
      0.38,
      1.0
     ],
     "rounded": 8.0
    }
   },
   {
    "box": {
     "id": "obj-249",
     "maxclass": "comment",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      1262.0,
      482.0,
      140.0,
      16.0
     ],
     "text": "--",
     "presentation": 1,
     "presentation_rect": [
      304.0,
      119.0,
      114.0,
      16.0
     ],
     "textcolor": [
      0.55,
      0.78,
      0.95,
      1.0
     ],
     "fontsize": 10.0
    }
   },
   {
    "box": {
     "id": "obj-250",
     "maxclass": "live.numbox",
     "numinlets": 1,
     "numoutlets": 2,
     "patching_rect": [
      1080.0,
      508.0,
      44.0,
      15.0
     ],
     "outlettype": [
      "",
      "float"
     ],
     "presentation": 1,
     "presentation_rect": [
      422.0,
      119.0,
      38.0,
      15.0
     ],
     "parameter_enable": 1,
     "varname": "S4_min",
     "saved_attribute_attributes": {
      "valueof": {
       "parameter_longname": "S4 Min",
       "parameter_shortname": "Min",
       "parameter_type": 0,
       "parameter_mmin": 0.0,
       "parameter_mmax": 1.0,
       "parameter_initial": [
        0.0
       ],
       "parameter_initial_enable": 1,
       "parameter_unitstyle": 1,
       "parameter_invisible": 1
      }
     }
    }
   },
   {
    "box": {
     "id": "obj-251",
     "maxclass": "live.numbox",
     "numinlets": 1,
     "numoutlets": 2,
     "patching_rect": [
      1130.0,
      508.0,
      44.0,
      15.0
     ],
     "outlettype": [
      "",
      "float"
     ],
     "presentation": 1,
     "presentation_rect": [
      462.0,
      119.0,
      38.0,
      15.0
     ],
     "parameter_enable": 1,
     "varname": "S4_max",
     "saved_attribute_attributes": {
      "valueof": {
       "parameter_longname": "S4 Max",
       "parameter_shortname": "Max",
       "parameter_type": 0,
       "parameter_mmin": 0.0,
       "parameter_mmax": 1.0,
       "parameter_initial": [
        1.0
       ],
       "parameter_initial_enable": 1,
       "parameter_unitstyle": 1,
       "parameter_invisible": 1
      }
     }
    }
   },
   {
    "box": {
     "id": "obj-252",
     "maxclass": "live.toggle",
     "numinlets": 1,
     "numoutlets": 1,
     "patching_rect": [
      1180.0,
      508.0,
      15.0,
      15.0
     ],
     "outlettype": [
      ""
     ],
     "presentation": 1,
     "presentation_rect": [
      504.0,
      120.0,
      14.0,
      14.0
     ],
     "parameter_enable": 1,
     "varname": "S4_invert",
     "saved_attribute_attributes": {
      "valueof": {
       "parameter_longname": "S4 Invert",
       "parameter_shortname": "Inv",
       "parameter_type": 2,
       "parameter_mmax": 1,
       "parameter_initial": [
        0
       ],
       "parameter_initial_enable": 1,
       "parameter_invisible": 1,
       "parameter_enum": [
        "off",
        "on"
       ]
      }
     }
    }
   },
   {
    "box": {
     "id": "obj-253",
     "maxclass": "live.numbox",
     "numinlets": 1,
     "numoutlets": 2,
     "patching_rect": [
      1202.0,
      508.0,
      44.0,
      15.0
     ],
     "outlettype": [
      "",
      "float"
     ],
     "presentation": 1,
     "presentation_rect": [
      520.0,
      119.0,
      40.0,
      15.0
     ],
     "parameter_enable": 1,
     "varname": "S4_smooth",
     "saved_attribute_attributes": {
      "valueof": {
       "parameter_longname": "S4 Smooth",
       "parameter_shortname": "Time",
       "parameter_type": 0,
       "parameter_mmin": 0.0,
       "parameter_mmax": 1000.0,
       "parameter_initial": [
        100.0
       ],
       "parameter_initial_enable": 1,
       "parameter_unitstyle": 2,
       "parameter_invisible": 1
      }
     }
    }
   },
   {
    "box": {
     "id": "obj-254",
     "maxclass": "live.toggle",
     "numinlets": 1,
     "numoutlets": 1,
     "patching_rect": [
      1252.0,
      508.0,
      15.0,
      15.0
     ],
     "outlettype": [
      ""
     ],
     "presentation": 1,
     "presentation_rect": [
      564.0,
      120.0,
      14.0,
      14.0
     ],
     "parameter_enable": 1,
     "varname": "S4_enable",
     "saved_attribute_attributes": {
      "valueof": {
       "parameter_longname": "S4 Enable",
       "parameter_shortname": "On",
       "parameter_type": 2,
       "parameter_mmax": 1,
       "parameter_initial": [
        1
       ],
       "parameter_initial_enable": 1,
       "parameter_invisible": 1,
       "parameter_enum": [
        "off",
        "on"
       ]
      }
     }
    }
   },
   {
    "box": {
     "id": "obj-255",
     "maxclass": "newobj",
     "numinlets": 0,
     "numoutlets": 1,
     "patching_rect": [
      1276.0,
      508.0,
      70.0,
      20.0
     ],
     "outlettype": [
      ""
     ],
     "text": "r ---wbang"
    }
   },
   {
    "box": {
     "id": "obj-256",
     "maxclass": "newobj",
     "numinlets": 0,
     "numoutlets": 1,
     "patching_rect": [
      1080.0,
      542.0,
      48.0,
      20.0
     ],
     "outlettype": [
      ""
     ],
     "text": "r ---g1"
    }
   },
   {
    "box": {
     "id": "obj-257",
     "maxclass": "newobj",
     "numinlets": 0,
     "numoutlets": 1,
     "patching_rect": [
      1132.0,
      542.0,
      48.0,
      20.0
     ],
     "outlettype": [
      ""
     ],
     "text": "r ---g2"
    }
   },
   {
    "box": {
     "id": "obj-258",
     "maxclass": "newobj",
     "numinlets": 0,
     "numoutlets": 1,
     "patching_rect": [
      1184.0,
      542.0,
      48.0,
      20.0
     ],
     "outlettype": [
      ""
     ],
     "text": "r ---g3"
    }
   },
   {
    "box": {
     "id": "obj-259",
     "maxclass": "newobj",
     "numinlets": 0,
     "numoutlets": 1,
     "patching_rect": [
      1236.0,
      542.0,
      48.0,
      20.0
     ],
     "outlettype": [
      ""
     ],
     "text": "r ---g4"
    }
   },
   {
    "box": {
     "id": "obj-260",
     "maxclass": "newobj",
     "numinlets": 0,
     "numoutlets": 1,
     "patching_rect": [
      1288.0,
      542.0,
      48.0,
      20.0
     ],
     "outlettype": [
      ""
     ],
     "text": "r ---g5"
    }
   },
   {
    "box": {
     "id": "obj-261",
     "maxclass": "newobj",
     "numinlets": 0,
     "numoutlets": 1,
     "patching_rect": [
      1080.0,
      568.0,
      48.0,
      20.0
     ],
     "outlettype": [
      ""
     ],
     "text": "r ---g6"
    }
   },
   {
    "box": {
     "id": "obj-262",
     "maxclass": "newobj",
     "numinlets": 0,
     "numoutlets": 1,
     "patching_rect": [
      1132.0,
      568.0,
      48.0,
      20.0
     ],
     "outlettype": [
      ""
     ],
     "text": "r ---g7"
    }
   },
   {
    "box": {
     "id": "obj-263",
     "maxclass": "newobj",
     "numinlets": 0,
     "numoutlets": 1,
     "patching_rect": [
      1184.0,
      568.0,
      48.0,
      20.0
     ],
     "outlettype": [
      ""
     ],
     "text": "r ---g8"
    }
   },
   {
    "box": {
     "id": "obj-264",
     "maxclass": "newobj",
     "numinlets": 0,
     "numoutlets": 1,
     "patching_rect": [
      1236.0,
      568.0,
      48.0,
      20.0
     ],
     "outlettype": [
      ""
     ],
     "text": "r ---g9"
    }
   },
   {
    "box": {
     "id": "obj-265",
     "maxclass": "newobj",
     "numinlets": 2,
     "numoutlets": 1,
     "patching_rect": [
      1350.0,
      542.0,
      34.0,
      22.0
     ],
     "outlettype": [
      "int"
     ],
     "text": "+ 1"
    }
   },
   {
    "box": {
     "id": "obj-266",
     "maxclass": "newobj",
     "numinlets": 10,
     "numoutlets": 1,
     "patching_rect": [
      1080.0,
      600.0,
      160.0,
      22.0
     ],
     "outlettype": [
      ""
     ],
     "text": "switch 9"
    }
   },
   {
    "box": {
     "id": "obj-267",
     "maxclass": "newobj",
     "numinlets": 4,
     "numoutlets": 1,
     "patching_rect": [
      1080.0,
      634.0,
      150.0,
      22.0
     ],
     "outlettype": [
      ""
     ],
     "text": "expr $f2 + ($f1 + $f4 * (1. - 2. * $f1)) * ($f3 - $f2)"
    }
   },
   {
    "box": {
     "id": "obj-268",
     "maxclass": "newobj",
     "numinlets": 2,
     "numoutlets": 1,
     "patching_rect": [
      1080.0,
      668.0,
      80.0,
      22.0
     ],
     "outlettype": [
      ""
     ],
     "text": "pack 0. 100."
    }
   },
   {
    "box": {
     "id": "obj-269",
     "maxclass": "newobj",
     "numinlets": 3,
     "numoutlets": 2,
     "patching_rect": [
      1080.0,
      702.0,
      70.0,
      22.0
     ],
     "outlettype": [
      "",
      "bang"
     ],
     "text": "line 0. 20"
    }
   },
   {
    "box": {
     "id": "obj-270",
     "maxclass": "newobj",
     "numinlets": 3,
     "numoutlets": 1,
     "patching_rect": [
      1080.0,
      736.0,
      160.0,
      22.0
     ],
     "outlettype": [
      ""
     ],
     "text": "expr $f2 + $f1 * ($f3 - $f2)"
    }
   },
   {
    "box": {
     "id": "obj-271",
     "maxclass": "newobj",
     "numinlets": 2,
     "numoutlets": 2,
     "patching_rect": [
      1080.0,
      770.0,
      90.0,
      22.0
     ],
     "outlettype": [
      "",
      ""
     ],
     "text": "live.remote~"
    }
   },
   {
    "box": {
     "id": "obj-272",
     "maxclass": "message",
     "numinlets": 2,
     "numoutlets": 1,
     "patching_rect": [
      1260.0,
      600.0,
      56.0,
      22.0
     ],
     "outlettype": [
      ""
     ],
     "text": "map 4"
    }
   },
   {
    "box": {
     "id": "obj-273",
     "maxclass": "message",
     "numinlets": 2,
     "numoutlets": 1,
     "patching_rect": [
      1260.0,
      630.0,
      66.0,
      22.0
     ],
     "outlettype": [
      ""
     ],
     "text": "unmap 4"
    }
   },
   {
    "box": {
     "id": "obj-274",
     "maxclass": "message",
     "numinlets": 2,
     "numoutlets": 1,
     "patching_rect": [
      1260.0,
      660.0,
      86.0,
      22.0
     ],
     "outlettype": [
      ""
     ],
     "text": "enable 4 $1"
    }
   },
   {
    "box": {
     "id": "obj-275",
     "maxclass": "newobj",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      1260.0,
      692.0,
      80.0,
      20.0
     ],
     "text": "s ---jscmd"
    }
   },
   {
    "box": {
     "id": "obj-276",
     "maxclass": "newobj",
     "numinlets": 0,
     "numoutlets": 1,
     "patching_rect": [
      1260.0,
      722.0,
      70.0,
      20.0
     ],
     "outlettype": [
      ""
     ],
     "text": "r ---slot4"
    }
   },
   {
    "box": {
     "id": "obj-277",
     "maxclass": "newobj",
     "numinlets": 1,
     "numoutlets": 5,
     "patching_rect": [
      1260.0,
      752.0,
      170.0,
      22.0
     ],
     "outlettype": [
      "",
      "",
      "",
      "",
      ""
     ],
     "text": "route id display path range"
    }
   },
   {
    "box": {
     "id": "obj-278",
     "maxclass": "newobj",
     "numinlets": 1,
     "numoutlets": 2,
     "patching_rect": [
      1430.0,
      784.0,
      80.0,
      22.0
     ],
     "outlettype": [
      "float",
      "float"
     ],
     "text": "unpack 0. 1."
    }
   },
   {
    "box": {
     "id": "obj-279",
     "maxclass": "newobj",
     "numinlets": 1,
     "numoutlets": 1,
     "patching_rect": [
      1260.0,
      784.0,
      75.0,
      22.0
     ],
     "outlettype": [
      ""
     ],
     "text": "prepend id"
    }
   },
   {
    "box": {
     "id": "obj-280",
     "maxclass": "newobj",
     "numinlets": 1,
     "numoutlets": 1,
     "patching_rect": [
      1260.0,
      816.0,
      60.0,
      22.0
     ],
     "outlettype": [
      ""
     ],
     "text": "deferlow"
    }
   },
   {
    "box": {
     "id": "obj-281",
     "maxclass": "newobj",
     "numinlets": 1,
     "numoutlets": 1,
     "patching_rect": [
      1342.0,
      784.0,
      80.0,
      22.0
     ],
     "outlettype": [
      ""
     ],
     "text": "prepend set"
    }
   },
   {
    "box": {
     "id": "obj-282",
     "maxclass": "newobj",
     "numinlets": 2,
     "numoutlets": 3,
     "patching_rect": [
      1260.0,
      848.0,
      88.0,
      22.0
     ],
     "outlettype": [
      "",
      "",
      ""
     ],
     "text": "pattr map4",
     "varname": "pattr_map4"
    }
   },
   {
    "box": {
     "id": "obj-283",
     "maxclass": "newobj",
     "numinlets": 0,
     "numoutlets": 1,
     "patching_rect": [
      1356.0,
      816.0,
      80.0,
      20.0
     ],
     "outlettype": [
      ""
     ],
     "text": "r ---restore"
    }
   },
   {
    "box": {
     "id": "obj-284",
     "maxclass": "newobj",
     "numinlets": 1,
     "numoutlets": 1,
     "patching_rect": [
      1260.0,
      880.0,
      110.0,
      22.0
     ],
     "outlettype": [
      ""
     ],
     "text": "prepend restore 4"
    }
   },
   {
    "box": {
     "id": "obj-285",
     "maxclass": "newobj",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      1260.0,
      912.0,
      80.0,
      20.0
     ],
     "text": "s ---jscmd"
    }
   },
   {
    "box": {
     "id": "obj-286",
     "maxclass": "comment",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      30.0,
      956.0,
      320.0,
      18.0
     ],
     "text": "—— Slot 5 ——",
     "fontsize": 11.0,
     "fontface": 1
    }
   },
   {
    "box": {
     "id": "obj-287",
     "maxclass": "live.menu",
     "numinlets": 1,
     "numoutlets": 3,
     "patching_rect": [
      30.0,
      980.0,
      50.0,
      15.0
     ],
     "outlettype": [
      "",
      "",
      ""
     ],
     "presentation": 1,
     "presentation_rect": [
      588.0,
      43.0,
      50.0,
      15.0
     ],
     "parameter_enable": 1,
     "varname": "S5_source",
     "saved_attribute_attributes": {
      "valueof": {
       "parameter_longname": "S5 Source",
       "parameter_shortname": "Src",
       "parameter_type": 2,
       "parameter_mmax": 8,
       "parameter_initial": [
        4
       ],
       "parameter_initial_enable": 1,
       "parameter_invisible": 1,
       "parameter_enum": [
        "L Open",
        "L Fist",
        "R Open",
        "R Fist",
        "H Dist",
        "L X",
        "L Y",
        "R X",
        "R Y"
       ]
      }
     }
    }
   },
   {
    "box": {
     "id": "obj-288",
     "maxclass": "flonum",
     "numinlets": 1,
     "numoutlets": 2,
     "patching_rect": [
      88.0,
      980.0,
      46.0,
      22.0
     ],
     "outlettype": [
      "",
      "bang"
     ],
     "presentation": 1,
     "presentation_rect": [
      644.0,
      42.0,
      38.0,
      20.0
     ],
     "cantchange": 1,
     "numdecimalplaces": 2,
     "bgcolor": [
      0.18,
      0.18,
      0.18,
      1.0
     ],
     "textcolor": [
      0.9,
      0.9,
      0.9,
      1.0
     ]
    }
   },
   {
    "box": {
     "id": "obj-289",
     "maxclass": "textbutton",
     "numinlets": 1,
     "numoutlets": 3,
     "patching_rect": [
      142.0,
      980.0,
      36.0,
      20.0
     ],
     "outlettype": [
      "",
      "",
      ""
     ],
     "text": "Map",
     "presentation": 1,
     "presentation_rect": [
      684.0,
      42.0,
      30.0,
      18.0
     ],
     "bgcolor": [
      0.22,
      0.22,
      0.22,
      1.0
     ],
     "bgoncolor": [
      0.98,
      0.65,
      0.12,
      1.0
     ],
     "textcolor": [
      0.88,
      0.88,
      0.88,
      1.0
     ],
     "textoncolor": [
      0.1,
      0.1,
      0.1,
      1.0
     ],
     "bordercolor": [
      0.38,
      0.38,
      0.38,
      1.0
     ],
     "rounded": 8.0
    }
   },
   {
    "box": {
     "id": "obj-290",
     "maxclass": "textbutton",
     "numinlets": 1,
     "numoutlets": 3,
     "patching_rect": [
      184.0,
      980.0,
      20.0,
      20.0
     ],
     "outlettype": [
      "",
      "",
      ""
     ],
     "text": "x",
     "presentation": 1,
     "presentation_rect": [
      716.0,
      42.0,
      16.0,
      18.0
     ],
     "bgcolor": [
      0.22,
      0.22,
      0.22,
      1.0
     ],
     "bgoncolor": [
      0.98,
      0.65,
      0.12,
      1.0
     ],
     "textcolor": [
      0.88,
      0.88,
      0.88,
      1.0
     ],
     "textoncolor": [
      0.1,
      0.1,
      0.1,
      1.0
     ],
     "bordercolor": [
      0.38,
      0.38,
      0.38,
      1.0
     ],
     "rounded": 8.0
    }
   },
   {
    "box": {
     "id": "obj-291",
     "maxclass": "comment",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      212.0,
      982.0,
      140.0,
      16.0
     ],
     "text": "--",
     "presentation": 1,
     "presentation_rect": [
      734.0,
      44.0,
      114.0,
      16.0
     ],
     "textcolor": [
      0.55,
      0.78,
      0.95,
      1.0
     ],
     "fontsize": 10.0
    }
   },
   {
    "box": {
     "id": "obj-292",
     "maxclass": "live.numbox",
     "numinlets": 1,
     "numoutlets": 2,
     "patching_rect": [
      30.0,
      1008.0,
      44.0,
      15.0
     ],
     "outlettype": [
      "",
      "float"
     ],
     "presentation": 1,
     "presentation_rect": [
      852.0,
      44.0,
      38.0,
      15.0
     ],
     "parameter_enable": 1,
     "varname": "S5_min",
     "saved_attribute_attributes": {
      "valueof": {
       "parameter_longname": "S5 Min",
       "parameter_shortname": "Min",
       "parameter_type": 0,
       "parameter_mmin": 0.0,
       "parameter_mmax": 1.0,
       "parameter_initial": [
        0.0
       ],
       "parameter_initial_enable": 1,
       "parameter_unitstyle": 1,
       "parameter_invisible": 1
      }
     }
    }
   },
   {
    "box": {
     "id": "obj-293",
     "maxclass": "live.numbox",
     "numinlets": 1,
     "numoutlets": 2,
     "patching_rect": [
      80.0,
      1008.0,
      44.0,
      15.0
     ],
     "outlettype": [
      "",
      "float"
     ],
     "presentation": 1,
     "presentation_rect": [
      892.0,
      44.0,
      38.0,
      15.0
     ],
     "parameter_enable": 1,
     "varname": "S5_max",
     "saved_attribute_attributes": {
      "valueof": {
       "parameter_longname": "S5 Max",
       "parameter_shortname": "Max",
       "parameter_type": 0,
       "parameter_mmin": 0.0,
       "parameter_mmax": 1.0,
       "parameter_initial": [
        1.0
       ],
       "parameter_initial_enable": 1,
       "parameter_unitstyle": 1,
       "parameter_invisible": 1
      }
     }
    }
   },
   {
    "box": {
     "id": "obj-294",
     "maxclass": "live.toggle",
     "numinlets": 1,
     "numoutlets": 1,
     "patching_rect": [
      130.0,
      1008.0,
      15.0,
      15.0
     ],
     "outlettype": [
      ""
     ],
     "presentation": 1,
     "presentation_rect": [
      934.0,
      45.0,
      14.0,
      14.0
     ],
     "parameter_enable": 1,
     "varname": "S5_invert",
     "saved_attribute_attributes": {
      "valueof": {
       "parameter_longname": "S5 Invert",
       "parameter_shortname": "Inv",
       "parameter_type": 2,
       "parameter_mmax": 1,
       "parameter_initial": [
        0
       ],
       "parameter_initial_enable": 1,
       "parameter_invisible": 1,
       "parameter_enum": [
        "off",
        "on"
       ]
      }
     }
    }
   },
   {
    "box": {
     "id": "obj-295",
     "maxclass": "live.numbox",
     "numinlets": 1,
     "numoutlets": 2,
     "patching_rect": [
      152.0,
      1008.0,
      44.0,
      15.0
     ],
     "outlettype": [
      "",
      "float"
     ],
     "presentation": 1,
     "presentation_rect": [
      950.0,
      44.0,
      40.0,
      15.0
     ],
     "parameter_enable": 1,
     "varname": "S5_smooth",
     "saved_attribute_attributes": {
      "valueof": {
       "parameter_longname": "S5 Smooth",
       "parameter_shortname": "Time",
       "parameter_type": 0,
       "parameter_mmin": 0.0,
       "parameter_mmax": 1000.0,
       "parameter_initial": [
        100.0
       ],
       "parameter_initial_enable": 1,
       "parameter_unitstyle": 2,
       "parameter_invisible": 1
      }
     }
    }
   },
   {
    "box": {
     "id": "obj-296",
     "maxclass": "live.toggle",
     "numinlets": 1,
     "numoutlets": 1,
     "patching_rect": [
      202.0,
      1008.0,
      15.0,
      15.0
     ],
     "outlettype": [
      ""
     ],
     "presentation": 1,
     "presentation_rect": [
      994.0,
      45.0,
      14.0,
      14.0
     ],
     "parameter_enable": 1,
     "varname": "S5_enable",
     "saved_attribute_attributes": {
      "valueof": {
       "parameter_longname": "S5 Enable",
       "parameter_shortname": "On",
       "parameter_type": 2,
       "parameter_mmax": 1,
       "parameter_initial": [
        1
       ],
       "parameter_initial_enable": 1,
       "parameter_invisible": 1,
       "parameter_enum": [
        "off",
        "on"
       ]
      }
     }
    }
   },
   {
    "box": {
     "id": "obj-297",
     "maxclass": "newobj",
     "numinlets": 0,
     "numoutlets": 1,
     "patching_rect": [
      226.0,
      1008.0,
      70.0,
      20.0
     ],
     "outlettype": [
      ""
     ],
     "text": "r ---wbang"
    }
   },
   {
    "box": {
     "id": "obj-298",
     "maxclass": "newobj",
     "numinlets": 0,
     "numoutlets": 1,
     "patching_rect": [
      30.0,
      1042.0,
      48.0,
      20.0
     ],
     "outlettype": [
      ""
     ],
     "text": "r ---g1"
    }
   },
   {
    "box": {
     "id": "obj-299",
     "maxclass": "newobj",
     "numinlets": 0,
     "numoutlets": 1,
     "patching_rect": [
      82.0,
      1042.0,
      48.0,
      20.0
     ],
     "outlettype": [
      ""
     ],
     "text": "r ---g2"
    }
   },
   {
    "box": {
     "id": "obj-300",
     "maxclass": "newobj",
     "numinlets": 0,
     "numoutlets": 1,
     "patching_rect": [
      134.0,
      1042.0,
      48.0,
      20.0
     ],
     "outlettype": [
      ""
     ],
     "text": "r ---g3"
    }
   },
   {
    "box": {
     "id": "obj-301",
     "maxclass": "newobj",
     "numinlets": 0,
     "numoutlets": 1,
     "patching_rect": [
      186.0,
      1042.0,
      48.0,
      20.0
     ],
     "outlettype": [
      ""
     ],
     "text": "r ---g4"
    }
   },
   {
    "box": {
     "id": "obj-302",
     "maxclass": "newobj",
     "numinlets": 0,
     "numoutlets": 1,
     "patching_rect": [
      238.0,
      1042.0,
      48.0,
      20.0
     ],
     "outlettype": [
      ""
     ],
     "text": "r ---g5"
    }
   },
   {
    "box": {
     "id": "obj-303",
     "maxclass": "newobj",
     "numinlets": 0,
     "numoutlets": 1,
     "patching_rect": [
      30.0,
      1068.0,
      48.0,
      20.0
     ],
     "outlettype": [
      ""
     ],
     "text": "r ---g6"
    }
   },
   {
    "box": {
     "id": "obj-304",
     "maxclass": "newobj",
     "numinlets": 0,
     "numoutlets": 1,
     "patching_rect": [
      82.0,
      1068.0,
      48.0,
      20.0
     ],
     "outlettype": [
      ""
     ],
     "text": "r ---g7"
    }
   },
   {
    "box": {
     "id": "obj-305",
     "maxclass": "newobj",
     "numinlets": 0,
     "numoutlets": 1,
     "patching_rect": [
      134.0,
      1068.0,
      48.0,
      20.0
     ],
     "outlettype": [
      ""
     ],
     "text": "r ---g8"
    }
   },
   {
    "box": {
     "id": "obj-306",
     "maxclass": "newobj",
     "numinlets": 0,
     "numoutlets": 1,
     "patching_rect": [
      186.0,
      1068.0,
      48.0,
      20.0
     ],
     "outlettype": [
      ""
     ],
     "text": "r ---g9"
    }
   },
   {
    "box": {
     "id": "obj-307",
     "maxclass": "newobj",
     "numinlets": 2,
     "numoutlets": 1,
     "patching_rect": [
      300.0,
      1042.0,
      34.0,
      22.0
     ],
     "outlettype": [
      "int"
     ],
     "text": "+ 1"
    }
   },
   {
    "box": {
     "id": "obj-308",
     "maxclass": "newobj",
     "numinlets": 10,
     "numoutlets": 1,
     "patching_rect": [
      30.0,
      1100.0,
      160.0,
      22.0
     ],
     "outlettype": [
      ""
     ],
     "text": "switch 9"
    }
   },
   {
    "box": {
     "id": "obj-309",
     "maxclass": "newobj",
     "numinlets": 4,
     "numoutlets": 1,
     "patching_rect": [
      30.0,
      1134.0,
      150.0,
      22.0
     ],
     "outlettype": [
      ""
     ],
     "text": "expr $f2 + ($f1 + $f4 * (1. - 2. * $f1)) * ($f3 - $f2)"
    }
   },
   {
    "box": {
     "id": "obj-310",
     "maxclass": "newobj",
     "numinlets": 2,
     "numoutlets": 1,
     "patching_rect": [
      30.0,
      1168.0,
      80.0,
      22.0
     ],
     "outlettype": [
      ""
     ],
     "text": "pack 0. 100."
    }
   },
   {
    "box": {
     "id": "obj-311",
     "maxclass": "newobj",
     "numinlets": 3,
     "numoutlets": 2,
     "patching_rect": [
      30.0,
      1202.0,
      70.0,
      22.0
     ],
     "outlettype": [
      "",
      "bang"
     ],
     "text": "line 0. 20"
    }
   },
   {
    "box": {
     "id": "obj-312",
     "maxclass": "newobj",
     "numinlets": 3,
     "numoutlets": 1,
     "patching_rect": [
      30.0,
      1236.0,
      160.0,
      22.0
     ],
     "outlettype": [
      ""
     ],
     "text": "expr $f2 + $f1 * ($f3 - $f2)"
    }
   },
   {
    "box": {
     "id": "obj-313",
     "maxclass": "newobj",
     "numinlets": 2,
     "numoutlets": 2,
     "patching_rect": [
      30.0,
      1270.0,
      90.0,
      22.0
     ],
     "outlettype": [
      "",
      ""
     ],
     "text": "live.remote~"
    }
   },
   {
    "box": {
     "id": "obj-314",
     "maxclass": "message",
     "numinlets": 2,
     "numoutlets": 1,
     "patching_rect": [
      210.0,
      1100.0,
      56.0,
      22.0
     ],
     "outlettype": [
      ""
     ],
     "text": "map 5"
    }
   },
   {
    "box": {
     "id": "obj-315",
     "maxclass": "message",
     "numinlets": 2,
     "numoutlets": 1,
     "patching_rect": [
      210.0,
      1130.0,
      66.0,
      22.0
     ],
     "outlettype": [
      ""
     ],
     "text": "unmap 5"
    }
   },
   {
    "box": {
     "id": "obj-316",
     "maxclass": "message",
     "numinlets": 2,
     "numoutlets": 1,
     "patching_rect": [
      210.0,
      1160.0,
      86.0,
      22.0
     ],
     "outlettype": [
      ""
     ],
     "text": "enable 5 $1"
    }
   },
   {
    "box": {
     "id": "obj-317",
     "maxclass": "newobj",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      210.0,
      1192.0,
      80.0,
      20.0
     ],
     "text": "s ---jscmd"
    }
   },
   {
    "box": {
     "id": "obj-318",
     "maxclass": "newobj",
     "numinlets": 0,
     "numoutlets": 1,
     "patching_rect": [
      210.0,
      1222.0,
      70.0,
      20.0
     ],
     "outlettype": [
      ""
     ],
     "text": "r ---slot5"
    }
   },
   {
    "box": {
     "id": "obj-319",
     "maxclass": "newobj",
     "numinlets": 1,
     "numoutlets": 5,
     "patching_rect": [
      210.0,
      1252.0,
      170.0,
      22.0
     ],
     "outlettype": [
      "",
      "",
      "",
      "",
      ""
     ],
     "text": "route id display path range"
    }
   },
   {
    "box": {
     "id": "obj-320",
     "maxclass": "newobj",
     "numinlets": 1,
     "numoutlets": 2,
     "patching_rect": [
      380.0,
      1284.0,
      80.0,
      22.0
     ],
     "outlettype": [
      "float",
      "float"
     ],
     "text": "unpack 0. 1."
    }
   },
   {
    "box": {
     "id": "obj-321",
     "maxclass": "newobj",
     "numinlets": 1,
     "numoutlets": 1,
     "patching_rect": [
      210.0,
      1284.0,
      75.0,
      22.0
     ],
     "outlettype": [
      ""
     ],
     "text": "prepend id"
    }
   },
   {
    "box": {
     "id": "obj-322",
     "maxclass": "newobj",
     "numinlets": 1,
     "numoutlets": 1,
     "patching_rect": [
      210.0,
      1316.0,
      60.0,
      22.0
     ],
     "outlettype": [
      ""
     ],
     "text": "deferlow"
    }
   },
   {
    "box": {
     "id": "obj-323",
     "maxclass": "newobj",
     "numinlets": 1,
     "numoutlets": 1,
     "patching_rect": [
      292.0,
      1284.0,
      80.0,
      22.0
     ],
     "outlettype": [
      ""
     ],
     "text": "prepend set"
    }
   },
   {
    "box": {
     "id": "obj-324",
     "maxclass": "newobj",
     "numinlets": 2,
     "numoutlets": 3,
     "patching_rect": [
      210.0,
      1348.0,
      88.0,
      22.0
     ],
     "outlettype": [
      "",
      "",
      ""
     ],
     "text": "pattr map5",
     "varname": "pattr_map5"
    }
   },
   {
    "box": {
     "id": "obj-325",
     "maxclass": "newobj",
     "numinlets": 0,
     "numoutlets": 1,
     "patching_rect": [
      306.0,
      1316.0,
      80.0,
      20.0
     ],
     "outlettype": [
      ""
     ],
     "text": "r ---restore"
    }
   },
   {
    "box": {
     "id": "obj-326",
     "maxclass": "newobj",
     "numinlets": 1,
     "numoutlets": 1,
     "patching_rect": [
      210.0,
      1380.0,
      110.0,
      22.0
     ],
     "outlettype": [
      ""
     ],
     "text": "prepend restore 5"
    }
   },
   {
    "box": {
     "id": "obj-327",
     "maxclass": "newobj",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      210.0,
      1412.0,
      80.0,
      20.0
     ],
     "text": "s ---jscmd"
    }
   },
   {
    "box": {
     "id": "obj-328",
     "maxclass": "comment",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      380.0,
      956.0,
      320.0,
      18.0
     ],
     "text": "—— Slot 6 ——",
     "fontsize": 11.0,
     "fontface": 1
    }
   },
   {
    "box": {
     "id": "obj-329",
     "maxclass": "live.menu",
     "numinlets": 1,
     "numoutlets": 3,
     "patching_rect": [
      380.0,
      980.0,
      50.0,
      15.0
     ],
     "outlettype": [
      "",
      "",
      ""
     ],
     "presentation": 1,
     "presentation_rect": [
      588.0,
      68.0,
      50.0,
      15.0
     ],
     "parameter_enable": 1,
     "varname": "S6_source",
     "saved_attribute_attributes": {
      "valueof": {
       "parameter_longname": "S6 Source",
       "parameter_shortname": "Src",
       "parameter_type": 2,
       "parameter_mmax": 8,
       "parameter_initial": [
        0
       ],
       "parameter_initial_enable": 1,
       "parameter_invisible": 1,
       "parameter_enum": [
        "L Open",
        "L Fist",
        "R Open",
        "R Fist",
        "H Dist",
        "L X",
        "L Y",
        "R X",
        "R Y"
       ]
      }
     }
    }
   },
   {
    "box": {
     "id": "obj-330",
     "maxclass": "flonum",
     "numinlets": 1,
     "numoutlets": 2,
     "patching_rect": [
      438.0,
      980.0,
      46.0,
      22.0
     ],
     "outlettype": [
      "",
      "bang"
     ],
     "presentation": 1,
     "presentation_rect": [
      644.0,
      67.0,
      38.0,
      20.0
     ],
     "cantchange": 1,
     "numdecimalplaces": 2,
     "bgcolor": [
      0.18,
      0.18,
      0.18,
      1.0
     ],
     "textcolor": [
      0.9,
      0.9,
      0.9,
      1.0
     ]
    }
   },
   {
    "box": {
     "id": "obj-331",
     "maxclass": "textbutton",
     "numinlets": 1,
     "numoutlets": 3,
     "patching_rect": [
      492.0,
      980.0,
      36.0,
      20.0
     ],
     "outlettype": [
      "",
      "",
      ""
     ],
     "text": "Map",
     "presentation": 1,
     "presentation_rect": [
      684.0,
      67.0,
      30.0,
      18.0
     ],
     "bgcolor": [
      0.22,
      0.22,
      0.22,
      1.0
     ],
     "bgoncolor": [
      0.98,
      0.65,
      0.12,
      1.0
     ],
     "textcolor": [
      0.88,
      0.88,
      0.88,
      1.0
     ],
     "textoncolor": [
      0.1,
      0.1,
      0.1,
      1.0
     ],
     "bordercolor": [
      0.38,
      0.38,
      0.38,
      1.0
     ],
     "rounded": 8.0
    }
   },
   {
    "box": {
     "id": "obj-332",
     "maxclass": "textbutton",
     "numinlets": 1,
     "numoutlets": 3,
     "patching_rect": [
      534.0,
      980.0,
      20.0,
      20.0
     ],
     "outlettype": [
      "",
      "",
      ""
     ],
     "text": "x",
     "presentation": 1,
     "presentation_rect": [
      716.0,
      67.0,
      16.0,
      18.0
     ],
     "bgcolor": [
      0.22,
      0.22,
      0.22,
      1.0
     ],
     "bgoncolor": [
      0.98,
      0.65,
      0.12,
      1.0
     ],
     "textcolor": [
      0.88,
      0.88,
      0.88,
      1.0
     ],
     "textoncolor": [
      0.1,
      0.1,
      0.1,
      1.0
     ],
     "bordercolor": [
      0.38,
      0.38,
      0.38,
      1.0
     ],
     "rounded": 8.0
    }
   },
   {
    "box": {
     "id": "obj-333",
     "maxclass": "comment",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      562.0,
      982.0,
      140.0,
      16.0
     ],
     "text": "--",
     "presentation": 1,
     "presentation_rect": [
      734.0,
      69.0,
      114.0,
      16.0
     ],
     "textcolor": [
      0.55,
      0.78,
      0.95,
      1.0
     ],
     "fontsize": 10.0
    }
   },
   {
    "box": {
     "id": "obj-334",
     "maxclass": "live.numbox",
     "numinlets": 1,
     "numoutlets": 2,
     "patching_rect": [
      380.0,
      1008.0,
      44.0,
      15.0
     ],
     "outlettype": [
      "",
      "float"
     ],
     "presentation": 1,
     "presentation_rect": [
      852.0,
      69.0,
      38.0,
      15.0
     ],
     "parameter_enable": 1,
     "varname": "S6_min",
     "saved_attribute_attributes": {
      "valueof": {
       "parameter_longname": "S6 Min",
       "parameter_shortname": "Min",
       "parameter_type": 0,
       "parameter_mmin": 0.0,
       "parameter_mmax": 1.0,
       "parameter_initial": [
        0.0
       ],
       "parameter_initial_enable": 1,
       "parameter_unitstyle": 1,
       "parameter_invisible": 1
      }
     }
    }
   },
   {
    "box": {
     "id": "obj-335",
     "maxclass": "live.numbox",
     "numinlets": 1,
     "numoutlets": 2,
     "patching_rect": [
      430.0,
      1008.0,
      44.0,
      15.0
     ],
     "outlettype": [
      "",
      "float"
     ],
     "presentation": 1,
     "presentation_rect": [
      892.0,
      69.0,
      38.0,
      15.0
     ],
     "parameter_enable": 1,
     "varname": "S6_max",
     "saved_attribute_attributes": {
      "valueof": {
       "parameter_longname": "S6 Max",
       "parameter_shortname": "Max",
       "parameter_type": 0,
       "parameter_mmin": 0.0,
       "parameter_mmax": 1.0,
       "parameter_initial": [
        1.0
       ],
       "parameter_initial_enable": 1,
       "parameter_unitstyle": 1,
       "parameter_invisible": 1
      }
     }
    }
   },
   {
    "box": {
     "id": "obj-336",
     "maxclass": "live.toggle",
     "numinlets": 1,
     "numoutlets": 1,
     "patching_rect": [
      480.0,
      1008.0,
      15.0,
      15.0
     ],
     "outlettype": [
      ""
     ],
     "presentation": 1,
     "presentation_rect": [
      934.0,
      70.0,
      14.0,
      14.0
     ],
     "parameter_enable": 1,
     "varname": "S6_invert",
     "saved_attribute_attributes": {
      "valueof": {
       "parameter_longname": "S6 Invert",
       "parameter_shortname": "Inv",
       "parameter_type": 2,
       "parameter_mmax": 1,
       "parameter_initial": [
        0
       ],
       "parameter_initial_enable": 1,
       "parameter_invisible": 1,
       "parameter_enum": [
        "off",
        "on"
       ]
      }
     }
    }
   },
   {
    "box": {
     "id": "obj-337",
     "maxclass": "live.numbox",
     "numinlets": 1,
     "numoutlets": 2,
     "patching_rect": [
      502.0,
      1008.0,
      44.0,
      15.0
     ],
     "outlettype": [
      "",
      "float"
     ],
     "presentation": 1,
     "presentation_rect": [
      950.0,
      69.0,
      40.0,
      15.0
     ],
     "parameter_enable": 1,
     "varname": "S6_smooth",
     "saved_attribute_attributes": {
      "valueof": {
       "parameter_longname": "S6 Smooth",
       "parameter_shortname": "Time",
       "parameter_type": 0,
       "parameter_mmin": 0.0,
       "parameter_mmax": 1000.0,
       "parameter_initial": [
        100.0
       ],
       "parameter_initial_enable": 1,
       "parameter_unitstyle": 2,
       "parameter_invisible": 1
      }
     }
    }
   },
   {
    "box": {
     "id": "obj-338",
     "maxclass": "live.toggle",
     "numinlets": 1,
     "numoutlets": 1,
     "patching_rect": [
      552.0,
      1008.0,
      15.0,
      15.0
     ],
     "outlettype": [
      ""
     ],
     "presentation": 1,
     "presentation_rect": [
      994.0,
      70.0,
      14.0,
      14.0
     ],
     "parameter_enable": 1,
     "varname": "S6_enable",
     "saved_attribute_attributes": {
      "valueof": {
       "parameter_longname": "S6 Enable",
       "parameter_shortname": "On",
       "parameter_type": 2,
       "parameter_mmax": 1,
       "parameter_initial": [
        1
       ],
       "parameter_initial_enable": 1,
       "parameter_invisible": 1,
       "parameter_enum": [
        "off",
        "on"
       ]
      }
     }
    }
   },
   {
    "box": {
     "id": "obj-339",
     "maxclass": "newobj",
     "numinlets": 0,
     "numoutlets": 1,
     "patching_rect": [
      576.0,
      1008.0,
      70.0,
      20.0
     ],
     "outlettype": [
      ""
     ],
     "text": "r ---wbang"
    }
   },
   {
    "box": {
     "id": "obj-340",
     "maxclass": "newobj",
     "numinlets": 0,
     "numoutlets": 1,
     "patching_rect": [
      380.0,
      1042.0,
      48.0,
      20.0
     ],
     "outlettype": [
      ""
     ],
     "text": "r ---g1"
    }
   },
   {
    "box": {
     "id": "obj-341",
     "maxclass": "newobj",
     "numinlets": 0,
     "numoutlets": 1,
     "patching_rect": [
      432.0,
      1042.0,
      48.0,
      20.0
     ],
     "outlettype": [
      ""
     ],
     "text": "r ---g2"
    }
   },
   {
    "box": {
     "id": "obj-342",
     "maxclass": "newobj",
     "numinlets": 0,
     "numoutlets": 1,
     "patching_rect": [
      484.0,
      1042.0,
      48.0,
      20.0
     ],
     "outlettype": [
      ""
     ],
     "text": "r ---g3"
    }
   },
   {
    "box": {
     "id": "obj-343",
     "maxclass": "newobj",
     "numinlets": 0,
     "numoutlets": 1,
     "patching_rect": [
      536.0,
      1042.0,
      48.0,
      20.0
     ],
     "outlettype": [
      ""
     ],
     "text": "r ---g4"
    }
   },
   {
    "box": {
     "id": "obj-344",
     "maxclass": "newobj",
     "numinlets": 0,
     "numoutlets": 1,
     "patching_rect": [
      588.0,
      1042.0,
      48.0,
      20.0
     ],
     "outlettype": [
      ""
     ],
     "text": "r ---g5"
    }
   },
   {
    "box": {
     "id": "obj-345",
     "maxclass": "newobj",
     "numinlets": 0,
     "numoutlets": 1,
     "patching_rect": [
      380.0,
      1068.0,
      48.0,
      20.0
     ],
     "outlettype": [
      ""
     ],
     "text": "r ---g6"
    }
   },
   {
    "box": {
     "id": "obj-346",
     "maxclass": "newobj",
     "numinlets": 0,
     "numoutlets": 1,
     "patching_rect": [
      432.0,
      1068.0,
      48.0,
      20.0
     ],
     "outlettype": [
      ""
     ],
     "text": "r ---g7"
    }
   },
   {
    "box": {
     "id": "obj-347",
     "maxclass": "newobj",
     "numinlets": 0,
     "numoutlets": 1,
     "patching_rect": [
      484.0,
      1068.0,
      48.0,
      20.0
     ],
     "outlettype": [
      ""
     ],
     "text": "r ---g8"
    }
   },
   {
    "box": {
     "id": "obj-348",
     "maxclass": "newobj",
     "numinlets": 0,
     "numoutlets": 1,
     "patching_rect": [
      536.0,
      1068.0,
      48.0,
      20.0
     ],
     "outlettype": [
      ""
     ],
     "text": "r ---g9"
    }
   },
   {
    "box": {
     "id": "obj-349",
     "maxclass": "newobj",
     "numinlets": 2,
     "numoutlets": 1,
     "patching_rect": [
      650.0,
      1042.0,
      34.0,
      22.0
     ],
     "outlettype": [
      "int"
     ],
     "text": "+ 1"
    }
   },
   {
    "box": {
     "id": "obj-350",
     "maxclass": "newobj",
     "numinlets": 10,
     "numoutlets": 1,
     "patching_rect": [
      380.0,
      1100.0,
      160.0,
      22.0
     ],
     "outlettype": [
      ""
     ],
     "text": "switch 9"
    }
   },
   {
    "box": {
     "id": "obj-351",
     "maxclass": "newobj",
     "numinlets": 4,
     "numoutlets": 1,
     "patching_rect": [
      380.0,
      1134.0,
      150.0,
      22.0
     ],
     "outlettype": [
      ""
     ],
     "text": "expr $f2 + ($f1 + $f4 * (1. - 2. * $f1)) * ($f3 - $f2)"
    }
   },
   {
    "box": {
     "id": "obj-352",
     "maxclass": "newobj",
     "numinlets": 2,
     "numoutlets": 1,
     "patching_rect": [
      380.0,
      1168.0,
      80.0,
      22.0
     ],
     "outlettype": [
      ""
     ],
     "text": "pack 0. 100."
    }
   },
   {
    "box": {
     "id": "obj-353",
     "maxclass": "newobj",
     "numinlets": 3,
     "numoutlets": 2,
     "patching_rect": [
      380.0,
      1202.0,
      70.0,
      22.0
     ],
     "outlettype": [
      "",
      "bang"
     ],
     "text": "line 0. 20"
    }
   },
   {
    "box": {
     "id": "obj-354",
     "maxclass": "newobj",
     "numinlets": 3,
     "numoutlets": 1,
     "patching_rect": [
      380.0,
      1236.0,
      160.0,
      22.0
     ],
     "outlettype": [
      ""
     ],
     "text": "expr $f2 + $f1 * ($f3 - $f2)"
    }
   },
   {
    "box": {
     "id": "obj-355",
     "maxclass": "newobj",
     "numinlets": 2,
     "numoutlets": 2,
     "patching_rect": [
      380.0,
      1270.0,
      90.0,
      22.0
     ],
     "outlettype": [
      "",
      ""
     ],
     "text": "live.remote~"
    }
   },
   {
    "box": {
     "id": "obj-356",
     "maxclass": "message",
     "numinlets": 2,
     "numoutlets": 1,
     "patching_rect": [
      560.0,
      1100.0,
      56.0,
      22.0
     ],
     "outlettype": [
      ""
     ],
     "text": "map 6"
    }
   },
   {
    "box": {
     "id": "obj-357",
     "maxclass": "message",
     "numinlets": 2,
     "numoutlets": 1,
     "patching_rect": [
      560.0,
      1130.0,
      66.0,
      22.0
     ],
     "outlettype": [
      ""
     ],
     "text": "unmap 6"
    }
   },
   {
    "box": {
     "id": "obj-358",
     "maxclass": "message",
     "numinlets": 2,
     "numoutlets": 1,
     "patching_rect": [
      560.0,
      1160.0,
      86.0,
      22.0
     ],
     "outlettype": [
      ""
     ],
     "text": "enable 6 $1"
    }
   },
   {
    "box": {
     "id": "obj-359",
     "maxclass": "newobj",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      560.0,
      1192.0,
      80.0,
      20.0
     ],
     "text": "s ---jscmd"
    }
   },
   {
    "box": {
     "id": "obj-360",
     "maxclass": "newobj",
     "numinlets": 0,
     "numoutlets": 1,
     "patching_rect": [
      560.0,
      1222.0,
      70.0,
      20.0
     ],
     "outlettype": [
      ""
     ],
     "text": "r ---slot6"
    }
   },
   {
    "box": {
     "id": "obj-361",
     "maxclass": "newobj",
     "numinlets": 1,
     "numoutlets": 5,
     "patching_rect": [
      560.0,
      1252.0,
      170.0,
      22.0
     ],
     "outlettype": [
      "",
      "",
      "",
      "",
      ""
     ],
     "text": "route id display path range"
    }
   },
   {
    "box": {
     "id": "obj-362",
     "maxclass": "newobj",
     "numinlets": 1,
     "numoutlets": 2,
     "patching_rect": [
      730.0,
      1284.0,
      80.0,
      22.0
     ],
     "outlettype": [
      "float",
      "float"
     ],
     "text": "unpack 0. 1."
    }
   },
   {
    "box": {
     "id": "obj-363",
     "maxclass": "newobj",
     "numinlets": 1,
     "numoutlets": 1,
     "patching_rect": [
      560.0,
      1284.0,
      75.0,
      22.0
     ],
     "outlettype": [
      ""
     ],
     "text": "prepend id"
    }
   },
   {
    "box": {
     "id": "obj-364",
     "maxclass": "newobj",
     "numinlets": 1,
     "numoutlets": 1,
     "patching_rect": [
      560.0,
      1316.0,
      60.0,
      22.0
     ],
     "outlettype": [
      ""
     ],
     "text": "deferlow"
    }
   },
   {
    "box": {
     "id": "obj-365",
     "maxclass": "newobj",
     "numinlets": 1,
     "numoutlets": 1,
     "patching_rect": [
      642.0,
      1284.0,
      80.0,
      22.0
     ],
     "outlettype": [
      ""
     ],
     "text": "prepend set"
    }
   },
   {
    "box": {
     "id": "obj-366",
     "maxclass": "newobj",
     "numinlets": 2,
     "numoutlets": 3,
     "patching_rect": [
      560.0,
      1348.0,
      88.0,
      22.0
     ],
     "outlettype": [
      "",
      "",
      ""
     ],
     "text": "pattr map6",
     "varname": "pattr_map6"
    }
   },
   {
    "box": {
     "id": "obj-367",
     "maxclass": "newobj",
     "numinlets": 0,
     "numoutlets": 1,
     "patching_rect": [
      656.0,
      1316.0,
      80.0,
      20.0
     ],
     "outlettype": [
      ""
     ],
     "text": "r ---restore"
    }
   },
   {
    "box": {
     "id": "obj-368",
     "maxclass": "newobj",
     "numinlets": 1,
     "numoutlets": 1,
     "patching_rect": [
      560.0,
      1380.0,
      110.0,
      22.0
     ],
     "outlettype": [
      ""
     ],
     "text": "prepend restore 6"
    }
   },
   {
    "box": {
     "id": "obj-369",
     "maxclass": "newobj",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      560.0,
      1412.0,
      80.0,
      20.0
     ],
     "text": "s ---jscmd"
    }
   },
   {
    "box": {
     "id": "obj-370",
     "maxclass": "comment",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      730.0,
      956.0,
      320.0,
      18.0
     ],
     "text": "—— Slot 7 ——",
     "fontsize": 11.0,
     "fontface": 1
    }
   },
   {
    "box": {
     "id": "obj-371",
     "maxclass": "live.menu",
     "numinlets": 1,
     "numoutlets": 3,
     "patching_rect": [
      730.0,
      980.0,
      50.0,
      15.0
     ],
     "outlettype": [
      "",
      "",
      ""
     ],
     "presentation": 1,
     "presentation_rect": [
      588.0,
      93.0,
      50.0,
      15.0
     ],
     "parameter_enable": 1,
     "varname": "S7_source",
     "saved_attribute_attributes": {
      "valueof": {
       "parameter_longname": "S7 Source",
       "parameter_shortname": "Src",
       "parameter_type": 2,
       "parameter_mmax": 8,
       "parameter_initial": [
        2
       ],
       "parameter_initial_enable": 1,
       "parameter_invisible": 1,
       "parameter_enum": [
        "L Open",
        "L Fist",
        "R Open",
        "R Fist",
        "H Dist",
        "L X",
        "L Y",
        "R X",
        "R Y"
       ]
      }
     }
    }
   },
   {
    "box": {
     "id": "obj-372",
     "maxclass": "flonum",
     "numinlets": 1,
     "numoutlets": 2,
     "patching_rect": [
      788.0,
      980.0,
      46.0,
      22.0
     ],
     "outlettype": [
      "",
      "bang"
     ],
     "presentation": 1,
     "presentation_rect": [
      644.0,
      92.0,
      38.0,
      20.0
     ],
     "cantchange": 1,
     "numdecimalplaces": 2,
     "bgcolor": [
      0.18,
      0.18,
      0.18,
      1.0
     ],
     "textcolor": [
      0.9,
      0.9,
      0.9,
      1.0
     ]
    }
   },
   {
    "box": {
     "id": "obj-373",
     "maxclass": "textbutton",
     "numinlets": 1,
     "numoutlets": 3,
     "patching_rect": [
      842.0,
      980.0,
      36.0,
      20.0
     ],
     "outlettype": [
      "",
      "",
      ""
     ],
     "text": "Map",
     "presentation": 1,
     "presentation_rect": [
      684.0,
      92.0,
      30.0,
      18.0
     ],
     "bgcolor": [
      0.22,
      0.22,
      0.22,
      1.0
     ],
     "bgoncolor": [
      0.98,
      0.65,
      0.12,
      1.0
     ],
     "textcolor": [
      0.88,
      0.88,
      0.88,
      1.0
     ],
     "textoncolor": [
      0.1,
      0.1,
      0.1,
      1.0
     ],
     "bordercolor": [
      0.38,
      0.38,
      0.38,
      1.0
     ],
     "rounded": 8.0
    }
   },
   {
    "box": {
     "id": "obj-374",
     "maxclass": "textbutton",
     "numinlets": 1,
     "numoutlets": 3,
     "patching_rect": [
      884.0,
      980.0,
      20.0,
      20.0
     ],
     "outlettype": [
      "",
      "",
      ""
     ],
     "text": "x",
     "presentation": 1,
     "presentation_rect": [
      716.0,
      92.0,
      16.0,
      18.0
     ],
     "bgcolor": [
      0.22,
      0.22,
      0.22,
      1.0
     ],
     "bgoncolor": [
      0.98,
      0.65,
      0.12,
      1.0
     ],
     "textcolor": [
      0.88,
      0.88,
      0.88,
      1.0
     ],
     "textoncolor": [
      0.1,
      0.1,
      0.1,
      1.0
     ],
     "bordercolor": [
      0.38,
      0.38,
      0.38,
      1.0
     ],
     "rounded": 8.0
    }
   },
   {
    "box": {
     "id": "obj-375",
     "maxclass": "comment",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      912.0,
      982.0,
      140.0,
      16.0
     ],
     "text": "--",
     "presentation": 1,
     "presentation_rect": [
      734.0,
      94.0,
      114.0,
      16.0
     ],
     "textcolor": [
      0.55,
      0.78,
      0.95,
      1.0
     ],
     "fontsize": 10.0
    }
   },
   {
    "box": {
     "id": "obj-376",
     "maxclass": "live.numbox",
     "numinlets": 1,
     "numoutlets": 2,
     "patching_rect": [
      730.0,
      1008.0,
      44.0,
      15.0
     ],
     "outlettype": [
      "",
      "float"
     ],
     "presentation": 1,
     "presentation_rect": [
      852.0,
      94.0,
      38.0,
      15.0
     ],
     "parameter_enable": 1,
     "varname": "S7_min",
     "saved_attribute_attributes": {
      "valueof": {
       "parameter_longname": "S7 Min",
       "parameter_shortname": "Min",
       "parameter_type": 0,
       "parameter_mmin": 0.0,
       "parameter_mmax": 1.0,
       "parameter_initial": [
        0.0
       ],
       "parameter_initial_enable": 1,
       "parameter_unitstyle": 1,
       "parameter_invisible": 1
      }
     }
    }
   },
   {
    "box": {
     "id": "obj-377",
     "maxclass": "live.numbox",
     "numinlets": 1,
     "numoutlets": 2,
     "patching_rect": [
      780.0,
      1008.0,
      44.0,
      15.0
     ],
     "outlettype": [
      "",
      "float"
     ],
     "presentation": 1,
     "presentation_rect": [
      892.0,
      94.0,
      38.0,
      15.0
     ],
     "parameter_enable": 1,
     "varname": "S7_max",
     "saved_attribute_attributes": {
      "valueof": {
       "parameter_longname": "S7 Max",
       "parameter_shortname": "Max",
       "parameter_type": 0,
       "parameter_mmin": 0.0,
       "parameter_mmax": 1.0,
       "parameter_initial": [
        1.0
       ],
       "parameter_initial_enable": 1,
       "parameter_unitstyle": 1,
       "parameter_invisible": 1
      }
     }
    }
   },
   {
    "box": {
     "id": "obj-378",
     "maxclass": "live.toggle",
     "numinlets": 1,
     "numoutlets": 1,
     "patching_rect": [
      830.0,
      1008.0,
      15.0,
      15.0
     ],
     "outlettype": [
      ""
     ],
     "presentation": 1,
     "presentation_rect": [
      934.0,
      95.0,
      14.0,
      14.0
     ],
     "parameter_enable": 1,
     "varname": "S7_invert",
     "saved_attribute_attributes": {
      "valueof": {
       "parameter_longname": "S7 Invert",
       "parameter_shortname": "Inv",
       "parameter_type": 2,
       "parameter_mmax": 1,
       "parameter_initial": [
        0
       ],
       "parameter_initial_enable": 1,
       "parameter_invisible": 1,
       "parameter_enum": [
        "off",
        "on"
       ]
      }
     }
    }
   },
   {
    "box": {
     "id": "obj-379",
     "maxclass": "live.numbox",
     "numinlets": 1,
     "numoutlets": 2,
     "patching_rect": [
      852.0,
      1008.0,
      44.0,
      15.0
     ],
     "outlettype": [
      "",
      "float"
     ],
     "presentation": 1,
     "presentation_rect": [
      950.0,
      94.0,
      40.0,
      15.0
     ],
     "parameter_enable": 1,
     "varname": "S7_smooth",
     "saved_attribute_attributes": {
      "valueof": {
       "parameter_longname": "S7 Smooth",
       "parameter_shortname": "Time",
       "parameter_type": 0,
       "parameter_mmin": 0.0,
       "parameter_mmax": 1000.0,
       "parameter_initial": [
        100.0
       ],
       "parameter_initial_enable": 1,
       "parameter_unitstyle": 2,
       "parameter_invisible": 1
      }
     }
    }
   },
   {
    "box": {
     "id": "obj-380",
     "maxclass": "live.toggle",
     "numinlets": 1,
     "numoutlets": 1,
     "patching_rect": [
      902.0,
      1008.0,
      15.0,
      15.0
     ],
     "outlettype": [
      ""
     ],
     "presentation": 1,
     "presentation_rect": [
      994.0,
      95.0,
      14.0,
      14.0
     ],
     "parameter_enable": 1,
     "varname": "S7_enable",
     "saved_attribute_attributes": {
      "valueof": {
       "parameter_longname": "S7 Enable",
       "parameter_shortname": "On",
       "parameter_type": 2,
       "parameter_mmax": 1,
       "parameter_initial": [
        1
       ],
       "parameter_initial_enable": 1,
       "parameter_invisible": 1,
       "parameter_enum": [
        "off",
        "on"
       ]
      }
     }
    }
   },
   {
    "box": {
     "id": "obj-381",
     "maxclass": "newobj",
     "numinlets": 0,
     "numoutlets": 1,
     "patching_rect": [
      926.0,
      1008.0,
      70.0,
      20.0
     ],
     "outlettype": [
      ""
     ],
     "text": "r ---wbang"
    }
   },
   {
    "box": {
     "id": "obj-382",
     "maxclass": "newobj",
     "numinlets": 0,
     "numoutlets": 1,
     "patching_rect": [
      730.0,
      1042.0,
      48.0,
      20.0
     ],
     "outlettype": [
      ""
     ],
     "text": "r ---g1"
    }
   },
   {
    "box": {
     "id": "obj-383",
     "maxclass": "newobj",
     "numinlets": 0,
     "numoutlets": 1,
     "patching_rect": [
      782.0,
      1042.0,
      48.0,
      20.0
     ],
     "outlettype": [
      ""
     ],
     "text": "r ---g2"
    }
   },
   {
    "box": {
     "id": "obj-384",
     "maxclass": "newobj",
     "numinlets": 0,
     "numoutlets": 1,
     "patching_rect": [
      834.0,
      1042.0,
      48.0,
      20.0
     ],
     "outlettype": [
      ""
     ],
     "text": "r ---g3"
    }
   },
   {
    "box": {
     "id": "obj-385",
     "maxclass": "newobj",
     "numinlets": 0,
     "numoutlets": 1,
     "patching_rect": [
      886.0,
      1042.0,
      48.0,
      20.0
     ],
     "outlettype": [
      ""
     ],
     "text": "r ---g4"
    }
   },
   {
    "box": {
     "id": "obj-386",
     "maxclass": "newobj",
     "numinlets": 0,
     "numoutlets": 1,
     "patching_rect": [
      938.0,
      1042.0,
      48.0,
      20.0
     ],
     "outlettype": [
      ""
     ],
     "text": "r ---g5"
    }
   },
   {
    "box": {
     "id": "obj-387",
     "maxclass": "newobj",
     "numinlets": 0,
     "numoutlets": 1,
     "patching_rect": [
      730.0,
      1068.0,
      48.0,
      20.0
     ],
     "outlettype": [
      ""
     ],
     "text": "r ---g6"
    }
   },
   {
    "box": {
     "id": "obj-388",
     "maxclass": "newobj",
     "numinlets": 0,
     "numoutlets": 1,
     "patching_rect": [
      782.0,
      1068.0,
      48.0,
      20.0
     ],
     "outlettype": [
      ""
     ],
     "text": "r ---g7"
    }
   },
   {
    "box": {
     "id": "obj-389",
     "maxclass": "newobj",
     "numinlets": 0,
     "numoutlets": 1,
     "patching_rect": [
      834.0,
      1068.0,
      48.0,
      20.0
     ],
     "outlettype": [
      ""
     ],
     "text": "r ---g8"
    }
   },
   {
    "box": {
     "id": "obj-390",
     "maxclass": "newobj",
     "numinlets": 0,
     "numoutlets": 1,
     "patching_rect": [
      886.0,
      1068.0,
      48.0,
      20.0
     ],
     "outlettype": [
      ""
     ],
     "text": "r ---g9"
    }
   },
   {
    "box": {
     "id": "obj-391",
     "maxclass": "newobj",
     "numinlets": 2,
     "numoutlets": 1,
     "patching_rect": [
      1000.0,
      1042.0,
      34.0,
      22.0
     ],
     "outlettype": [
      "int"
     ],
     "text": "+ 1"
    }
   },
   {
    "box": {
     "id": "obj-392",
     "maxclass": "newobj",
     "numinlets": 10,
     "numoutlets": 1,
     "patching_rect": [
      730.0,
      1100.0,
      160.0,
      22.0
     ],
     "outlettype": [
      ""
     ],
     "text": "switch 9"
    }
   },
   {
    "box": {
     "id": "obj-393",
     "maxclass": "newobj",
     "numinlets": 4,
     "numoutlets": 1,
     "patching_rect": [
      730.0,
      1134.0,
      150.0,
      22.0
     ],
     "outlettype": [
      ""
     ],
     "text": "expr $f2 + ($f1 + $f4 * (1. - 2. * $f1)) * ($f3 - $f2)"
    }
   },
   {
    "box": {
     "id": "obj-394",
     "maxclass": "newobj",
     "numinlets": 2,
     "numoutlets": 1,
     "patching_rect": [
      730.0,
      1168.0,
      80.0,
      22.0
     ],
     "outlettype": [
      ""
     ],
     "text": "pack 0. 100."
    }
   },
   {
    "box": {
     "id": "obj-395",
     "maxclass": "newobj",
     "numinlets": 3,
     "numoutlets": 2,
     "patching_rect": [
      730.0,
      1202.0,
      70.0,
      22.0
     ],
     "outlettype": [
      "",
      "bang"
     ],
     "text": "line 0. 20"
    }
   },
   {
    "box": {
     "id": "obj-396",
     "maxclass": "newobj",
     "numinlets": 3,
     "numoutlets": 1,
     "patching_rect": [
      730.0,
      1236.0,
      160.0,
      22.0
     ],
     "outlettype": [
      ""
     ],
     "text": "expr $f2 + $f1 * ($f3 - $f2)"
    }
   },
   {
    "box": {
     "id": "obj-397",
     "maxclass": "newobj",
     "numinlets": 2,
     "numoutlets": 2,
     "patching_rect": [
      730.0,
      1270.0,
      90.0,
      22.0
     ],
     "outlettype": [
      "",
      ""
     ],
     "text": "live.remote~"
    }
   },
   {
    "box": {
     "id": "obj-398",
     "maxclass": "message",
     "numinlets": 2,
     "numoutlets": 1,
     "patching_rect": [
      910.0,
      1100.0,
      56.0,
      22.0
     ],
     "outlettype": [
      ""
     ],
     "text": "map 7"
    }
   },
   {
    "box": {
     "id": "obj-399",
     "maxclass": "message",
     "numinlets": 2,
     "numoutlets": 1,
     "patching_rect": [
      910.0,
      1130.0,
      66.0,
      22.0
     ],
     "outlettype": [
      ""
     ],
     "text": "unmap 7"
    }
   },
   {
    "box": {
     "id": "obj-400",
     "maxclass": "message",
     "numinlets": 2,
     "numoutlets": 1,
     "patching_rect": [
      910.0,
      1160.0,
      86.0,
      22.0
     ],
     "outlettype": [
      ""
     ],
     "text": "enable 7 $1"
    }
   },
   {
    "box": {
     "id": "obj-401",
     "maxclass": "newobj",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      910.0,
      1192.0,
      80.0,
      20.0
     ],
     "text": "s ---jscmd"
    }
   },
   {
    "box": {
     "id": "obj-402",
     "maxclass": "newobj",
     "numinlets": 0,
     "numoutlets": 1,
     "patching_rect": [
      910.0,
      1222.0,
      70.0,
      20.0
     ],
     "outlettype": [
      ""
     ],
     "text": "r ---slot7"
    }
   },
   {
    "box": {
     "id": "obj-403",
     "maxclass": "newobj",
     "numinlets": 1,
     "numoutlets": 5,
     "patching_rect": [
      910.0,
      1252.0,
      170.0,
      22.0
     ],
     "outlettype": [
      "",
      "",
      "",
      "",
      ""
     ],
     "text": "route id display path range"
    }
   },
   {
    "box": {
     "id": "obj-404",
     "maxclass": "newobj",
     "numinlets": 1,
     "numoutlets": 2,
     "patching_rect": [
      1080.0,
      1284.0,
      80.0,
      22.0
     ],
     "outlettype": [
      "float",
      "float"
     ],
     "text": "unpack 0. 1."
    }
   },
   {
    "box": {
     "id": "obj-405",
     "maxclass": "newobj",
     "numinlets": 1,
     "numoutlets": 1,
     "patching_rect": [
      910.0,
      1284.0,
      75.0,
      22.0
     ],
     "outlettype": [
      ""
     ],
     "text": "prepend id"
    }
   },
   {
    "box": {
     "id": "obj-406",
     "maxclass": "newobj",
     "numinlets": 1,
     "numoutlets": 1,
     "patching_rect": [
      910.0,
      1316.0,
      60.0,
      22.0
     ],
     "outlettype": [
      ""
     ],
     "text": "deferlow"
    }
   },
   {
    "box": {
     "id": "obj-407",
     "maxclass": "newobj",
     "numinlets": 1,
     "numoutlets": 1,
     "patching_rect": [
      992.0,
      1284.0,
      80.0,
      22.0
     ],
     "outlettype": [
      ""
     ],
     "text": "prepend set"
    }
   },
   {
    "box": {
     "id": "obj-408",
     "maxclass": "newobj",
     "numinlets": 2,
     "numoutlets": 3,
     "patching_rect": [
      910.0,
      1348.0,
      88.0,
      22.0
     ],
     "outlettype": [
      "",
      "",
      ""
     ],
     "text": "pattr map7",
     "varname": "pattr_map7"
    }
   },
   {
    "box": {
     "id": "obj-409",
     "maxclass": "newobj",
     "numinlets": 0,
     "numoutlets": 1,
     "patching_rect": [
      1006.0,
      1316.0,
      80.0,
      20.0
     ],
     "outlettype": [
      ""
     ],
     "text": "r ---restore"
    }
   },
   {
    "box": {
     "id": "obj-410",
     "maxclass": "newobj",
     "numinlets": 1,
     "numoutlets": 1,
     "patching_rect": [
      910.0,
      1380.0,
      110.0,
      22.0
     ],
     "outlettype": [
      ""
     ],
     "text": "prepend restore 7"
    }
   },
   {
    "box": {
     "id": "obj-411",
     "maxclass": "newobj",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      910.0,
      1412.0,
      80.0,
      20.0
     ],
     "text": "s ---jscmd"
    }
   },
   {
    "box": {
     "id": "obj-412",
     "maxclass": "comment",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      1080.0,
      956.0,
      320.0,
      18.0
     ],
     "text": "—— Slot 8 ——",
     "fontsize": 11.0,
     "fontface": 1
    }
   },
   {
    "box": {
     "id": "obj-413",
     "maxclass": "live.menu",
     "numinlets": 1,
     "numoutlets": 3,
     "patching_rect": [
      1080.0,
      980.0,
      50.0,
      15.0
     ],
     "outlettype": [
      "",
      "",
      ""
     ],
     "presentation": 1,
     "presentation_rect": [
      588.0,
      118.0,
      50.0,
      15.0
     ],
     "parameter_enable": 1,
     "varname": "S8_source",
     "saved_attribute_attributes": {
      "valueof": {
       "parameter_longname": "S8 Source",
       "parameter_shortname": "Src",
       "parameter_type": 2,
       "parameter_mmax": 8,
       "parameter_initial": [
        4
       ],
       "parameter_initial_enable": 1,
       "parameter_invisible": 1,
       "parameter_enum": [
        "L Open",
        "L Fist",
        "R Open",
        "R Fist",
        "H Dist",
        "L X",
        "L Y",
        "R X",
        "R Y"
       ]
      }
     }
    }
   },
   {
    "box": {
     "id": "obj-414",
     "maxclass": "flonum",
     "numinlets": 1,
     "numoutlets": 2,
     "patching_rect": [
      1138.0,
      980.0,
      46.0,
      22.0
     ],
     "outlettype": [
      "",
      "bang"
     ],
     "presentation": 1,
     "presentation_rect": [
      644.0,
      117.0,
      38.0,
      20.0
     ],
     "cantchange": 1,
     "numdecimalplaces": 2,
     "bgcolor": [
      0.18,
      0.18,
      0.18,
      1.0
     ],
     "textcolor": [
      0.9,
      0.9,
      0.9,
      1.0
     ]
    }
   },
   {
    "box": {
     "id": "obj-415",
     "maxclass": "textbutton",
     "numinlets": 1,
     "numoutlets": 3,
     "patching_rect": [
      1192.0,
      980.0,
      36.0,
      20.0
     ],
     "outlettype": [
      "",
      "",
      ""
     ],
     "text": "Map",
     "presentation": 1,
     "presentation_rect": [
      684.0,
      117.0,
      30.0,
      18.0
     ],
     "bgcolor": [
      0.22,
      0.22,
      0.22,
      1.0
     ],
     "bgoncolor": [
      0.98,
      0.65,
      0.12,
      1.0
     ],
     "textcolor": [
      0.88,
      0.88,
      0.88,
      1.0
     ],
     "textoncolor": [
      0.1,
      0.1,
      0.1,
      1.0
     ],
     "bordercolor": [
      0.38,
      0.38,
      0.38,
      1.0
     ],
     "rounded": 8.0
    }
   },
   {
    "box": {
     "id": "obj-416",
     "maxclass": "textbutton",
     "numinlets": 1,
     "numoutlets": 3,
     "patching_rect": [
      1234.0,
      980.0,
      20.0,
      20.0
     ],
     "outlettype": [
      "",
      "",
      ""
     ],
     "text": "x",
     "presentation": 1,
     "presentation_rect": [
      716.0,
      117.0,
      16.0,
      18.0
     ],
     "bgcolor": [
      0.22,
      0.22,
      0.22,
      1.0
     ],
     "bgoncolor": [
      0.98,
      0.65,
      0.12,
      1.0
     ],
     "textcolor": [
      0.88,
      0.88,
      0.88,
      1.0
     ],
     "textoncolor": [
      0.1,
      0.1,
      0.1,
      1.0
     ],
     "bordercolor": [
      0.38,
      0.38,
      0.38,
      1.0
     ],
     "rounded": 8.0
    }
   },
   {
    "box": {
     "id": "obj-417",
     "maxclass": "comment",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      1262.0,
      982.0,
      140.0,
      16.0
     ],
     "text": "--",
     "presentation": 1,
     "presentation_rect": [
      734.0,
      119.0,
      114.0,
      16.0
     ],
     "textcolor": [
      0.55,
      0.78,
      0.95,
      1.0
     ],
     "fontsize": 10.0
    }
   },
   {
    "box": {
     "id": "obj-418",
     "maxclass": "live.numbox",
     "numinlets": 1,
     "numoutlets": 2,
     "patching_rect": [
      1080.0,
      1008.0,
      44.0,
      15.0
     ],
     "outlettype": [
      "",
      "float"
     ],
     "presentation": 1,
     "presentation_rect": [
      852.0,
      119.0,
      38.0,
      15.0
     ],
     "parameter_enable": 1,
     "varname": "S8_min",
     "saved_attribute_attributes": {
      "valueof": {
       "parameter_longname": "S8 Min",
       "parameter_shortname": "Min",
       "parameter_type": 0,
       "parameter_mmin": 0.0,
       "parameter_mmax": 1.0,
       "parameter_initial": [
        0.0
       ],
       "parameter_initial_enable": 1,
       "parameter_unitstyle": 1,
       "parameter_invisible": 1
      }
     }
    }
   },
   {
    "box": {
     "id": "obj-419",
     "maxclass": "live.numbox",
     "numinlets": 1,
     "numoutlets": 2,
     "patching_rect": [
      1130.0,
      1008.0,
      44.0,
      15.0
     ],
     "outlettype": [
      "",
      "float"
     ],
     "presentation": 1,
     "presentation_rect": [
      892.0,
      119.0,
      38.0,
      15.0
     ],
     "parameter_enable": 1,
     "varname": "S8_max",
     "saved_attribute_attributes": {
      "valueof": {
       "parameter_longname": "S8 Max",
       "parameter_shortname": "Max",
       "parameter_type": 0,
       "parameter_mmin": 0.0,
       "parameter_mmax": 1.0,
       "parameter_initial": [
        1.0
       ],
       "parameter_initial_enable": 1,
       "parameter_unitstyle": 1,
       "parameter_invisible": 1
      }
     }
    }
   },
   {
    "box": {
     "id": "obj-420",
     "maxclass": "live.toggle",
     "numinlets": 1,
     "numoutlets": 1,
     "patching_rect": [
      1180.0,
      1008.0,
      15.0,
      15.0
     ],
     "outlettype": [
      ""
     ],
     "presentation": 1,
     "presentation_rect": [
      934.0,
      120.0,
      14.0,
      14.0
     ],
     "parameter_enable": 1,
     "varname": "S8_invert",
     "saved_attribute_attributes": {
      "valueof": {
       "parameter_longname": "S8 Invert",
       "parameter_shortname": "Inv",
       "parameter_type": 2,
       "parameter_mmax": 1,
       "parameter_initial": [
        0
       ],
       "parameter_initial_enable": 1,
       "parameter_invisible": 1,
       "parameter_enum": [
        "off",
        "on"
       ]
      }
     }
    }
   },
   {
    "box": {
     "id": "obj-421",
     "maxclass": "live.numbox",
     "numinlets": 1,
     "numoutlets": 2,
     "patching_rect": [
      1202.0,
      1008.0,
      44.0,
      15.0
     ],
     "outlettype": [
      "",
      "float"
     ],
     "presentation": 1,
     "presentation_rect": [
      950.0,
      119.0,
      40.0,
      15.0
     ],
     "parameter_enable": 1,
     "varname": "S8_smooth",
     "saved_attribute_attributes": {
      "valueof": {
       "parameter_longname": "S8 Smooth",
       "parameter_shortname": "Time",
       "parameter_type": 0,
       "parameter_mmin": 0.0,
       "parameter_mmax": 1000.0,
       "parameter_initial": [
        100.0
       ],
       "parameter_initial_enable": 1,
       "parameter_unitstyle": 2,
       "parameter_invisible": 1
      }
     }
    }
   },
   {
    "box": {
     "id": "obj-422",
     "maxclass": "live.toggle",
     "numinlets": 1,
     "numoutlets": 1,
     "patching_rect": [
      1252.0,
      1008.0,
      15.0,
      15.0
     ],
     "outlettype": [
      ""
     ],
     "presentation": 1,
     "presentation_rect": [
      994.0,
      120.0,
      14.0,
      14.0
     ],
     "parameter_enable": 1,
     "varname": "S8_enable",
     "saved_attribute_attributes": {
      "valueof": {
       "parameter_longname": "S8 Enable",
       "parameter_shortname": "On",
       "parameter_type": 2,
       "parameter_mmax": 1,
       "parameter_initial": [
        1
       ],
       "parameter_initial_enable": 1,
       "parameter_invisible": 1,
       "parameter_enum": [
        "off",
        "on"
       ]
      }
     }
    }
   },
   {
    "box": {
     "id": "obj-423",
     "maxclass": "newobj",
     "numinlets": 0,
     "numoutlets": 1,
     "patching_rect": [
      1276.0,
      1008.0,
      70.0,
      20.0
     ],
     "outlettype": [
      ""
     ],
     "text": "r ---wbang"
    }
   },
   {
    "box": {
     "id": "obj-424",
     "maxclass": "newobj",
     "numinlets": 0,
     "numoutlets": 1,
     "patching_rect": [
      1080.0,
      1042.0,
      48.0,
      20.0
     ],
     "outlettype": [
      ""
     ],
     "text": "r ---g1"
    }
   },
   {
    "box": {
     "id": "obj-425",
     "maxclass": "newobj",
     "numinlets": 0,
     "numoutlets": 1,
     "patching_rect": [
      1132.0,
      1042.0,
      48.0,
      20.0
     ],
     "outlettype": [
      ""
     ],
     "text": "r ---g2"
    }
   },
   {
    "box": {
     "id": "obj-426",
     "maxclass": "newobj",
     "numinlets": 0,
     "numoutlets": 1,
     "patching_rect": [
      1184.0,
      1042.0,
      48.0,
      20.0
     ],
     "outlettype": [
      ""
     ],
     "text": "r ---g3"
    }
   },
   {
    "box": {
     "id": "obj-427",
     "maxclass": "newobj",
     "numinlets": 0,
     "numoutlets": 1,
     "patching_rect": [
      1236.0,
      1042.0,
      48.0,
      20.0
     ],
     "outlettype": [
      ""
     ],
     "text": "r ---g4"
    }
   },
   {
    "box": {
     "id": "obj-428",
     "maxclass": "newobj",
     "numinlets": 0,
     "numoutlets": 1,
     "patching_rect": [
      1288.0,
      1042.0,
      48.0,
      20.0
     ],
     "outlettype": [
      ""
     ],
     "text": "r ---g5"
    }
   },
   {
    "box": {
     "id": "obj-429",
     "maxclass": "newobj",
     "numinlets": 0,
     "numoutlets": 1,
     "patching_rect": [
      1080.0,
      1068.0,
      48.0,
      20.0
     ],
     "outlettype": [
      ""
     ],
     "text": "r ---g6"
    }
   },
   {
    "box": {
     "id": "obj-430",
     "maxclass": "newobj",
     "numinlets": 0,
     "numoutlets": 1,
     "patching_rect": [
      1132.0,
      1068.0,
      48.0,
      20.0
     ],
     "outlettype": [
      ""
     ],
     "text": "r ---g7"
    }
   },
   {
    "box": {
     "id": "obj-431",
     "maxclass": "newobj",
     "numinlets": 0,
     "numoutlets": 1,
     "patching_rect": [
      1184.0,
      1068.0,
      48.0,
      20.0
     ],
     "outlettype": [
      ""
     ],
     "text": "r ---g8"
    }
   },
   {
    "box": {
     "id": "obj-432",
     "maxclass": "newobj",
     "numinlets": 0,
     "numoutlets": 1,
     "patching_rect": [
      1236.0,
      1068.0,
      48.0,
      20.0
     ],
     "outlettype": [
      ""
     ],
     "text": "r ---g9"
    }
   },
   {
    "box": {
     "id": "obj-433",
     "maxclass": "newobj",
     "numinlets": 2,
     "numoutlets": 1,
     "patching_rect": [
      1350.0,
      1042.0,
      34.0,
      22.0
     ],
     "outlettype": [
      "int"
     ],
     "text": "+ 1"
    }
   },
   {
    "box": {
     "id": "obj-434",
     "maxclass": "newobj",
     "numinlets": 10,
     "numoutlets": 1,
     "patching_rect": [
      1080.0,
      1100.0,
      160.0,
      22.0
     ],
     "outlettype": [
      ""
     ],
     "text": "switch 9"
    }
   },
   {
    "box": {
     "id": "obj-435",
     "maxclass": "newobj",
     "numinlets": 4,
     "numoutlets": 1,
     "patching_rect": [
      1080.0,
      1134.0,
      150.0,
      22.0
     ],
     "outlettype": [
      ""
     ],
     "text": "expr $f2 + ($f1 + $f4 * (1. - 2. * $f1)) * ($f3 - $f2)"
    }
   },
   {
    "box": {
     "id": "obj-436",
     "maxclass": "newobj",
     "numinlets": 2,
     "numoutlets": 1,
     "patching_rect": [
      1080.0,
      1168.0,
      80.0,
      22.0
     ],
     "outlettype": [
      ""
     ],
     "text": "pack 0. 100."
    }
   },
   {
    "box": {
     "id": "obj-437",
     "maxclass": "newobj",
     "numinlets": 3,
     "numoutlets": 2,
     "patching_rect": [
      1080.0,
      1202.0,
      70.0,
      22.0
     ],
     "outlettype": [
      "",
      "bang"
     ],
     "text": "line 0. 20"
    }
   },
   {
    "box": {
     "id": "obj-438",
     "maxclass": "newobj",
     "numinlets": 3,
     "numoutlets": 1,
     "patching_rect": [
      1080.0,
      1236.0,
      160.0,
      22.0
     ],
     "outlettype": [
      ""
     ],
     "text": "expr $f2 + $f1 * ($f3 - $f2)"
    }
   },
   {
    "box": {
     "id": "obj-439",
     "maxclass": "newobj",
     "numinlets": 2,
     "numoutlets": 2,
     "patching_rect": [
      1080.0,
      1270.0,
      90.0,
      22.0
     ],
     "outlettype": [
      "",
      ""
     ],
     "text": "live.remote~"
    }
   },
   {
    "box": {
     "id": "obj-440",
     "maxclass": "message",
     "numinlets": 2,
     "numoutlets": 1,
     "patching_rect": [
      1260.0,
      1100.0,
      56.0,
      22.0
     ],
     "outlettype": [
      ""
     ],
     "text": "map 8"
    }
   },
   {
    "box": {
     "id": "obj-441",
     "maxclass": "message",
     "numinlets": 2,
     "numoutlets": 1,
     "patching_rect": [
      1260.0,
      1130.0,
      66.0,
      22.0
     ],
     "outlettype": [
      ""
     ],
     "text": "unmap 8"
    }
   },
   {
    "box": {
     "id": "obj-442",
     "maxclass": "message",
     "numinlets": 2,
     "numoutlets": 1,
     "patching_rect": [
      1260.0,
      1160.0,
      86.0,
      22.0
     ],
     "outlettype": [
      ""
     ],
     "text": "enable 8 $1"
    }
   },
   {
    "box": {
     "id": "obj-443",
     "maxclass": "newobj",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      1260.0,
      1192.0,
      80.0,
      20.0
     ],
     "text": "s ---jscmd"
    }
   },
   {
    "box": {
     "id": "obj-444",
     "maxclass": "newobj",
     "numinlets": 0,
     "numoutlets": 1,
     "patching_rect": [
      1260.0,
      1222.0,
      70.0,
      20.0
     ],
     "outlettype": [
      ""
     ],
     "text": "r ---slot8"
    }
   },
   {
    "box": {
     "id": "obj-445",
     "maxclass": "newobj",
     "numinlets": 1,
     "numoutlets": 5,
     "patching_rect": [
      1260.0,
      1252.0,
      170.0,
      22.0
     ],
     "outlettype": [
      "",
      "",
      "",
      "",
      ""
     ],
     "text": "route id display path range"
    }
   },
   {
    "box": {
     "id": "obj-446",
     "maxclass": "newobj",
     "numinlets": 1,
     "numoutlets": 2,
     "patching_rect": [
      1430.0,
      1284.0,
      80.0,
      22.0
     ],
     "outlettype": [
      "float",
      "float"
     ],
     "text": "unpack 0. 1."
    }
   },
   {
    "box": {
     "id": "obj-447",
     "maxclass": "newobj",
     "numinlets": 1,
     "numoutlets": 1,
     "patching_rect": [
      1260.0,
      1284.0,
      75.0,
      22.0
     ],
     "outlettype": [
      ""
     ],
     "text": "prepend id"
    }
   },
   {
    "box": {
     "id": "obj-448",
     "maxclass": "newobj",
     "numinlets": 1,
     "numoutlets": 1,
     "patching_rect": [
      1260.0,
      1316.0,
      60.0,
      22.0
     ],
     "outlettype": [
      ""
     ],
     "text": "deferlow"
    }
   },
   {
    "box": {
     "id": "obj-449",
     "maxclass": "newobj",
     "numinlets": 1,
     "numoutlets": 1,
     "patching_rect": [
      1342.0,
      1284.0,
      80.0,
      22.0
     ],
     "outlettype": [
      ""
     ],
     "text": "prepend set"
    }
   },
   {
    "box": {
     "id": "obj-450",
     "maxclass": "newobj",
     "numinlets": 2,
     "numoutlets": 3,
     "patching_rect": [
      1260.0,
      1348.0,
      88.0,
      22.0
     ],
     "outlettype": [
      "",
      "",
      ""
     ],
     "text": "pattr map8",
     "varname": "pattr_map8"
    }
   },
   {
    "box": {
     "id": "obj-451",
     "maxclass": "newobj",
     "numinlets": 0,
     "numoutlets": 1,
     "patching_rect": [
      1356.0,
      1316.0,
      80.0,
      20.0
     ],
     "outlettype": [
      ""
     ],
     "text": "r ---restore"
    }
   },
   {
    "box": {
     "id": "obj-452",
     "maxclass": "newobj",
     "numinlets": 1,
     "numoutlets": 1,
     "patching_rect": [
      1260.0,
      1380.0,
      110.0,
      22.0
     ],
     "outlettype": [
      ""
     ],
     "text": "prepend restore 8"
    }
   },
   {
    "box": {
     "id": "obj-453",
     "maxclass": "newobj",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      1260.0,
      1412.0,
      80.0,
      20.0
     ],
     "text": "s ---jscmd"
    }
   }
  ],
  "lines": [
   {
    "patchline": {
     "source": [
      "obj-9",
      0
     ],
     "destination": [
      "obj-8",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-8",
      0
     ],
     "destination": [
      "obj-10",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-10",
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
      "obj-11",
      0
     ],
     "destination": [
      "obj-12",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-12",
      0
     ],
     "destination": [
      "obj-14",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-14",
      0
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
      "obj-15",
      0
     ],
     "destination": [
      "obj-16",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-16",
      0
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
      "obj-15",
      1
     ],
     "destination": [
      "obj-18",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-18",
      0
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
      "obj-15",
      2
     ],
     "destination": [
      "obj-20",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-20",
      0
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
      "obj-15",
      3
     ],
     "destination": [
      "obj-22",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-22",
      0
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
      "obj-15",
      4
     ],
     "destination": [
      "obj-24",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-24",
      0
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
      "obj-15",
      5
     ],
     "destination": [
      "obj-26",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-26",
      0
     ],
     "destination": [
      "obj-27",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-15",
      6
     ],
     "destination": [
      "obj-28",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-28",
      0
     ],
     "destination": [
      "obj-29",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-15",
      7
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
      "obj-30",
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
      "obj-15",
      8
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
      "obj-32",
      0
     ],
     "destination": [
      "obj-33",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-14",
      0
     ],
     "destination": [
      "obj-34",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-34",
      0
     ],
     "destination": [
      "obj-35",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-34",
      1
     ],
     "destination": [
      "obj-36",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-36",
      0
     ],
     "destination": [
      "obj-38",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-35",
      0
     ],
     "destination": [
      "obj-37",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-37",
      0
     ],
     "destination": [
      "obj-38",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-37",
      0
     ],
     "destination": [
      "obj-42",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-37",
      0
     ],
     "destination": [
      "obj-44",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-15",
      9
     ],
     "destination": [
      "obj-42",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-15",
      10
     ],
     "destination": [
      "obj-44",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-15",
      11
     ],
     "destination": [
      "obj-46",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-46",
      0
     ],
     "destination": [
      "obj-47",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-46",
      1
     ],
     "destination": [
      "obj-49",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-49",
      0
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
      "obj-47",
      0
     ],
     "destination": [
      "obj-48",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-48",
      0
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
      "obj-15",
      12
     ],
     "destination": [
      "obj-50",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-51",
      0
     ],
     "destination": [
      "obj-52",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-16",
      0
     ],
     "destination": [
      "obj-54",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-18",
      0
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
      "obj-20",
      0
     ],
     "destination": [
      "obj-57",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-22",
      0
     ],
     "destination": [
      "obj-58",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-24",
      0
     ],
     "destination": [
      "obj-60",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-26",
      0
     ],
     "destination": [
      "obj-61",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-28",
      0
     ],
     "destination": [
      "obj-62",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-30",
      0
     ],
     "destination": [
      "obj-63",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-32",
      0
     ],
     "destination": [
      "obj-64",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-66",
      0
     ],
     "destination": [
      "obj-67",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-67",
      0
     ],
     "destination": [
      "obj-68",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-68",
      2
     ],
     "destination": [
      "obj-69",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-69",
      0
     ],
     "destination": [
      "obj-70",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-68",
      1
     ],
     "destination": [
      "obj-71",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-68",
      0
     ],
     "destination": [
      "obj-72",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-72",
      0
     ],
     "destination": [
      "obj-73",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-75",
      0
     ],
     "destination": [
      "obj-76",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-76",
      0
     ],
     "destination": [
      "obj-77",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-76",
      1
     ],
     "destination": [
      "obj-78",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-76",
      2
     ],
     "destination": [
      "obj-79",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-76",
      3
     ],
     "destination": [
      "obj-80",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-76",
      4
     ],
     "destination": [
      "obj-81",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-76",
      5
     ],
     "destination": [
      "obj-82",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-76",
      6
     ],
     "destination": [
      "obj-83",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-76",
      7
     ],
     "destination": [
      "obj-84",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-86",
      0
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
      "obj-68",
      2
     ],
     "destination": [
      "obj-86",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-10",
      0
     ],
     "destination": [
      "obj-87",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-87",
      0
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
      "obj-88",
      0
     ],
     "destination": [
      "obj-90",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-90",
      0
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
      "obj-91",
      0
     ],
     "destination": [
      "obj-93",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-93",
      2
     ],
     "destination": [
      "obj-8",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-93",
      1
     ],
     "destination": [
      "obj-88",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-93",
      0
     ],
     "destination": [
      "obj-94",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-94",
      0
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
      "obj-92",
      0
     ],
     "destination": [
      "obj-95",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-95",
      0
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
      "obj-13",
      0
     ],
     "destination": [
      "obj-96",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-96",
      0
     ],
     "destination": [
      "obj-97",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-129",
      0
     ],
     "destination": [
      "obj-119",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-129",
      0
     ],
     "destination": [
      "obj-124",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-129",
      0
     ],
     "destination": [
      "obj-125",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-129",
      0
     ],
     "destination": [
      "obj-126",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-129",
      0
     ],
     "destination": [
      "obj-127",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-129",
      0
     ],
     "destination": [
      "obj-128",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-119",
      0
     ],
     "destination": [
      "obj-139",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-139",
      0
     ],
     "destination": [
      "obj-140",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-130",
      0
     ],
     "destination": [
      "obj-140",
      1
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-131",
      0
     ],
     "destination": [
      "obj-140",
      2
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-132",
      0
     ],
     "destination": [
      "obj-140",
      3
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-133",
      0
     ],
     "destination": [
      "obj-140",
      4
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-134",
      0
     ],
     "destination": [
      "obj-140",
      5
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-135",
      0
     ],
     "destination": [
      "obj-140",
      6
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-136",
      0
     ],
     "destination": [
      "obj-140",
      7
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-137",
      0
     ],
     "destination": [
      "obj-140",
      8
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-138",
      0
     ],
     "destination": [
      "obj-140",
      9
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-140",
      0
     ],
     "destination": [
      "obj-141",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-124",
      0
     ],
     "destination": [
      "obj-141",
      1
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-125",
      0
     ],
     "destination": [
      "obj-141",
      2
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-126",
      0
     ],
     "destination": [
      "obj-141",
      3
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-141",
      0
     ],
     "destination": [
      "obj-120",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-141",
      0
     ],
     "destination": [
      "obj-142",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-127",
      0
     ],
     "destination": [
      "obj-142",
      1
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-142",
      0
     ],
     "destination": [
      "obj-143",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-143",
      0
     ],
     "destination": [
      "obj-144",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-144",
      0
     ],
     "destination": [
      "obj-145",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-121",
      0
     ],
     "destination": [
      "obj-146",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-122",
      0
     ],
     "destination": [
      "obj-147",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-128",
      0
     ],
     "destination": [
      "obj-148",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-146",
      0
     ],
     "destination": [
      "obj-149",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-147",
      0
     ],
     "destination": [
      "obj-149",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-148",
      0
     ],
     "destination": [
      "obj-149",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-151",
      3
     ],
     "destination": [
      "obj-152",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-152",
      0
     ],
     "destination": [
      "obj-144",
      1
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-152",
      1
     ],
     "destination": [
      "obj-144",
      2
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-150",
      0
     ],
     "destination": [
      "obj-151",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-151",
      0
     ],
     "destination": [
      "obj-153",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-153",
      0
     ],
     "destination": [
      "obj-154",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-154",
      0
     ],
     "destination": [
      "obj-145",
      1
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-151",
      1
     ],
     "destination": [
      "obj-155",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-155",
      0
     ],
     "destination": [
      "obj-123",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-151",
      2
     ],
     "destination": [
      "obj-156",
      1
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-157",
      0
     ],
     "destination": [
      "obj-156",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-156",
      0
     ],
     "destination": [
      "obj-158",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-158",
      0
     ],
     "destination": [
      "obj-159",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-171",
      0
     ],
     "destination": [
      "obj-161",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-171",
      0
     ],
     "destination": [
      "obj-166",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-171",
      0
     ],
     "destination": [
      "obj-167",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-171",
      0
     ],
     "destination": [
      "obj-168",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-171",
      0
     ],
     "destination": [
      "obj-169",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-171",
      0
     ],
     "destination": [
      "obj-170",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-161",
      0
     ],
     "destination": [
      "obj-181",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-181",
      0
     ],
     "destination": [
      "obj-182",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-172",
      0
     ],
     "destination": [
      "obj-182",
      1
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-173",
      0
     ],
     "destination": [
      "obj-182",
      2
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-174",
      0
     ],
     "destination": [
      "obj-182",
      3
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-175",
      0
     ],
     "destination": [
      "obj-182",
      4
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-176",
      0
     ],
     "destination": [
      "obj-182",
      5
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-177",
      0
     ],
     "destination": [
      "obj-182",
      6
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-178",
      0
     ],
     "destination": [
      "obj-182",
      7
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-179",
      0
     ],
     "destination": [
      "obj-182",
      8
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-180",
      0
     ],
     "destination": [
      "obj-182",
      9
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-182",
      0
     ],
     "destination": [
      "obj-183",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-166",
      0
     ],
     "destination": [
      "obj-183",
      1
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-167",
      0
     ],
     "destination": [
      "obj-183",
      2
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-168",
      0
     ],
     "destination": [
      "obj-183",
      3
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-183",
      0
     ],
     "destination": [
      "obj-162",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-183",
      0
     ],
     "destination": [
      "obj-184",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-169",
      0
     ],
     "destination": [
      "obj-184",
      1
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-184",
      0
     ],
     "destination": [
      "obj-185",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-185",
      0
     ],
     "destination": [
      "obj-186",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-186",
      0
     ],
     "destination": [
      "obj-187",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-163",
      0
     ],
     "destination": [
      "obj-188",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-164",
      0
     ],
     "destination": [
      "obj-189",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-170",
      0
     ],
     "destination": [
      "obj-190",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-188",
      0
     ],
     "destination": [
      "obj-191",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-189",
      0
     ],
     "destination": [
      "obj-191",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-190",
      0
     ],
     "destination": [
      "obj-191",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-193",
      3
     ],
     "destination": [
      "obj-194",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-194",
      0
     ],
     "destination": [
      "obj-186",
      1
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-194",
      1
     ],
     "destination": [
      "obj-186",
      2
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-192",
      0
     ],
     "destination": [
      "obj-193",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-193",
      0
     ],
     "destination": [
      "obj-195",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-195",
      0
     ],
     "destination": [
      "obj-196",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-196",
      0
     ],
     "destination": [
      "obj-187",
      1
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-193",
      1
     ],
     "destination": [
      "obj-197",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-197",
      0
     ],
     "destination": [
      "obj-165",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-193",
      2
     ],
     "destination": [
      "obj-198",
      1
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-199",
      0
     ],
     "destination": [
      "obj-198",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-198",
      0
     ],
     "destination": [
      "obj-200",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-200",
      0
     ],
     "destination": [
      "obj-201",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-213",
      0
     ],
     "destination": [
      "obj-203",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-213",
      0
     ],
     "destination": [
      "obj-208",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-213",
      0
     ],
     "destination": [
      "obj-209",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-213",
      0
     ],
     "destination": [
      "obj-210",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-213",
      0
     ],
     "destination": [
      "obj-211",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-213",
      0
     ],
     "destination": [
      "obj-212",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-203",
      0
     ],
     "destination": [
      "obj-223",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-223",
      0
     ],
     "destination": [
      "obj-224",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-214",
      0
     ],
     "destination": [
      "obj-224",
      1
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-215",
      0
     ],
     "destination": [
      "obj-224",
      2
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-216",
      0
     ],
     "destination": [
      "obj-224",
      3
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-217",
      0
     ],
     "destination": [
      "obj-224",
      4
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-218",
      0
     ],
     "destination": [
      "obj-224",
      5
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-219",
      0
     ],
     "destination": [
      "obj-224",
      6
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-220",
      0
     ],
     "destination": [
      "obj-224",
      7
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-221",
      0
     ],
     "destination": [
      "obj-224",
      8
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-222",
      0
     ],
     "destination": [
      "obj-224",
      9
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-224",
      0
     ],
     "destination": [
      "obj-225",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-208",
      0
     ],
     "destination": [
      "obj-225",
      1
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-209",
      0
     ],
     "destination": [
      "obj-225",
      2
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-210",
      0
     ],
     "destination": [
      "obj-225",
      3
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-225",
      0
     ],
     "destination": [
      "obj-204",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-225",
      0
     ],
     "destination": [
      "obj-226",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-211",
      0
     ],
     "destination": [
      "obj-226",
      1
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-226",
      0
     ],
     "destination": [
      "obj-227",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-227",
      0
     ],
     "destination": [
      "obj-228",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-228",
      0
     ],
     "destination": [
      "obj-229",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-205",
      0
     ],
     "destination": [
      "obj-230",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-206",
      0
     ],
     "destination": [
      "obj-231",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-212",
      0
     ],
     "destination": [
      "obj-232",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-230",
      0
     ],
     "destination": [
      "obj-233",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-231",
      0
     ],
     "destination": [
      "obj-233",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-232",
      0
     ],
     "destination": [
      "obj-233",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-235",
      3
     ],
     "destination": [
      "obj-236",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-236",
      0
     ],
     "destination": [
      "obj-228",
      1
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-236",
      1
     ],
     "destination": [
      "obj-228",
      2
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-234",
      0
     ],
     "destination": [
      "obj-235",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-235",
      0
     ],
     "destination": [
      "obj-237",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-237",
      0
     ],
     "destination": [
      "obj-238",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-238",
      0
     ],
     "destination": [
      "obj-229",
      1
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-235",
      1
     ],
     "destination": [
      "obj-239",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-239",
      0
     ],
     "destination": [
      "obj-207",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-235",
      2
     ],
     "destination": [
      "obj-240",
      1
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-241",
      0
     ],
     "destination": [
      "obj-240",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-240",
      0
     ],
     "destination": [
      "obj-242",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-242",
      0
     ],
     "destination": [
      "obj-243",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-255",
      0
     ],
     "destination": [
      "obj-245",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-255",
      0
     ],
     "destination": [
      "obj-250",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-255",
      0
     ],
     "destination": [
      "obj-251",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-255",
      0
     ],
     "destination": [
      "obj-252",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-255",
      0
     ],
     "destination": [
      "obj-253",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-255",
      0
     ],
     "destination": [
      "obj-254",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-245",
      0
     ],
     "destination": [
      "obj-265",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-265",
      0
     ],
     "destination": [
      "obj-266",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-256",
      0
     ],
     "destination": [
      "obj-266",
      1
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-257",
      0
     ],
     "destination": [
      "obj-266",
      2
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-258",
      0
     ],
     "destination": [
      "obj-266",
      3
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-259",
      0
     ],
     "destination": [
      "obj-266",
      4
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-260",
      0
     ],
     "destination": [
      "obj-266",
      5
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-261",
      0
     ],
     "destination": [
      "obj-266",
      6
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-262",
      0
     ],
     "destination": [
      "obj-266",
      7
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-263",
      0
     ],
     "destination": [
      "obj-266",
      8
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-264",
      0
     ],
     "destination": [
      "obj-266",
      9
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-266",
      0
     ],
     "destination": [
      "obj-267",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-250",
      0
     ],
     "destination": [
      "obj-267",
      1
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-251",
      0
     ],
     "destination": [
      "obj-267",
      2
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-252",
      0
     ],
     "destination": [
      "obj-267",
      3
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-267",
      0
     ],
     "destination": [
      "obj-246",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-267",
      0
     ],
     "destination": [
      "obj-268",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-253",
      0
     ],
     "destination": [
      "obj-268",
      1
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-268",
      0
     ],
     "destination": [
      "obj-269",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-269",
      0
     ],
     "destination": [
      "obj-270",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-270",
      0
     ],
     "destination": [
      "obj-271",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-247",
      0
     ],
     "destination": [
      "obj-272",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-248",
      0
     ],
     "destination": [
      "obj-273",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-254",
      0
     ],
     "destination": [
      "obj-274",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-272",
      0
     ],
     "destination": [
      "obj-275",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-273",
      0
     ],
     "destination": [
      "obj-275",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-274",
      0
     ],
     "destination": [
      "obj-275",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-277",
      3
     ],
     "destination": [
      "obj-278",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-278",
      0
     ],
     "destination": [
      "obj-270",
      1
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-278",
      1
     ],
     "destination": [
      "obj-270",
      2
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-276",
      0
     ],
     "destination": [
      "obj-277",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-277",
      0
     ],
     "destination": [
      "obj-279",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-279",
      0
     ],
     "destination": [
      "obj-280",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-280",
      0
     ],
     "destination": [
      "obj-271",
      1
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-277",
      1
     ],
     "destination": [
      "obj-281",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-281",
      0
     ],
     "destination": [
      "obj-249",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-277",
      2
     ],
     "destination": [
      "obj-282",
      1
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-283",
      0
     ],
     "destination": [
      "obj-282",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-282",
      0
     ],
     "destination": [
      "obj-284",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-284",
      0
     ],
     "destination": [
      "obj-285",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-297",
      0
     ],
     "destination": [
      "obj-287",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-297",
      0
     ],
     "destination": [
      "obj-292",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-297",
      0
     ],
     "destination": [
      "obj-293",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-297",
      0
     ],
     "destination": [
      "obj-294",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-297",
      0
     ],
     "destination": [
      "obj-295",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-297",
      0
     ],
     "destination": [
      "obj-296",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-287",
      0
     ],
     "destination": [
      "obj-307",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-307",
      0
     ],
     "destination": [
      "obj-308",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-298",
      0
     ],
     "destination": [
      "obj-308",
      1
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-299",
      0
     ],
     "destination": [
      "obj-308",
      2
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-300",
      0
     ],
     "destination": [
      "obj-308",
      3
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-301",
      0
     ],
     "destination": [
      "obj-308",
      4
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-302",
      0
     ],
     "destination": [
      "obj-308",
      5
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-303",
      0
     ],
     "destination": [
      "obj-308",
      6
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-304",
      0
     ],
     "destination": [
      "obj-308",
      7
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-305",
      0
     ],
     "destination": [
      "obj-308",
      8
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-306",
      0
     ],
     "destination": [
      "obj-308",
      9
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-308",
      0
     ],
     "destination": [
      "obj-309",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-292",
      0
     ],
     "destination": [
      "obj-309",
      1
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-293",
      0
     ],
     "destination": [
      "obj-309",
      2
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-294",
      0
     ],
     "destination": [
      "obj-309",
      3
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-309",
      0
     ],
     "destination": [
      "obj-288",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-309",
      0
     ],
     "destination": [
      "obj-310",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-295",
      0
     ],
     "destination": [
      "obj-310",
      1
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-310",
      0
     ],
     "destination": [
      "obj-311",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-311",
      0
     ],
     "destination": [
      "obj-312",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-312",
      0
     ],
     "destination": [
      "obj-313",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-289",
      0
     ],
     "destination": [
      "obj-314",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-290",
      0
     ],
     "destination": [
      "obj-315",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-296",
      0
     ],
     "destination": [
      "obj-316",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-314",
      0
     ],
     "destination": [
      "obj-317",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-315",
      0
     ],
     "destination": [
      "obj-317",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-316",
      0
     ],
     "destination": [
      "obj-317",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-319",
      3
     ],
     "destination": [
      "obj-320",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-320",
      0
     ],
     "destination": [
      "obj-312",
      1
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-320",
      1
     ],
     "destination": [
      "obj-312",
      2
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-318",
      0
     ],
     "destination": [
      "obj-319",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-319",
      0
     ],
     "destination": [
      "obj-321",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-321",
      0
     ],
     "destination": [
      "obj-322",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-322",
      0
     ],
     "destination": [
      "obj-313",
      1
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-319",
      1
     ],
     "destination": [
      "obj-323",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-323",
      0
     ],
     "destination": [
      "obj-291",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-319",
      2
     ],
     "destination": [
      "obj-324",
      1
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-325",
      0
     ],
     "destination": [
      "obj-324",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-324",
      0
     ],
     "destination": [
      "obj-326",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-326",
      0
     ],
     "destination": [
      "obj-327",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-339",
      0
     ],
     "destination": [
      "obj-329",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-339",
      0
     ],
     "destination": [
      "obj-334",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-339",
      0
     ],
     "destination": [
      "obj-335",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-339",
      0
     ],
     "destination": [
      "obj-336",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-339",
      0
     ],
     "destination": [
      "obj-337",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-339",
      0
     ],
     "destination": [
      "obj-338",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-329",
      0
     ],
     "destination": [
      "obj-349",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-349",
      0
     ],
     "destination": [
      "obj-350",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-340",
      0
     ],
     "destination": [
      "obj-350",
      1
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-341",
      0
     ],
     "destination": [
      "obj-350",
      2
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-342",
      0
     ],
     "destination": [
      "obj-350",
      3
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-343",
      0
     ],
     "destination": [
      "obj-350",
      4
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-344",
      0
     ],
     "destination": [
      "obj-350",
      5
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-345",
      0
     ],
     "destination": [
      "obj-350",
      6
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-346",
      0
     ],
     "destination": [
      "obj-350",
      7
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-347",
      0
     ],
     "destination": [
      "obj-350",
      8
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-348",
      0
     ],
     "destination": [
      "obj-350",
      9
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-350",
      0
     ],
     "destination": [
      "obj-351",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-334",
      0
     ],
     "destination": [
      "obj-351",
      1
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-335",
      0
     ],
     "destination": [
      "obj-351",
      2
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-336",
      0
     ],
     "destination": [
      "obj-351",
      3
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-351",
      0
     ],
     "destination": [
      "obj-330",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-351",
      0
     ],
     "destination": [
      "obj-352",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-337",
      0
     ],
     "destination": [
      "obj-352",
      1
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-352",
      0
     ],
     "destination": [
      "obj-353",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-353",
      0
     ],
     "destination": [
      "obj-354",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-354",
      0
     ],
     "destination": [
      "obj-355",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-331",
      0
     ],
     "destination": [
      "obj-356",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-332",
      0
     ],
     "destination": [
      "obj-357",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-338",
      0
     ],
     "destination": [
      "obj-358",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-356",
      0
     ],
     "destination": [
      "obj-359",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-357",
      0
     ],
     "destination": [
      "obj-359",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-358",
      0
     ],
     "destination": [
      "obj-359",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-361",
      3
     ],
     "destination": [
      "obj-362",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-362",
      0
     ],
     "destination": [
      "obj-354",
      1
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-362",
      1
     ],
     "destination": [
      "obj-354",
      2
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-360",
      0
     ],
     "destination": [
      "obj-361",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-361",
      0
     ],
     "destination": [
      "obj-363",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-363",
      0
     ],
     "destination": [
      "obj-364",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-364",
      0
     ],
     "destination": [
      "obj-355",
      1
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-361",
      1
     ],
     "destination": [
      "obj-365",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-365",
      0
     ],
     "destination": [
      "obj-333",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-361",
      2
     ],
     "destination": [
      "obj-366",
      1
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-367",
      0
     ],
     "destination": [
      "obj-366",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-366",
      0
     ],
     "destination": [
      "obj-368",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-368",
      0
     ],
     "destination": [
      "obj-369",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-381",
      0
     ],
     "destination": [
      "obj-371",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-381",
      0
     ],
     "destination": [
      "obj-376",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-381",
      0
     ],
     "destination": [
      "obj-377",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-381",
      0
     ],
     "destination": [
      "obj-378",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-381",
      0
     ],
     "destination": [
      "obj-379",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-381",
      0
     ],
     "destination": [
      "obj-380",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-371",
      0
     ],
     "destination": [
      "obj-391",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-391",
      0
     ],
     "destination": [
      "obj-392",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-382",
      0
     ],
     "destination": [
      "obj-392",
      1
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-383",
      0
     ],
     "destination": [
      "obj-392",
      2
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-384",
      0
     ],
     "destination": [
      "obj-392",
      3
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-385",
      0
     ],
     "destination": [
      "obj-392",
      4
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-386",
      0
     ],
     "destination": [
      "obj-392",
      5
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-387",
      0
     ],
     "destination": [
      "obj-392",
      6
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-388",
      0
     ],
     "destination": [
      "obj-392",
      7
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-389",
      0
     ],
     "destination": [
      "obj-392",
      8
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-390",
      0
     ],
     "destination": [
      "obj-392",
      9
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-392",
      0
     ],
     "destination": [
      "obj-393",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-376",
      0
     ],
     "destination": [
      "obj-393",
      1
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-377",
      0
     ],
     "destination": [
      "obj-393",
      2
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-378",
      0
     ],
     "destination": [
      "obj-393",
      3
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-393",
      0
     ],
     "destination": [
      "obj-372",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-393",
      0
     ],
     "destination": [
      "obj-394",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-379",
      0
     ],
     "destination": [
      "obj-394",
      1
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-394",
      0
     ],
     "destination": [
      "obj-395",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-395",
      0
     ],
     "destination": [
      "obj-396",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-396",
      0
     ],
     "destination": [
      "obj-397",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-373",
      0
     ],
     "destination": [
      "obj-398",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-374",
      0
     ],
     "destination": [
      "obj-399",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-380",
      0
     ],
     "destination": [
      "obj-400",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-398",
      0
     ],
     "destination": [
      "obj-401",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-399",
      0
     ],
     "destination": [
      "obj-401",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-400",
      0
     ],
     "destination": [
      "obj-401",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-403",
      3
     ],
     "destination": [
      "obj-404",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-404",
      0
     ],
     "destination": [
      "obj-396",
      1
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-404",
      1
     ],
     "destination": [
      "obj-396",
      2
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-402",
      0
     ],
     "destination": [
      "obj-403",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-403",
      0
     ],
     "destination": [
      "obj-405",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-405",
      0
     ],
     "destination": [
      "obj-406",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-406",
      0
     ],
     "destination": [
      "obj-397",
      1
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-403",
      1
     ],
     "destination": [
      "obj-407",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-407",
      0
     ],
     "destination": [
      "obj-375",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-403",
      2
     ],
     "destination": [
      "obj-408",
      1
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-409",
      0
     ],
     "destination": [
      "obj-408",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-408",
      0
     ],
     "destination": [
      "obj-410",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-410",
      0
     ],
     "destination": [
      "obj-411",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-423",
      0
     ],
     "destination": [
      "obj-413",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-423",
      0
     ],
     "destination": [
      "obj-418",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-423",
      0
     ],
     "destination": [
      "obj-419",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-423",
      0
     ],
     "destination": [
      "obj-420",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-423",
      0
     ],
     "destination": [
      "obj-421",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-423",
      0
     ],
     "destination": [
      "obj-422",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-413",
      0
     ],
     "destination": [
      "obj-433",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-433",
      0
     ],
     "destination": [
      "obj-434",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-424",
      0
     ],
     "destination": [
      "obj-434",
      1
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-425",
      0
     ],
     "destination": [
      "obj-434",
      2
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-426",
      0
     ],
     "destination": [
      "obj-434",
      3
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-427",
      0
     ],
     "destination": [
      "obj-434",
      4
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-428",
      0
     ],
     "destination": [
      "obj-434",
      5
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-429",
      0
     ],
     "destination": [
      "obj-434",
      6
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-430",
      0
     ],
     "destination": [
      "obj-434",
      7
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-431",
      0
     ],
     "destination": [
      "obj-434",
      8
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-432",
      0
     ],
     "destination": [
      "obj-434",
      9
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-434",
      0
     ],
     "destination": [
      "obj-435",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-418",
      0
     ],
     "destination": [
      "obj-435",
      1
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-419",
      0
     ],
     "destination": [
      "obj-435",
      2
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-420",
      0
     ],
     "destination": [
      "obj-435",
      3
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-435",
      0
     ],
     "destination": [
      "obj-414",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-435",
      0
     ],
     "destination": [
      "obj-436",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-421",
      0
     ],
     "destination": [
      "obj-436",
      1
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-436",
      0
     ],
     "destination": [
      "obj-437",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-437",
      0
     ],
     "destination": [
      "obj-438",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-438",
      0
     ],
     "destination": [
      "obj-439",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-415",
      0
     ],
     "destination": [
      "obj-440",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-416",
      0
     ],
     "destination": [
      "obj-441",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-422",
      0
     ],
     "destination": [
      "obj-442",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-440",
      0
     ],
     "destination": [
      "obj-443",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-441",
      0
     ],
     "destination": [
      "obj-443",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-442",
      0
     ],
     "destination": [
      "obj-443",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-445",
      3
     ],
     "destination": [
      "obj-446",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-446",
      0
     ],
     "destination": [
      "obj-438",
      1
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-446",
      1
     ],
     "destination": [
      "obj-438",
      2
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-444",
      0
     ],
     "destination": [
      "obj-445",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-445",
      0
     ],
     "destination": [
      "obj-447",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-447",
      0
     ],
     "destination": [
      "obj-448",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-448",
      0
     ],
     "destination": [
      "obj-439",
      1
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-445",
      1
     ],
     "destination": [
      "obj-449",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-449",
      0
     ],
     "destination": [
      "obj-417",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-445",
      2
     ],
     "destination": [
      "obj-450",
      1
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-451",
      0
     ],
     "destination": [
      "obj-450",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-450",
      0
     ],
     "destination": [
      "obj-452",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-452",
      0
     ],
     "destination": [
      "obj-453",
      0
     ]
    }
   }
  ],
  "dependency_cache": [],
  "latency": 0,
  "project": {
   "version": 1,
   "creationdate": 3590052786,
   "modificationdate": 3590052786,
   "viewrect": [
    0.0,
    0.0,
    300.0,
    500.0
   ],
   "autoorganize": 1,
   "hideprojectwindow": 1,
   "showdependencies": 1,
   "autolocalize": 0,
   "contents": {
    "patchers": {}
   },
   "layout": {},
   "searchpath": {},
   "detailsvisible": 0,
   "amxdtype": 1835887981,
   "readonly": 0,
   "devpathtype": 0,
   "devpath": ".",
   "sortmode": 0,
   "viewmode": 0
  },
  "autosave": 0
 }
}