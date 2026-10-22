# 演示预设

设备的出厂初始值即为演示预设：所有映射槽 Min=0 / Max=1 /
Inv 关 / Time=100ms / On 开，前 5 个槽的 Src 已按顺序对应
5 个手势，Port=9000。

## 两分钟演示流程（推荐给第一次使用的人）

1. MIDI 轨道放一个 **Wavetable**（或任意乐器），后面挂
   **Auto Filter** 和 **Reverb**
2. 同一轨道最前面放 **Gesture Control**，点 **Launch**
3. Slot 1（L Open）→ Map → 点 Auto Filter 的 Frequency
4. Slot 5（H Dist）→ Map → 点 Reverb 的 Dry/Wet
5. Slot 4（R Fist）→ Map → 点 Auto Filter 的 Device On，
   并把该槽 Inv 打开（握拳 = 关闭滤波器）
6. 弹一段循环：左手张合扫滤波，双手开合控制空间感，
   右手握拳一键切效果

保存 Live Set 后所有映射与设置随工程恢复。
